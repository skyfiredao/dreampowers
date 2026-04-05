---
name: dp-chapter-draft
description: Use when writing chapter text, drafting scenes, or producing manuscript content after outline is complete
---

<SUBAGENT-STOP>
如果你是被派遣执行特定任务的子代理，跳过此技能。
</SUBAGENT-STOP>

# 章节起草与三阶段审查

本技能是**弹性技能**。原则不变，细节可因上下文调整。但三阶段审查流水线是刚性的，不可跳过任何阶段。

## 前置条件

必须已完成以下技能的产出物：

1. `dp-tool-research` — `docs/dreampowers/tracking/overview.md` 故事蓝本
2. `dp-set-style` — `docs/dreampowers/tracking/style.md` 写作风格档案
3. `dp-set-concept` — `docs/dreampowers/set/` 下有世界观设定与拆分后的概念/角色文件
4. `dp-set-outline` — `docs/dreampowers/outlines/` 下有大纲文档（含揭示时间表与主题追踪），`docs/dreampowers/chapters/chapter-NNN/` 章节工作区已创建

缺少任何一项，停下来，先补齐再写。

## Pre-Draft Gate（写作前强制检查）

<HARD-GATE>
以下十三项检查全部通过后才允许开始写作。跳过任何一项等于盲写。
</HARD-GATE>

<HARD-GATE>
章节写作必须严格串行：写完第 N 章、三阶段审查通过且用户确认后，才能开始第 N+1 章。禁止并行起草多章。连写模式只是省略用户逐章确认，写作本身仍然是逐章顺序完成。
</HARD-GATE>

每章开写前，按顺序执行：

1. **读取大纲**：找到本章在大纲中的详细信息（章节目标、场景安排、关键事件）。如果大纲标注本章使用非顺叙手法（倒叙、插叙、补叙），在第 8 项"本章写作指令卡"中明确标注时间线执行要求，参照本技能的"叙事时间线执行指引"
2. **读取揭示时间表**：本章安排了哪些世界观揭示？揭示方式是什么？
3. **加载概念白名单**：读取 `docs/dreampowers/chapters/chapter-NNN/` 目录，**仅加载目录内有符号链接的概念文件**。目录中不存在符号链接的概念物理不可见、不可引用
4. **加载角色白名单**：读取同一章节工作区中的角色符号链接，加载对应的角色文件。复杂角色只加载工作区中链接的特定时间线阶段文件。未链接的角色和时间线阶段物理不可见
5. **创建并读取前序章节摘要**：检查 `docs/dreampowers/timeline/` 中已存在的 `summary-*.md` 文件，为当前章节工作区创建前 1-3 章摘要的符号链接（`summary-NNN.md → ../../timeline/summary-NNN.md`），不足 3 章按实际数量链接，第一章跳过。然后读取这些摘要，确认前章结尾状态、角色位置、悬而未决的线索。非第一章时，也读取前章完整草稿
6. **读取 `spec.md`**：从章节工作区中的 `spec.md` 读取概念预算、门控标准、概念依赖图、读者评估要求、改进要求
7. **读取铁律**：从章节工作区中的 `iron-rules.md` 符号链接读取六条铁律，执行五问闸门检查：
   - 本章引入几个新概念？是否在 `spec.md` 的概念预算内？
   - 是否有不服务当前冲突的信息？
   - 揭示方式是否通过角色体验而非旁白？
   - 已有概念是否在深化？
   - 读者此刻的认知负载是否可接受？
8. **读取风格档案**：从章节工作区中的 `style.md` 符号链接读取写作风格档案，确认七维参数、可执行风格指令和禁区。风格档案是本章写作的文笔基准
9. **读取伏笔文件**：读取工作区中链接的伏笔线索文件（`thread-*.md`），确认本章需要植入、推进、回收哪些伏笔
10. **读取作者调优**：检查章节工作区中是否存在 `tuning.md`。若存在，读取其中的调优指令。调优指令的优先级：铁律 > tuning.md > style.md > 大纲默认设定 > spec.md 中的一般指导
11. **语域转换**：以上步骤加载的概念文件、角色卡、spec.md 等都是技术参考资料，其语言是结构化的、百科式的。写作时只提取事实，不复制其语言风格。所有设定信息进入正文时，必须经过 style.md 定义的文笔过滤——用角色的感知、动作、对话来承载，不用资料的术语和句式。概念文件说"灵力基于经脉循环系统"，正文应该写角色感受到灵力流动，而不是复述定义
12. **汇总写作约束**：把以上结果整理成一份"本章写作指令卡"，明确列出必须做和禁止做的事
13. **加载成人场景技能**：检查章节工作区中是否存在 `adult.md`。若存在（有链接 = 本章含成人场景），调用 `skill("dp-chapter-adult")` 加载成人场景写作方法论，并读取 `adult.md` 中的尺度、禁区、风格偏好作为本章写作约束

