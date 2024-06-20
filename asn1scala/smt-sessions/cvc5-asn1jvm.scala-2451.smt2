; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62154 () Bool)

(assert start!62154)

(declare-fun res!231505 () Bool)

(declare-fun e!198628 () Bool)

(assert (=> start!62154 (=> (not res!231505) (not e!198628))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16075 0))(
  ( (array!16076 (arr!7954 (Array (_ BitVec 32) (_ BitVec 8))) (size!6958 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16075)

(declare-fun a2!699 () array!16075)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!62154 (= res!231505 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6958 a1!699) (size!6958 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6958 a1!699))))))))

(assert (=> start!62154 e!198628))

(assert (=> start!62154 true))

(declare-fun array_inv!6682 (array!16075) Bool)

(assert (=> start!62154 (array_inv!6682 a1!699)))

(assert (=> start!62154 (array_inv!6682 a2!699)))

(declare-fun b!278801 () Bool)

(declare-fun res!231503 () Bool)

(assert (=> b!278801 (=> (not res!231503) (not e!198628))))

(assert (=> b!278801 (= res!231503 (bvslt from!822 to!789))))

(declare-fun b!278800 () Bool)

(declare-fun res!231506 () Bool)

(assert (=> b!278800 (=> (not res!231506) (not e!198628))))

