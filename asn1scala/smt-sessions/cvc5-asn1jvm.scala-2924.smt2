; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69694 () Bool)

(assert start!69694)

(declare-fun res!256650 () Bool)

(declare-fun e!225646 () Bool)

(assert (=> start!69694 (=> (not res!256650) (not e!225646))))

(declare-fun mid!77 () (_ BitVec 64))

(declare-fun to!837 () (_ BitVec 64))

(declare-datatypes ((array!19267 0))(
  ( (array!19268 (arr!9439 (Array (_ BitVec 32) (_ BitVec 8))) (size!8359 (_ BitVec 32))) )
))
(declare-fun a1!799 () array!19267)

(declare-fun a2!799 () array!19267)

(declare-fun a3!74 () array!19267)

(declare-fun from!870 () (_ BitVec 64))

(assert (=> start!69694 (= res!256650 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!870) (bvsle from!870 mid!77) (bvsle mid!77 to!837) (= (size!8359 a1!799) (size!8359 a2!799)) (= (size!8359 a2!799) (size!8359 a3!74)) (bvsle mid!77 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8359 a1!799)))) (bvsle to!837 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8359 a2!799))))))))

(assert (=> start!69694 e!225646))

(assert (=> start!69694 true))

(declare-fun array_inv!7911 (array!19267) Bool)

(assert (=> start!69694 (array_inv!7911 a1!799)))

(assert (=> start!69694 (array_inv!7911 a2!799)))

(assert (=> start!69694 (array_inv!7911 a3!74)))

(declare-fun b!313474 () Bool)

(declare-fun res!256651 () Bool)

(assert (=> b!313474 (=> (not res!256651) (not e!225646))))

(declare-fun arrayBitRangesEq!0 (array!19267 array!19267 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313474 (= res!256651 (arrayBitRangesEq!0 a1!799 a2!799 from!870 mid!77))))

(declare-fun b!313475 () Bool)

(declare-fun res!256652 () Bool)

(assert (=> b!313475 (=> (not res!256652) (not e!225646))))

(assert (=> b!313475 (= res!256652 (arrayBitRangesEq!0 a2!799 a3!74 from!870 to!837))))

(declare-fun b!313476 () Bool)

(assert (=> b!313476 (= e!225646 (not (arrayBitRangesEq!0 a1!799 a3!74 from!870 from!870)))))

(assert (= (and start!69694 res!256650) b!313474))

(assert (= (and b!313474 res!256651) b!313475))

(assert (= (and b!313475 res!256652) b!313476))

(declare-fun m!451067 () Bool)

(assert (=> start!69694 m!451067))

(declare-fun m!451069 () Bool)

(assert (=> start!69694 m!451069))

(declare-fun m!451071 () Bool)

(assert (=> start!69694 m!451071))

(declare-fun m!451073 () Bool)

(assert (=> b!313474 m!451073))

(declare-fun m!451075 () Bool)

(assert (=> b!313475 m!451075))

(declare-fun m!451077 () Bool)

(assert (=> b!313476 m!451077))

(push 1)

(assert (not b!313474))

(assert (not start!69694))

(assert (not b!313476))

(assert (not b!313475))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!313558 () Bool)

(declare-fun e!225730 () Bool)

(declare-fun call!5925 () Bool)

(assert (=> b!313558 (= e!225730 call!5925)))

(declare-fun b!313559 () Bool)

(declare-fun e!225728 () Bool)

(declare-fun e!225733 () Bool)

(assert (=> b!313559 (= e!225728 e!225733)))

(declare-fun res!256720 () Bool)

(assert (=> b!313559 (=> (not res!256720) (not e!225733))))

(declare-fun e!225729 () Bool)

(assert (=> b!313559 (= res!256720 e!225729)))

(declare-fun res!256717 () Bool)

(assert (=> b!313559 (=> res!256717 e!225729)))