全部通过后，输出一段确认摘要，然后开始写作。

## 写作流程清单

调用本技能后，将以下清单写入 todowrite，逐项执行：

- [ ] 完成 Pre-Draft Gate 全部十三项检查
- [ ] 确定本章写作重点（场景数量、字数目标、情绪弧线）
- [ ] 逐场景写作（每个场景独立完成，场景间保持过渡）
- [ ] 自检：世界观揭示是否符合铁律
- [ ] 自检：对话是否有角色辨识度
- [ ] 自检：伏笔是否自然植入
- [ ] 三阶段审查（Stage 1 → Stage 2 → Stage 3）
- [ ] 用户确认或修改
- [ ] 保存草稿到章节工作区 `chapters/chapter-NNN/draft.md`
- [ ] 保存终稿到 `release/chapter-NNN.md`
- [ ] 更新伏笔文件（`docs/dreampowers/tracking/thread-*.md`）
- [ ] 调用 `skill("dp-chapter-summary")` 生成本章摘要

## 场景写作指引

场景级别的精细控制需调用 `skill("dp-chapter-direct")`。这里只给出章节层面的指引：

**开场**：直接进入动作或对话。不要从天气、环境描写开头，除非天气本身是情节元素（暴风雨阻断退路、浓雾隐藏敌人）。第一句话就应该让读者进入场景。

**过渡**：场景切换用空行分隔，不用"与此同时""另一边""话分两头"。如果视角切换，新场景的第一句就该让读者知道自己在跟谁。

**结尾**：每个场景留一个微型钩子或情绪转折。不一定是悬念，可以是一个未回答的问题、一个令人不安的细节、一个角色做出的选择。章末钩子要更强，驱动读者翻到下一章。

**字数**：不设硬性字数要求。场景写到该停的地方停。但如果大纲规定了本章字数区间，尽量靠近目标。

**时代视角**：故事设定在过去时代时，用角色当时的视角写，不用当代人回忆的视角。对角色而言，身边的一切都是当下的、鲜活的——没有"泛黄"、"陈旧"、"蒙尘"的滤镜。同时注意物品的时代准确性：90年代教室是黑板粉笔不是白板记号笔，方便面是袋装的没有桶面，日用品以搪瓷铝制木质为主而非塑料。写每个场景时核查：这个物件在那个年代存在吗？角色会用什么？

**大纲是骨架，不是展开指令**：大纲中的每个条目是情节节点，不是要求你详细描写该事件的过程。大纲写"兴建工厂"，小说里只需要"一座新的工厂拔地而起"一句带过，不需要展开施工细节、建材选择、工人调度。判断标准：这个细节推动了情节、塑造了角色、还是制造了冲突？都不是的话，一句话概括，不展开。

## 叙事时间线执行指引

大纲阶段（`dp-set-outline`）决定本章使用哪种时间线手法。本节指导你在实际写作中如何执行这些手法。大纲说"用什么"，这里说"怎么写"。

### 顺叙

默认模式，无需特殊处理。唯一需要注意的是时间过渡：

- 禁止机械地使用"第二天""三天后""一周之后"作为场景衔接
- 时间跳跃要通过场景内部的细节暗示：光线变化、餐食更替、衣着换季、角色状态变化
- 如果两个场景之间的时间间隔对情节无影响，直接切场景，不需要交代过了多久

### 倒叙

从结果写起，再回溯原因。执行规则：

| 序号 | 规则 | 说明 |
|------|------|------|
| 1 | **开头制造认知缺口** | 第一个场景必须让读者产生"发生了什么？"的强烈疑问。不要在开头解释，只展示结果 |
| 2 | **回溯锚点要清晰** | 从"现在"跳到"过去"时，通过感官、物件、季节等具体细节暗示时间位移。禁止用"时间回到三个月前"这类生硬标注 |
| 3 | **回溯中禁止泄底** | 回溯叙事中严禁提前揭露开头悬念的答案 |
| 4 | **回归信号必须明确** | 从倒叙回到"现在"时，必须有清晰的过渡信号 |

### 插叙

当前时间线中嵌入过去的片段：

