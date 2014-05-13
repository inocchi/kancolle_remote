# -*- encoding: utf-8 -*-

# マウス座標
module Mouse

  # 母港
  module Bokou
    BATTLE_X  = 540
    BATTLE_Y  = 450
    HENSEI_X  = 540
    HENSEI_Y  = 330
    HOKYU_X   = 425
    HOKYU_Y   = 415
    NYUKYO_X  = 465
    NYUKYO_Y  = 550
    KAISOU_X  = 660
    KAISOU_Y  = 410
    KOUSYO_X  = 615
    KOUSYO_Y  = 550
  end

  # 左のメニュー
  module LMenu
    BOKOU_X   = 420
    BOKOU_Y   = 445
    HENSEI_X  = 365
    HENSEI_Y  = 340
    HOKYU_X   = 365
    HOKYU_Y   = 395
    KAISOU_X  = 365
    KAISOU_Y  = 450
    NYUKYO_X  = 365
    NYUKYO_Y  = 500
    KOUSYO_X  = 365
    KOUSYO_Y  = 555
  end

  # 上のメニュー
  module TMenu
    QUEST_X   = 905
    QUEST_Y   = 235
  end

  # 出撃TOP
  module BattleTop
    BATTLE_X    = 580
    BATTLE_Y    = 410
    PRACTICE_X  = 795
    PRACTICE_Y  = 410
    ENSEI_X     = 1015
    ENSEI_Y     = 410
  end

  # 遠征
  module Ensei
    MISSION_1_X = 650
    MISSION_1_Y = 360
    MISSION_Y_OFFSET  = 30
    MISSION_DECIDE_X  = 1025
    MISSION_DECIDE_Y  = 630
    MISSION_CANCEL_X  = MISSION_1_X
    MISSION_CANCEL_Y  = MISSION_1_Y 

    AREA_1_X = 490
    AREA_1_Y = 625
    AREA_X_OFFSET = 65

    DECK_2_X  = 740
    DECK_2_Y  = 305
    DECK_X_OFFSET = 30
    DECK_OK_X = 970
    DECK_OK_Y = 635
  end
end