(declare-fun arrayBitRangesEq!0 (array!16075 array!16075 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278800 (= res!231506 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278802 () Bool)

(declare-fun e!198627 () Bool)

(assert (=> b!278802 (= e!198628 e!198627)))

(declare-fun res!231504 () Bool)

(assert (=> b!278802 (=> (not res!231504) (not e!198627))))

(declare-datatypes ((tuple4!666 0))(
  ( (tuple4!667 (_1!12408 (_ BitVec 32)) (_2!12408 (_ BitVec 32)) (_3!1113 (_ BitVec 32)) (_4!333 (_ BitVec 32))) )
))
(declare-fun lt!416121 () tuple4!666)

(assert (=> b!278802 (= res!231504 (bvslt (_1!12408 lt!416121) (_2!12408 lt!416121)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!666)

(assert (=> b!278802 (= lt!416121 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!278803 () Bool)

(declare-fun arrayRangesEq!1226 (array!16075 array!16075 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278803 (= e!198627 (not (arrayRangesEq!1226 a1!699 a2!699 (_1!12408 lt!416121) (_2!12408 lt!416121))))))

(assert (= (and start!62154 res!231505) b!278800))

(assert (= (and b!278800 res!231506) b!278801))

(assert (= (and b!278801 res!231503) b!278802))

(assert (= (and b!278802 res!231504) b!278803))

(declare-fun m!411925 () Bool)

(assert (=> start!62154 m!411925))

(declare-fun m!411927 () Bool)

(assert (=> start!62154 m!411927))

(declare-fun m!411929 () Bool)

(assert (=> b!278800 m!411929))

(declare-fun m!411931 () Bool)

(assert (=> b!278802 m!411931))

(declare-fun m!411933 () Bool)

(assert (=> b!278803 m!411933))

(push 1)

(assert (not b!278803))

(assert (not start!62154))

(assert (not b!278802))

(assert (not b!278800))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95930 () Bool)

(declare-fun res!231535 () Bool)

(declare-fun e!198659 () Bool)

(assert (=> d!95930 (=> res!231535 e!198659)))

(assert (=> d!95930 (= res!231535 (= (_1!12408 lt!416121) (_2!12408 lt!416121)))))

(assert (=> d!95930 (= (arrayRangesEq!1226 a1!699 a2!699 (_1!12408 lt!416121) (_2!12408 lt!416121)) e!198659)))

(declare-fun b!278832 () Bool)

(declare-fun e!198660 () Bool)

(assert (=> b!278832 (= e!198659 e!198660)))

(declare-fun res!231536 () Bool)

(assert (=> b!278832 (=> (not res!231536) (not e!198660))))

(assert (=> b!278832 (= res!231536 (= (select (arr!7954 a1!699) (_1!12408 lt!416121)) (select (arr!7954 a2!699) (_1!12408 lt!416121))))))

(declare-fun b!278833 () Bool)

(assert (=> b!278833 (= e!198660 (arrayRangesEq!1226 a1!699 a2!699 (bvadd (_1!12408 lt!416121) #b00000000000000000000000000000001) (_2!12408 lt!416121)))))

(assert (= (and d!95930 (not res!231535)) b!278832))

(assert (= (and b!278832 res!231536) b!278833))

(declare-fun m!411955 () Bool)

(assert (=> b!278832 m!411955))

(declare-fun m!411957 () Bool)

(assert (=> b!278832 m!411957))

(declare-fun m!411959 () Bool)

(assert (=> b!278833 m!411959))

(assert (=> b!278803 d!95930))

(declare-fun d!95934 () Bool)

(assert (=> d!95934 (= (array_inv!6682 a1!699) (bvsge (size!6958 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62154 d!95934))

(declare-fun d!95936 () Bool)

(assert (=> d!95936 (= (array_inv!6682 a2!699) (bvsge (size!6958 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62154 d!95936))

(declare-fun d!95938 () Bool)

(assert (=> d!95938 (= (arrayBitIndices!0 from!822 to!789) (tuple4!667 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!278802 d!95938))

(declare-fun b!278875 () Bool)

(declare-fun e!198698 () Bool)

(declare-fun e!198700 () Bool)

(assert (=> b!278875 (= e!198698 e!198700)))

(declare-fun res!231570 () Bool)

(assert (=> b!278875 (=> (not res!231570) (not e!198700))))

(declare-fun e!198697 () Bool)

(assert (=> b!278875 (= res!231570 e!198697)))

(declare-fun res!231568 () Bool)

(assert (=> b!278875 (=> res!231568 e!198697)))

(declare-fun lt!416145 () tuple4!666)

(assert (=> b!278875 (= res!231568 (bvsge (_1!12408 lt!416145) (_2!12408 lt!416145)))))

(declare-fun lt!416143 () (_ BitVec 32))

(assert (=> b!278875 (= lt!416143 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!416144 () (_ BitVec 32))

(assert (=> b!278875 (= lt!416144 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!278875 (= lt!416145 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!278876 () Bool)

(declare-fun e!198699 () Bool)

(declare-fun call!4532 () Bool)

(assert (=> b!278876 (= e!198699 call!4532)))

(declare-fun b!278877 () Bool)

(declare-fun e!198702 () Bool)

(assert (=> b!278877 (= e!198702 call!4532)))

(declare-fun b!278878 () Bool)

(declare-fun res!231569 () Bool)

(assert (=> b!278878 (= res!231569 (= lt!416143 #b00000000000000000000000000000000))))

(assert (=> b!278878 (=> res!231569 e!198699)))

(declare-fun e!198701 () Bool)

(assert (=> b!278878 (= e!198701 e!198699)))

(declare-fun b!278879 () Bool)

(assert (=> b!278879 (= e!198697 (arrayRangesEq!1226 a1!699 a2!699 (_1!12408 lt!416145) (_2!12408 lt!416145)))))

(declare-fun b!278880 () Bool)

(assert (=> b!278880 (= e!198702 e!198701)))

(declare-fun res!231571 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278880 (= res!231571 (byteRangesEq!0 (select (arr!7954 a1!699) (_3!1113 lt!416145)) (select (arr!7954 a2!699) (_3!1113 lt!416145)) lt!416144 #b00000000000000000000000000001000))))

(assert (=> b!278880 (=> (not res!231571) (not e!198701))))

(declare-fun b!278881 () Bool)

(assert (=> b!278881 (= e!198700 e!198702)))

(declare-fun c!12825 () Bool)

(assert (=> b!278881 (= c!12825 (= (_3!1113 lt!416145) (_4!333 lt!416145)))))

(declare-fun bm!4529 () Bool)

(assert (=> bm!4529 (= call!4532 (byteRangesEq!0 (ite c!12825 (select (arr!7954 a1!699) (_3!1113 lt!416145)) (select (arr!7954 a1!699) (_4!333 lt!416145))) (ite c!12825 (select (arr!7954 a2!699) (_3!1113 lt!416145)) (select (arr!7954 a2!699) (_4!333 lt!416145))) (ite c!12825 lt!416144 #b00000000000000000000000000000000) lt!416143))))

(declare-fun d!95940 () Bool)

(declare-fun res!231572 () Bool)

(assert (=> d!95940 (=> res!231572 e!198698)))

(assert (=> d!95940 (= res!231572 (bvsge from!822 to!789))))

(assert (=> d!95940 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!198698)))

(assert (= (and d!95940 (not res!231572)) b!278875))

(assert (= (and b!278875 (not res!231568)) b!278879))

(assert (= (and b!278875 res!231570) b!278881))

(assert (= (and b!278881 c!12825) b!278877))

(assert (= (and b!278881 (not c!12825)) b!278880))

(assert (= (and b!278880 res!231571) b!278878))

(assert (= (and b!278878 (not res!231569)) b!278876))

(assert (= (or b!278877 b!278876) bm!4529))

(assert (=> b!278875 m!411931))

(declare-fun m!411981 () Bool)

(assert (=> b!278879 m!411981))

(declare-fun m!411983 () Bool)

(assert (=> b!278880 m!411983))

(declare-fun m!411985 () Bool)

(assert (=> b!278880 m!411985))

(assert (=> b!278880 m!411983))

(assert (=> b!278880 m!411985))

(declare-fun m!411987 () Bool)

(assert (=> b!278880 m!411987))

(declare-fun m!411989 () Bool)

(assert (=> bm!4529 m!411989))

(assert (=> bm!4529 m!411983))

(declare-fun m!411991 () Bool)

(assert (=> bm!4529 m!411991))

(assert (=> bm!4529 m!411985))

(declare-fun m!411993 () Bool)

(assert (=> bm!4529 m!411993))

(assert (=> b!278800 d!95940))

(push 1)

(assert (not b!278875))

(assert (not b!278879))

(assert (not bm!4529))

(assert (not b!278833))

(assert (not b!278880))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