1. **触发规则**：插叙必须由当前场景中的具体触发物引发。禁止无触发硬切
2. **长度规则**：单次插叙不超过当前场景篇幅的 1/3
3. **退出规则**：从插叙返回现在时，必须回到触发点
4. **频率规则**：一章内最多 1 次插叙

### 补叙

事件发生后，补充交代此前未披露的信息：

1. **时机规则**：补叙必须在读者已经对某事件产生疑问之后使用
2. **载体规则**：通过角色回忆、对话揭示、物件承载（书信、日记等）
3. **铺垫规则**：禁止在读者毫无铺垫的情况下补叙

### 时间线手法速查表

| 手法 | 核心要求 | 最常见错误 |
|------|---------|-----------|
| 顺叙 | 过渡自然 | 机械标注时间跳跃 |
| 倒叙 | 认知缺口 + 禁止泄底 | 开头悬念太弱，或回溯中提前给答案 |
| 插叙 | 有触发 + 有退出 + 控长度 | 无触发硬切，插叙太长喧宾夺主 |
| 补叙 | 先有疑问再补 | 无铺垫突然补叙，读者一头雾水 |

## 三阶段审查流水线

这是本技能的核心。三阶段顺序执行，不可跳过。

```dot
digraph review_pipeline {
    rankdir=TB;
    node [shape=box, style=rounded];

    draft [label="章节草稿完成"];

    s1 [label="Stage 1: 情节审查\n（子 agent）"];
    s1_pass [label="情节通过？" shape=diamond];
    s1_fix [label="修改情节"];

    s2 [label="Stage 2: 揭示检查 ⭐\n（子 agent）"];
    s2_pass [label="揭示通过？" shape=diamond];
    s2_fix [label="修改揭示"];

    s3 [label="Stage 3: 文笔审查\n（子 agent）"];
    s3_pass [label="文笔通过？" shape=diamond];
    s3_fix [label="修改文笔"];

    approved [label="审查通过\n提交用户确认" shape=doublecircle];
    escalate [label="3次未通过\n提交用户判断" shape=doublecircle];

    draft -> s1;

    s1 -> s1_pass;
    s1_pass -> s2 [label="通过"];
    s1_pass -> s1_fix [label="未通过"];
    s1_fix -> s1 [label="重新审查\n(最多3次)"];
    s1_fix -> escalate [label="超过3次"];

    s2 -> s2_pass;
    s2_pass -> s3 [label="通过"];
    s2_pass -> s2_fix [label="未通过"];
    s2_fix -> s2 [label="重新审查\n(最多3次)"];
    s2_fix -> escalate [label="超过3次"];

    s3 -> s3_pass;
    s3_pass -> approved [label="通过"];
    s3_pass -> s3_fix [label="未通过"];
    s3_fix -> s3 [label="重新审查\n(最多3次)"];
    s3_fix -> escalate [label="超过3次"];
}
```

### Stage 1: 情节审查

派遣子 agent，检查以下四点：

1. **核心冲突推进**：本章是否推进了核心冲突？
2. **角色行为一致性**：角色的行为是否符合其已确立的动机和性格？
3. **大纲偏差评估**：与大纲的偏差是否合理？
4. **章末钩子有效性**：章末是否有足够的驱动力让读者继续？

**通过标准**：情节逻辑自洽，角色行为合理，章末有钩子。

### Stage 2: 揭示检查 ⭐

**这是核心创新。零容忍 info-dump。**

派遣子 agent，基于六条铁律逐一检查：

1. **新概念预算**：本章引入了几个全新概念？是否超出预算？
2. **旁白讲解检测**：是否存在角色不可能知道的世界观信息？
3. **揭示载体检查**：所有世界观信息是否通过角色行动、对话、观察传递？
4. **信息相关性**：是否有"此刻没有发生"的信息？
5. **深化 vs 堆砌**：已引入的概念是否在深化理解？

**通过标准**：严格符合六条铁律。零违规。

### Stage 3: 文笔审查

派遣子 agent，检查以下五点：

1. **语言风格一致性**：对照 `style.md` 风格档案的七维参数和可执行风格指令，检查本章文风是否符合风格基准且与已有章节一致？
2. **对话辨识度**：蒙住角色名字，能否从说话方式分辨谁是谁？
3. **感官描写**：是否有充分的感官细节？
4. **节奏与情绪**：段落长短是否服务于情绪目标？
5. **重复检测**：是否有重复用词、重复句式、重复修辞？

**通过标准**：文笔质量达标，风格一致，对话有辨识度。

