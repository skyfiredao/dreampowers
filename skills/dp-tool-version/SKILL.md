---
name: dp-tool-version
description: Use when committing chapter drafts, managing version history, or rolling back manuscript changes via Git
---

<SUBAGENT-STOP>
如果你是被派遣执行特定任务的子代理，跳过此技能。
</SUBAGENT-STOP>

# 稿件版本管理

本技能是**弹性技能**。提交规范是固定的，分支策略和回滚方式可根据项目规模灵活调整。

## 核心定位

用 Git 管理稿件的版本历史。通过 commit、branch 追踪草稿演进、修订记录。

**稿件 Git 仓库位于 `docs/dreampowers/`**。所有 git 命令均在此目录下执行（`workdir` 设为 `docs/dreampowers/`），仓库内路径如 `release/chapter-003.md` 是相对于该仓库根目录的路径。

本技能**只负责版本管理操作**，不负责质量检查或终检。

职责边界：
- **管**：提交规范、分支策略、版本回滚
- **不管**：稿件内容质量（那是 `dp-chapter-draft` 的事）、连续性检查（那是 `dp-review-consistency` 的事）、全书终检（那是 `dp-review-final-report` 的事）

本技能**不负责** git worktree 操作。需要隔离工作区时，使用其他工具或手动处理。

## 适用时机

- 每章通过 `dp-chapter-draft` 三阶段审查后，提交版本快照
- 完成一卷所有章节、完成全书初稿、全书审查通过时
- 大规模修改前，先提交当前状态作为安全点
- 大规模修改后，提交修改结果并与修改前对比
- 世界观设定、大纲、伏笔场记等支撑文档发生变更时

## 提交规范

每次 commit 必须使用结构化消息。格式：`类型(范围): 描述`。

### 类型与范围

| 类型 | 范围 | 示例 |
|------|------|------|
| `chapter` | 章节号 (NNN) | `chapter(003): 第3章初稿完成` / `chapter(003): 第3章审查通过` |
| `set` | 无 | `set: 更新角色X角色风格` |
| `outline` | 无 | `outline: 第二卷大纲修订` |
| `tracking` | 无 | `tracking: 更新伏笔场记` |

### 提交原则

1. **关联产物一起提交**。章节稿件和对应的伏笔场记更新放在同一个 commit 里
2. **每个 commit 有且只有一个目的**。不要把第3章初稿和第5章修订混在一起
3. **描述写中文**，类型和范围写英文。描述要具体，不要写"更新内容"
4. **审查通过的章节单独提交**。初稿完成是一个 commit，审查通过后是另一个

### 提交检查清单

每次提交前确认：消息格式正确、关联文件全部暂存、没有遗留未暂存的相关改动、描述具体。

## 分支策略

保持简单。长篇小说不需要 GitFlow。

| 分支 | 用途 | 生命周期 |
|------|------|---------|
| `main` | 当前稿件状态，所有已确认的内容 | 永久 |
| `revision/xxx` | 重大修订（可能需要回滚） | 临时，合并或放弃后删除 |

使用规则：
- 日常写作直接在 `main` 上提交，不需要为每章开分支
- 当你要做**可能推翻大量已有内容**的修订时，开 `revision/xxx` 分支。例如：`revision/restructure-vol-2`、`revision/change-pov`
- 修订分支完成且确认后，合并回 `main`。修订放弃则直接删除分支
- **不使用 git worktree**。一个工作目录，一个分支，简单明确

## 回滚指引

修订失败、需要恢复到之前版本时：

```bash
# 所有 git 命令在 docs/dreampowers/ 目录下执行

# 回滚单个章节：查看历史 → 恢复 → 提交
git log --oneline -- release/chapter-003.md
git checkout <commit-hash> -- release/chapter-003.md
git commit -m "chapter(003): 回滚至审查通过版本"

# 回滚到某个版本：浏览历史 → 从该提交创建修订分支
git log --oneline
git checkout -b revision/rollback <commit-hash>

# 对比版本差异
git diff <commit1> <commit2> -- release/
```

回滚原则：**永远不要用 `git reset --hard`**，用 `git checkout` 或 `git revert` 保留操作历史。回滚前先提交当前状态。回滚操作本身也要有规范的 commit 消息。

## 版本管理流程

```dot
digraph manuscript_versioning {
    rankdir=TB;
    node [shape=box, style=rounded];

    write [label="章节写作完成\n三阶段审查通过"];
    stage [label="暂存关联文件\n(章节 + 伏笔场记)"];
    commit [label="提交\nchapter(NNN): 描述"];
    major [label="需要大修？" shape=diamond];
    branch [label="创建 revision/xxx 分支"];
    revise [label="在分支上修订"];
    confirm [label="修订满意？" shape=diamond];
    merge [label="合并回 main\n删除分支"];
    discard [label="放弃分支\n回到 main"];
    done [label="版本快照已保存\n继续下一章" shape=doublecircle];

    write -> stage -> commit;
    commit -> major;
    major -> branch [label="是"];
    major -> done [label="否"];
    branch -> revise -> confirm;
    confirm -> merge [label="是"];
    confirm -> discard [label="否"];
    merge -> done;
    discard -> done;
}
```

## 与其他技能的交互

| 关系 | 技能 | 说明 |
|------|------|------|
| 上游 | `dp-chapter-draft` | 每章三阶段审查和外部审阅通过后，调用本技能提交版本快照 |
| 上游 | `dp-review-consistency` | 连续性检查通过后，可能触发一次提交 |
| 上游 | `dp-review-final-report` | 全书终检通过后，提交最终版本 |
| 上游 | `dp-set-outline` | 大纲变更时，用 `outline:` 类型提交 |
| 上游 | `dp-set-concept` | 设定变更时，用 `set:` 类型提交 |

## 反模式

以下行为严格禁止：

- **提交不写消息或写"update"** ❌ 三个月后你不会记得"update"改了什么
- **累积大量改动后一次性提交** ❌ 失去逐步回滚的能力，版本历史变成摆设
- **章节和伏笔场记更新分开提交** ❌ 关联产物必须在同一个 commit，否则中间状态不一致
- **在 `main` 上做可能推翻的大修** ❌ 开 `revision/xxx` 分支，保护已有成果
- **用 `git reset --hard` 回滚** ❌ 这会删除历史，用 `checkout` 或 `revert`
- **给每章都开分支再合并** ❌ 过度工程化，日常写作直接在 `main` 提交

## 注意事项

| 信号 | 含义 |
|------|------|
| 超过 3 章未提交 | 版本管理形同虚设，立即补提交 |
| `git status` 显示大量未跟踪文件 | 新文件未纳入版本控制 |
| commit 消息全是英文或无类型前缀 | 提交规范未执行 |
| `main` 上有半完成的大修改 | 应该在 `revision/xxx` 分支上进行 |

出现上述情况：不得继续写作。先补齐版本管理操作，使 `git status` 和版本历史恢复到规范状态。

## 终止状态

版本提交完成，commit 消息符合规范，关联产物一起入库。`git status` 显示工作区干净，没有遗留的未提交改动。后续如需修订，创建新版本分支，走 `skill("dp-chapter-draft")` + `skill("dp-review-consistency")` 流程后重新提交。