(declare-datatypes ((tuple4!1274 0))(
  ( (tuple4!1275 (_1!13316 (_ BitVec 32)) (_2!13316 (_ BitVec 32)) (_3!1594 (_ BitVec 32)) (_4!637 (_ BitVec 32))) )
))
(declare-fun lt!442316 () tuple4!1274)

(assert (=> b!313559 (= res!256717 (bvsge (_1!13316 lt!442316) (_2!13316 lt!442316)))))

(declare-fun lt!442315 () (_ BitVec 32))

(assert (=> b!313559 (= lt!442315 ((_ extract 31 0) (bvsrem mid!77 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!442314 () (_ BitVec 32))

(assert (=> b!313559 (= lt!442314 ((_ extract 31 0) (bvsrem from!870 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1274)

(assert (=> b!313559 (= lt!442316 (arrayBitIndices!0 from!870 mid!77))))

(declare-fun b!313560 () Bool)

(declare-fun arrayRangesEq!1791 (array!19267 array!19267 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!313560 (= e!225729 (arrayRangesEq!1791 a1!799 a2!799 (_1!13316 lt!442316) (_2!13316 lt!442316)))))

(declare-fun d!103880 () Bool)

(declare-fun res!256718 () Bool)

(assert (=> d!103880 (=> res!256718 e!225728)))

(assert (=> d!103880 (= res!256718 (bvsge from!870 mid!77))))

(assert (=> d!103880 (= (arrayBitRangesEq!0 a1!799 a2!799 from!870 mid!77) e!225728)))

(declare-fun b!313561 () Bool)

(declare-fun e!225732 () Bool)

(assert (=> b!313561 (= e!225732 call!5925)))

(declare-fun c!15206 () Bool)

(declare-fun bm!5922 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5922 (= call!5925 (byteRangesEq!0 (ite c!15206 (select (arr!9439 a1!799) (_3!1594 lt!442316)) (select (arr!9439 a1!799) (_4!637 lt!442316))) (ite c!15206 (select (arr!9439 a2!799) (_3!1594 lt!442316)) (select (arr!9439 a2!799) (_4!637 lt!442316))) (ite c!15206 lt!442314 #b00000000000000000000000000000000) lt!442315))))

(declare-fun b!313562 () Bool)

(declare-fun e!225731 () Bool)

(assert (=> b!313562 (= e!225732 e!225731)))

(declare-fun res!256719 () Bool)

(assert (=> b!313562 (= res!256719 (byteRangesEq!0 (select (arr!9439 a1!799) (_3!1594 lt!442316)) (select (arr!9439 a2!799) (_3!1594 lt!442316)) lt!442314 #b00000000000000000000000000001000))))

(assert (=> b!313562 (=> (not res!256719) (not e!225731))))

(declare-fun b!313563 () Bool)

(assert (=> b!313563 (= e!225733 e!225732)))

(assert (=> b!313563 (= c!15206 (= (_3!1594 lt!442316) (_4!637 lt!442316)))))

(declare-fun b!313564 () Bool)

(declare-fun res!256716 () Bool)

(assert (=> b!313564 (= res!256716 (= lt!442315 #b00000000000000000000000000000000))))

(assert (=> b!313564 (=> res!256716 e!225730)))

(assert (=> b!313564 (= e!225731 e!225730)))

(assert (= (and d!103880 (not res!256718)) b!313559))

(assert (= (and b!313559 (not res!256717)) b!313560))

(assert (= (and b!313559 res!256720) b!313563))

(assert (= (and b!313563 c!15206) b!313561))

(assert (= (and b!313563 (not c!15206)) b!313562))

(assert (= (and b!313562 res!256719) b!313564))

(assert (= (and b!313564 (not res!256716)) b!313558))

(assert (= (or b!313561 b!313558) bm!5922))

(declare-fun m!451151 () Bool)

(assert (=> b!313559 m!451151))

(declare-fun m!451153 () Bool)

(assert (=> b!313560 m!451153))

(declare-fun m!451155 () Bool)

(assert (=> bm!5922 m!451155))

(declare-fun m!451157 () Bool)

(assert (=> bm!5922 m!451157))

(declare-fun m!451159 () Bool)

(assert (=> bm!5922 m!451159))

(declare-fun m!451161 () Bool)

(assert (=> bm!5922 m!451161))

(declare-fun m!451163 () Bool)

(assert (=> bm!5922 m!451163))

(assert (=> b!313562 m!451157))

(assert (=> b!313562 m!451161))

(assert (=> b!313562 m!451157))

(assert (=> b!313562 m!451161))

(declare-fun m!451165 () Bool)

(assert (=> b!313562 m!451165))

(assert (=> b!313474 d!103880))

(declare-fun d!103888 () Bool)

(assert (=> d!103888 (= (array_inv!7911 a1!799) (bvsge (size!8359 a1!799) #b00000000000000000000000000000000))))

(assert (=> start!69694 d!103888))

(declare-fun d!103890 () Bool)

(assert (=> d!103890 (= (array_inv!7911 a2!799) (bvsge (size!8359 a2!799) #b00000000000000000000000000000000))))

(assert (=> start!69694 d!103890))

(declare-fun d!103892 () Bool)

(assert (=> d!103892 (= (array_inv!7911 a3!74) (bvsge (size!8359 a3!74) #b00000000000000000000000000000000))))

(assert (=> start!69694 d!103892))

(declare-fun b!313565 () Bool)

(declare-fun e!225736 () Bool)

(declare-fun call!5926 () Bool)

(assert (=> b!313565 (= e!225736 call!5926)))

(declare-fun b!313566 () Bool)

(declare-fun e!225734 () Bool)

(declare-fun e!225739 () Bool)

(assert (=> b!313566 (= e!225734 e!225739)))

(declare-fun res!256725 () Bool)

(assert (=> b!313566 (=> (not res!256725) (not e!225739))))

(declare-fun e!225735 () Bool)

(assert (=> b!313566 (= res!256725 e!225735)))

(declare-fun res!256722 () Bool)

(assert (=> b!313566 (=> res!256722 e!225735)))

(declare-fun lt!442319 () tuple4!1274)

(assert (=> b!313566 (= res!256722 (bvsge (_1!13316 lt!442319) (_2!13316 lt!442319)))))

(declare-fun lt!442318 () (_ BitVec 32))

(assert (=> b!313566 (= lt!442318 ((_ extract 31 0) (bvsrem from!870 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!442317 () (_ BitVec 32))

(assert (=> b!313566 (= lt!442317 ((_ extract 31 0) (bvsrem from!870 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!313566 (= lt!442319 (arrayBitIndices!0 from!870 from!870))))

(declare-fun b!313567 () Bool)

(assert (=> b!313567 (= e!225735 (arrayRangesEq!1791 a1!799 a3!74 (_1!13316 lt!442319) (_2!13316 lt!442319)))))

(declare-fun d!103894 () Bool)

(declare-fun res!256723 () Bool)

(assert (=> d!103894 (=> res!256723 e!225734)))

(assert (=> d!103894 (= res!256723 (bvsge from!870 from!870))))

(assert (=> d!103894 (= (arrayBitRangesEq!0 a1!799 a3!74 from!870 from!870) e!225734)))

(declare-fun b!313568 () Bool)

(declare-fun e!225738 () Bool)

(assert (=> b!313568 (= e!225738 call!5926)))

(declare-fun c!15207 () Bool)

(declare-fun bm!5923 () Bool)

(assert (=> bm!5923 (= call!5926 (byteRangesEq!0 (ite c!15207 (select (arr!9439 a1!799) (_3!1594 lt!442319)) (select (arr!9439 a1!799) (_4!637 lt!442319))) (ite c!15207 (select (arr!9439 a3!74) (_3!1594 lt!442319)) (select (arr!9439 a3!74) (_4!637 lt!442319))) (ite c!15207 lt!442317 #b00000000000000000000000000000000) lt!442318))))

(declare-fun b!313569 () Bool)

(declare-fun e!225737 () Bool)

(assert (=> b!313569 (= e!225738 e!225737)))

(declare-fun res!256724 () Bool)

(assert (=> b!313569 (= res!256724 (byteRangesEq!0 (select (arr!9439 a1!799) (_3!1594 lt!442319)) (select (arr!9439 a3!74) (_3!1594 lt!442319)) lt!442317 #b00000000000000000000000000001000))))

(assert (=> b!313569 (=> (not res!256724) (not e!225737))))

(declare-fun b!313570 () Bool)

(assert (=> b!313570 (= e!225739 e!225738)))

(assert (=> b!313570 (= c!15207 (= (_3!1594 lt!442319) (_4!637 lt!442319)))))

(declare-fun b!313571 () Bool)

(declare-fun res!256721 () Bool)

(assert (=> b!313571 (= res!256721 (= lt!442318 #b00000000000000000000000000000000))))

(assert (=> b!313571 (=> res!256721 e!225736)))

(assert (=> b!313571 (= e!225737 e!225736)))

(assert (= (and d!103894 (not res!256723)) b!313566))

(assert (= (and b!313566 (not res!256722)) b!313567))

(assert (= (and b!313566 res!256725) b!313570))

(assert (= (and b!313570 c!15207) b!313568))

(assert (= (and b!313570 (not c!15207)) b!313569))

(assert (= (and b!313569 res!256724) b!313571))

(assert (= (and b!313571 (not res!256721)) b!313565))

(assert (= (or b!313568 b!313565) bm!5923))

(declare-fun m!451167 () Bool)

(assert (=> b!313566 m!451167))

(declare-fun m!451169 () Bool)

(assert (=> b!313567 m!451169))

(declare-fun m!451171 () Bool)

(assert (=> bm!5923 m!451171))

(declare-fun m!451173 () Bool)

(assert (=> bm!5923 m!451173))

(declare-fun m!451175 () Bool)

(assert (=> bm!5923 m!451175))

(declare-fun m!451177 () Bool)

(assert (=> bm!5923 m!451177))

(declare-fun m!451179 () Bool)

(assert (=> bm!5923 m!451179))

(assert (=> b!313569 m!451173))

(assert (=> b!313569 m!451177))

(assert (=> b!313569 m!451173))

(assert (=> b!313569 m!451177))

(declare-fun m!451189 () Bool)

(assert (=> b!313569 m!451189))

(assert (=> b!313476 d!103894))

(declare-fun b!313579 () Bool)

(declare-fun e!225748 () Bool)

(declare-fun call!5928 () Bool)

(assert (=> b!313579 (= e!225748 call!5928)))

(declare-fun b!313580 () Bool)

(declare-fun e!225746 () Bool)

(declare-fun e!225751 () Bool)

(assert (=> b!313580 (= e!225746 e!225751)))

(declare-fun res!256735 () Bool)

(assert (=> b!313580 (=> (not res!256735) (not e!225751))))

(declare-fun e!225747 () Bool)

(assert (=> b!313580 (= res!256735 e!225747)))

(declare-fun res!256732 () Bool)

(assert (=> b!313580 (=> res!256732 e!225747)))

(declare-fun lt!442325 () tuple4!1274)

(assert (=> b!313580 (= res!256732 (bvsge (_1!13316 lt!442325) (_2!13316 lt!442325)))))

(declare-fun lt!442324 () (_ BitVec 32))

(assert (=> b!313580 (= lt!442324 ((_ extract 31 0) (bvsrem to!837 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!442323 () (_ BitVec 32))

(assert (=> b!313580 (= lt!442323 ((_ extract 31 0) (bvsrem from!870 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!313580 (= lt!442325 (arrayBitIndices!0 from!870 to!837))))

(declare-fun b!313581 () Bool)

(assert (=> b!313581 (= e!225747 (arrayRangesEq!1791 a2!799 a3!74 (_1!13316 lt!442325) (_2!13316 lt!442325)))))

(declare-fun d!103896 () Bool)

(declare-fun res!256733 () Bool)

(assert (=> d!103896 (=> res!256733 e!225746)))

(assert (=> d!103896 (= res!256733 (bvsge from!870 to!837))))

(assert (=> d!103896 (= (arrayBitRangesEq!0 a2!799 a3!74 from!870 to!837) e!225746)))

(declare-fun b!313582 () Bool)

(declare-fun e!225750 () Bool)

(assert (=> b!313582 (= e!225750 call!5928)))

(declare-fun c!15209 () Bool)

(declare-fun bm!5925 () Bool)

(assert (=> bm!5925 (= call!5928 (byteRangesEq!0 (ite c!15209 (select (arr!9439 a2!799) (_3!1594 lt!442325)) (select (arr!9439 a2!799) (_4!637 lt!442325))) (ite c!15209 (select (arr!9439 a3!74) (_3!1594 lt!442325)) (select (arr!9439 a3!74) (_4!637 lt!442325))) (ite c!15209 lt!442323 #b00000000000000000000000000000000) lt!442324))))

(declare-fun b!313583 () Bool)

(declare-fun e!225749 () Bool)

(assert (=> b!313583 (= e!225750 e!225749)))

(declare-fun res!256734 () Bool)

(assert (=> b!313583 (= res!256734 (byteRangesEq!0 (select (arr!9439 a2!799) (_3!1594 lt!442325)) (select (arr!9439 a3!74) (_3!1594 lt!442325)) lt!442323 #b00000000000000000000000000001000))))

(assert (=> b!313583 (=> (not res!256734) (not e!225749))))

(declare-fun b!313584 () Bool)

(assert (=> b!313584 (= e!225751 e!225750)))

(assert (=> b!313584 (= c!15209 (= (_3!1594 lt!442325) (_4!637 lt!442325)))))

(declare-fun b!313585 () Bool)

(declare-fun res!256731 () Bool)

(assert (=> b!313585 (= res!256731 (= lt!442324 #b00000000000000000000000000000000))))

(assert (=> b!313585 (=> res!256731 e!225748)))

(assert (=> b!313585 (= e!225749 e!225748)))

(assert (= (and d!103896 (not res!256733)) b!313580))

(assert (= (and b!313580 (not res!256732)) b!313581))

(assert (= (and b!313580 res!256735) b!313584))

(assert (= (and b!313584 c!15209) b!313582))

(assert (= (and b!313584 (not c!15209)) b!313583))

(assert (= (and b!313583 res!256734) b!313585))

(assert (= (and b!313585 (not res!256731)) b!313579))

(assert (= (or b!313582 b!313579) bm!5925))

(declare-fun m!451199 () Bool)

(assert (=> b!313580 m!451199))

(declare-fun m!451205 () Bool)

(assert (=> b!313581 m!451205))

(declare-fun m!451213 () Bool)

(assert (=> bm!5925 m!451213))

(declare-fun m!451217 () Bool)

(assert (=> bm!5925 m!451217))

(declare-fun m!451221 () Bool)

(assert (=> bm!5925 m!451221))

(declare-fun m!451223 () Bool)

(assert (=> bm!5925 m!451223))

(declare-fun m!451225 () Bool)

(assert (=> bm!5925 m!451225))

(assert (=> b!313583 m!451217))

(assert (=> b!313583 m!451223))

(assert (=> b!313583 m!451217))

(assert (=> b!313583 m!451223))

(declare-fun m!451229 () Bool)

(assert (=> b!313583 m!451229))