### 审查规则

- Stage 1 通过后才进入 Stage 2
- Stage 2 通过后才进入 Stage 3
- 任何 Stage 未通过 → 修改 → 重新该 Stage 审查
- 每个 Stage 最多 3 次循环，超过则提交用户判断
- **Stage 2（揭示检查）是最严格的**，零容忍 info-dump

## 外部审阅闭环

三阶段审查通过后，章节进入外部审阅闭环。这个闭环由两个独立技能协作完成，总循环最多 3 次。

### 流程

```dot
digraph external_review_loop {
    rankdir=TB;
    node [shape=box, style=rounded, fontname="PingFang SC"];

    three_stage_pass [label="三阶段审查通过"];
    reader [label="读者审阅\n(dp-review-reader)\n四维度评分"];
    consistency [label="一致性审阅\n(dp-review-consistency)\n九维度检查 + 写作风格检查"];
    has_issue [label="存在问题？" shape=diamond];
    fix [label="根据两份报告修改章节"];
    count [label="第几轮？" shape=diamond];
    user_confirm [label="提交用户确认"];
    tbd [label="release 文件名加 TBD\n提交用户人工审阅"];

    three_stage_pass -> reader;
    reader -> consistency;
    consistency -> has_issue;
    has_issue -> user_confirm [label="无问题"];
    has_issue -> fix [label="有问题"];
    fix -> count;
    count -> reader [label="< 3 次"];
    count -> tbd [label="= 3 次"];
    tbd -> user_confirm [label="用户修改后确认"];
}
```

### 审阅规则

1. **读者审阅先行**：调用 `skill("dp-review-reader")`，获取四维度评分和问题标记
2. **一致性审阅跟进**：调用 `skill("dp-review-consistency")` 第一部分（连续性检查）+ 第二部分（散文修订与AI味检测，含对照 `style.md` 的写作风格检查）
3. **合并修改**：将两份报告的问题汇总，统一修改章节。修改后不需要重新走三阶段审查（三阶段已通过，外部审阅只做体验和一致性层面的调整）
4. **循环上限 3 次**：修改后重新进入读者审阅 → 一致性审阅。总循环最多 3 次
5. **3 次后仍有问题**：终稿保存至 `release/chapter-NNN-TBD.md`，`review_status` 标记为 `tbd`，提交用户人工审阅修改

### 判定"存在问题"的标准

- 读者审阅：翻页欲/共情/节奏任一维度评分 ≤2，认知负荷评分 ≥4（认知负荷越高越差），或两个以上维度评分未达标（翻页欲/共情/节奏 ≤3，认知负荷 ≥3）
- 一致性审阅：任一维度 FAIL，或 AI 味浓度 ≥4

两份报告中任一触发上述标准，即视为"存在问题"，进入修改→复审循环。

## 存储路径与章节格式

草稿保存至章节工作区：

```
docs/dreampowers/chapters/chapter-NNN/draft.md
```

审查通过并获得用户确认后，终稿保存至：

```
release/chapter-NNN.md
```

外部审阅闭环 3 次后仍有问题的章节，终稿保存至：

```
release/chapter-NNN-TBD.md
```

用户人工审阅修改完成后，将文件重命名为 `release/chapter-NNN.md`，`review_status` 改为 `approved`。

`NNN` 为零填充章节号（001, 002, 003...）。

章节文件头部包含元数据注释：

```markdown
<!-- 
story: [故事名]
chapter: [章节号]
pov: [视角角色]
date: [写作日期]
word_count: [字数]
review_status: [draft/reviewed/approved/tbd/imported]
-->

# 第[N]章：[章节标题]

[正文]
```

`review_status` 状态说明：
- `draft` — 初稿，未经三阶段审查
- `reviewed` — 三阶段审查通过
- `approved` — 用户确认
- `tbd` — 外部审阅闭环 3 次后仍有问题，待用户人工审阅
- `imported` — 外部导入，未经审查流程

## 章节审查报告

三阶段审查完成后，将审查结果保存至章节工作区：

```
docs/dreampowers/chapters/chapter-NNN/review.md
```

## 伏笔文件更新

每章写完并通过审查后，必须更新 `docs/dreampowers/tracking/` 目录下的对应伏笔文件：

**新植入的伏笔**：创建新的伏笔文件（`thread-NNN-描述.md`），记录伏笔内容、植入位置、植入方式，并在章节工作区中创建符号链接

**推进的伏笔**：更新对应的伏笔文件，在"事件记录"中添加推进事件

**回收的伏笔**：更新对应的伏笔文件，在"事件记录"中添加回收事件，将元数据中的 `status` 改为 `resolved`

**Claremont 系数检查**：

遍历 `docs/dreampowers/tracking/` 目录下所有 `thread-*` 伏笔文件，统计元数据中 `status` 字段：

```
Claremont 系数 = status=active 的伏笔数 - status=resolved 的伏笔数
```

- CC = 0：伏笔收支平衡
- CC > 0 且 ≤ 2：叙事债务可控
- CC > 2：**警告**。暂停连续写作，建议优先回收旧伏笔

## 连续写作模式

默认流程是逐章写作、逐章确认。用户可选择连续写作模式。

### 模式选择

| 模式 | 行为 | 适用场景 |
|------|------|---------|
| **逐章确认**（默认） | 每章写完 → 三阶段审查 → 用户确认 → 下一章 | 精细控制每一章 |
| **连写 N 章** | 连续完成 N 章（每章仍走审查），统一交用户审阅 | 批量推进 |
| **写完一幕暂停** | 写完当前幕的所有章节后暂停 | 按幕管理进度 |
| **全自动** | 连续写完所有章节，最后统一交付 | 信任流程，一次性拿初稿 |

### 连续写作规则

1. **三阶段审查不跳过。** 连续写作省略的是用户确认环节，不是质量检查
2. **审查 3 次不过仍然升级。** 立即暂停连续写作，交给用户判断
3. **CC > 2 触发暂停。** 警告用户伏笔债务过高
4. **用户随时可中断。** 用户说"停"、"暂停"、"等一下"时，立即停止

### 批量审阅

连写 N 章或写完一幕后，向用户交付时：

1. 列出所有已完成章节的摘要（直接引用 `timeline/summary-NNN.md` 内容）
2. 标注每章的三阶段审查结果
3. 标注伏笔场记的当前 CC 值和变化趋势
4. 询问用户是否要逐章细审，还是整体通过

### 中途改变主意

用户可以随时切换模式。切换即时生效。

## 大纲偏离处理

- **小偏离**（场景内部调整）：记录偏离点，继续写作
- **中偏离**（章节内事件顺序调整）：记录偏离点，章节审查时重点检查
- **大偏离**（核心事件改变、主线走向变化）：**立即暂停**，调用 `skill("dp-set-outline")` 的大纲修订流程

大偏离判定标准：如果这个偏离会导致后续 2 章以上的大纲失效，就是大偏离。

## 章节稿件接入

当作者在 AI 流程之外手写了章节，需要将其纳入工作流。

### 适用场景

- AI 写了 1-5 章，作者自己写了 6-8 章
- 作者导入已有手稿
- `dp-set-concept` 的导入模式将章节内容路由到此处

### 接入流程

1. **元数据注入**：为每个导入章节补充元数据头，`review_status: imported`
2. **内容分析**：逐章阅读，提取世界观设定引入、角色出场、伏笔种子、与大纲的对应关系
3. **伏笔场记回填**：回溯创建或更新 `tracking/thread-*` 伏笔文件，发现呈报用户确认
4. **连续性检查**：对导入章节调用 `skill("dp-review-consistency")`
5. **大纲对照**：与大纲比对，记录偏离点。若存在大偏离，建议修订大纲
6. **续写衔接**：建立交接点，总结末章结尾状态，下一章进入正常 Pre-Draft Gate

### 接入规则

- 导入章节保存为 `chapters/chapter-NNN/draft.md`，`review_status` 标记为 `imported`
- 终稿保存至 `release/chapter-NNN.md`
- 导入章节**不**经过三阶段审查（作者原作）
- 但**会**被扫描以追踪连续性和伏笔
- 用户可主动要求审查导入章节
- 批量导入多章时，按章节顺序处理

## 反模式

- ❌ **写完不审查直接下一章** — 每章必须走完三阶段审查
- ❌ **跳过 Stage 2 揭示检查** — 核心创新，不可省略
- ❌ **审查发现问题但标记"下章再修"** — 问题在本章解决
- ❌ **字数优先于质量** — 写 2000 字好文胜过 5000 字水文
- ❌ **三个 Stage 合并为一次审查** — 必须顺序执行、独立判断
- ❌ **揭示检查"大部分通过"就放行** — 零违规才通过
- ❌ **引用白名单外的概念或角色** — 只有工作区中有符号链接的才可见
- ❌ **并行起草多章** — 章节必须串行写作
- ❌ **给过去时代加回忆滤镜** — 不是回忆，没有古旧感，当时的事物是鲜活的
- ❌ **用当代物品替代该时代实际物品** — 核查每个物件是否符合故事年代
- ❌ **过度展开大纲条目** — 大纲写"兴建工厂"不等于要描写施工过程，一句带过即可；只展开推动情节、塑造角色或制造冲突的内容

## 完整流程图

```dot
digraph chapter_draft {
    rankdir=TB;
    node [shape=box, style=rounded];

    start [label="开始写新章节"];
    gate [label="Pre-Draft Gate\n十三项强制检查\n(含工作区加载)"];
    gate_pass [label="全部通过？" shape=diamond];
    fix_gate [label="补齐缺失项"];
    plan [label="确定写作重点\n场景/字数/情绪"];
    write [label="逐场景写作\n(调用 skill(\"dp-chapter-direct\"))"];
    self_check [label="自检\n揭示/对话/伏笔"];

    review [label="三阶段审查流水线"];
    review_pass [label="审查通过？" shape=diamond];

    ext_reader [label="读者审阅\n(dp-review-reader)"];
    ext_consistency [label="一致性审阅\n(dp-review-consistency)\n含写作风格检查"];
    ext_issue [label="存在问题？" shape=diamond];
    ext_fix [label="根据报告修改章节"];
    ext_count [label="循环次数？" shape=diamond];
    tbd [label="保存为 TBD\nrelease/chapter-NNN-TBD.md"];

    user [label="用户确认？" shape=diamond];
    user_fix [label="按用户意见修改"];
    save_draft [label="保存草稿\nchapters/chapter-NNN/draft.md"];
    save_review [label="保存审查报告\nchapters/chapter-NNN/review.md"];
    save_release [label="保存终稿\nrelease/chapter-NNN.md"];
    update_thread [label="更新伏笔文件\n检查 Claremont 系数"];
    summary [label="调用 skill(\"dp-chapter-summary\")\n生成本章摘要"];
    done [label="本章完成\n循环至下一章" shape=doublecircle];

    start -> gate;
    gate -> gate_pass;
    gate_pass -> plan [label="通过"];
    gate_pass -> fix_gate [label="未通过"];
    fix_gate -> gate;
    plan -> write;
    write -> self_check;
    self_check -> review;
    review -> review_pass;
    review_pass -> ext_reader [label="通过"];
    review_pass -> write [label="需修改"];

    ext_reader -> ext_consistency;
    ext_consistency -> ext_issue;
    ext_issue -> user [label="无问题"];
    ext_issue -> ext_fix [label="有问题"];
    ext_fix -> ext_count;
    ext_count -> ext_reader [label="< 3 次"];
    ext_count -> tbd [label="= 3 次"];
    tbd -> user;

    user -> save_draft [label="确认"];
    user -> user_fix [label="要修改"];
    user_fix -> self_check;
    save_draft -> save_review;
    save_review -> save_release;
    save_release -> update_thread;
    update_thread -> summary;
    summary -> done;
}
```

## 与其他技能的交互

| 关系 | 技能 | 说明 |
|------|------|------|
| 上游 | `dp-set-outline` | 读取大纲、揭示时间表、章节工作区 |
| 被引用 | `dp-set-style` | 风格档案作为写作文笔基准，Pre-Draft Gate 第 8 项读取 style.md |
| 协作 | `dp-chapter-direct` | 场景级精细控制 |
| 协作 | `dp-character-style` | 角色风格与对话辨识度 |
| 协作 | `dp-review-reader` | 读者视角测试 |
| 协作 | `dp-review-consistency` | 连续性检查 |
| 协作 | `dp-tool-research` | 写作中遇到不确定的细节时回调做考据；作者调优 |
| 协作 | `dp-tool-version` | Git 版本管理 |
| 协作 | `dp-chapter-adult` | 成人场景写作方法论（检测到 adult.md 时调用 `skill("dp-chapter-adult")`） |
| 下游 | `dp-chapter-summary` | 章节完成后生成摘要 |

## 终态

没有固定的下一个技能。章节写作是一个循环：

```
Pre-Draft Gate → 写作 → 三阶段审查 → 外部审阅闭环(reader+consistency, 最多3轮) → [用户确认/批量审阅] → 保存 → 更新伏笔 → 生成摘要 → 下一章
```

每一章重新进入 Pre-Draft Gate，重新读取大纲、揭示时间表、前章状态。不要假设上一章的写作约束对下一章依然成立。
