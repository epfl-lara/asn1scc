; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62184 () Bool)

(assert start!62184)

(declare-fun res!231604 () Bool)

(declare-fun e!198736 () Bool)

(assert (=> start!62184 (=> (not res!231604) (not e!198736))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16084 0))(
  ( (array!16085 (arr!7957 (Array (_ BitVec 32) (_ BitVec 8))) (size!6961 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16084)

(declare-fun a2!699 () array!16084)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!62184 (= res!231604 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6961 a1!699) (size!6961 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6961 a1!699))))))))

(assert (=> start!62184 e!198736))

(assert (=> start!62184 true))

(declare-fun array_inv!6685 (array!16084) Bool)

(assert (=> start!62184 (array_inv!6685 a1!699)))

(assert (=> start!62184 (array_inv!6685 a2!699)))

(declare-fun b!278918 () Bool)

(declare-fun res!231603 () Bool)

(assert (=> b!278918 (=> (not res!231603) (not e!198736))))

(assert (=> b!278918 (= res!231603 (bvslt from!822 to!789))))

(declare-fun b!278917 () Bool)

(declare-fun res!231602 () Bool)

(assert (=> b!278917 (=> (not res!231602) (not e!198736))))

(declare-fun arrayBitRangesEq!0 (array!16084 array!16084 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278917 (= res!231602 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278919 () Bool)

(declare-fun e!198735 () Bool)

(assert (=> b!278919 (= e!198736 e!198735)))

(declare-fun res!231605 () Bool)

(assert (=> b!278919 (=> (not res!231605) (not e!198735))))

(declare-datatypes ((tuple4!672 0))(
  ( (tuple4!673 (_1!12411 (_ BitVec 32)) (_2!12411 (_ BitVec 32)) (_3!1116 (_ BitVec 32)) (_4!336 (_ BitVec 32))) )
))
(declare-fun lt!416157 () tuple4!672)

(assert (=> b!278919 (= res!231605 (bvslt (_1!12411 lt!416157) (_2!12411 lt!416157)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!672)

(assert (=> b!278919 (= lt!416157 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!278920 () Bool)

(assert (=> b!278920 (= e!198735 (not (and (bvsle #b00000000000000000000000000000000 (_1!12411 lt!416157)) (bvsle (_1!12411 lt!416157) (_2!12411 lt!416157)) (bvsle (_2!12411 lt!416157) (size!6961 a1!699)))))))

(declare-fun arrayRangesEq!1229 (array!16084 array!16084 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278920 (arrayRangesEq!1229 a1!699 a2!699 (_1!12411 lt!416157) (_2!12411 lt!416157))))

(assert (= (and start!62184 res!231604) b!278917))

(assert (= (and b!278917 res!231602) b!278918))

(assert (= (and b!278918 res!231603) b!278919))

(assert (= (and b!278919 res!231605) b!278920))

(declare-fun m!412015 () Bool)

(assert (=> start!62184 m!412015))

(declare-fun m!412017 () Bool)

(assert (=> start!62184 m!412017))

(declare-fun m!412019 () Bool)

(assert (=> b!278917 m!412019))

(declare-fun m!412021 () Bool)

(assert (=> b!278919 m!412021))

(declare-fun m!412023 () Bool)

(assert (=> b!278920 m!412023))

(push 1)

(assert (not b!278920))

(assert (not b!278919))

(assert (not start!62184))

(assert (not b!278917))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95962 () Bool)

(declare-fun res!231634 () Bool)

(declare-fun e!198767 () Bool)

(assert (=> d!95962 (=> res!231634 e!198767)))

(assert (=> d!95962 (= res!231634 (= (_1!12411 lt!416157) (_2!12411 lt!416157)))))

(assert (=> d!95962 (= (arrayRangesEq!1229 a1!699 a2!699 (_1!12411 lt!416157) (_2!12411 lt!416157)) e!198767)))

(declare-fun b!278949 () Bool)

(declare-fun e!198768 () Bool)

(assert (=> b!278949 (= e!198767 e!198768)))

(declare-fun res!231635 () Bool)

(assert (=> b!278949 (=> (not res!231635) (not e!198768))))

(assert (=> b!278949 (= res!231635 (= (select (arr!7957 a1!699) (_1!12411 lt!416157)) (select (arr!7957 a2!699) (_1!12411 lt!416157))))))

(declare-fun b!278950 () Bool)

(assert (=> b!278950 (= e!198768 (arrayRangesEq!1229 a1!699 a2!699 (bvadd (_1!12411 lt!416157) #b00000000000000000000000000000001) (_2!12411 lt!416157)))))

(assert (= (and d!95962 (not res!231634)) b!278949))

(assert (= (and b!278949 res!231635) b!278950))

(declare-fun m!412045 () Bool)

(assert (=> b!278949 m!412045))

(declare-fun m!412047 () Bool)

(assert (=> b!278949 m!412047))

(declare-fun m!412049 () Bool)

(assert (=> b!278950 m!412049))

(assert (=> b!278920 d!95962))

(declare-fun d!95964 () Bool)

(assert (=> d!95964 (= (arrayBitIndices!0 from!822 to!789) (tuple4!673 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!278919 d!95964))

(declare-fun d!95966 () Bool)

(assert (=> d!95966 (= (array_inv!6685 a1!699) (bvsge (size!6961 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62184 d!95966))

(declare-fun d!95968 () Bool)

(assert (=> d!95968 (= (array_inv!6685 a2!699) (bvsge (size!6961 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62184 d!95968))

(declare-fun b!278986 () Bool)

(declare-fun res!231662 () Bool)

(declare-fun lt!416179 () (_ BitVec 32))

(assert (=> b!278986 (= res!231662 (= lt!416179 #b00000000000000000000000000000000))))

(declare-fun e!198802 () Bool)

(assert (=> b!278986 (=> res!231662 e!198802)))

(declare-fun e!198804 () Bool)

(assert (=> b!278986 (= e!198804 e!198802)))

(declare-fun lt!416180 () tuple4!672)

(declare-fun e!198800 () Bool)

(declare-fun b!278987 () Bool)

(assert (=> b!278987 (= e!198800 (arrayRangesEq!1229 a1!699 a2!699 (_1!12411 lt!416180) (_2!12411 lt!416180)))))

(declare-fun b!278988 () Bool)

(declare-fun e!198801 () Bool)

(assert (=> b!278988 (= e!198801 e!198804)))

(declare-fun res!231664 () Bool)

(declare-fun lt!416181 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278988 (= res!231664 (byteRangesEq!0 (select (arr!7957 a1!699) (_3!1116 lt!416180)) (select (arr!7957 a2!699) (_3!1116 lt!416180)) lt!416181 #b00000000000000000000000000001000))))

(assert (=> b!278988 (=> (not res!231664) (not e!198804))))

(declare-fun b!278989 () Bool)

(declare-fun e!198799 () Bool)

(assert (=> b!278989 (= e!198799 e!198801)))

(declare-fun c!12834 () Bool)

(assert (=> b!278989 (= c!12834 (= (_3!1116 lt!416180) (_4!336 lt!416180)))))

(declare-fun b!278990 () Bool)

(declare-fun call!4541 () Bool)

(assert (=> b!278990 (= e!198801 call!4541)))

(declare-fun b!278991 () Bool)

(assert (=> b!278991 (= e!198802 call!4541)))

(declare-fun bm!4538 () Bool)

(assert (=> bm!4538 (= call!4541 (byteRangesEq!0 (ite c!12834 (select (arr!7957 a1!699) (_3!1116 lt!416180)) (select (arr!7957 a1!699) (_4!336 lt!416180))) (ite c!12834 (select (arr!7957 a2!699) (_3!1116 lt!416180)) (select (arr!7957 a2!699) (_4!336 lt!416180))) (ite c!12834 lt!416181 #b00000000000000000000000000000000) lt!416179))))

(declare-fun d!95970 () Bool)

(declare-fun res!231665 () Bool)

(declare-fun e!198803 () Bool)

(assert (=> d!95970 (=> res!231665 e!198803)))

(assert (=> d!95970 (= res!231665 (bvsge from!822 to!789))))

(assert (=> d!95970 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!198803)))

(declare-fun b!278992 () Bool)

(assert (=> b!278992 (= e!198803 e!198799)))

(declare-fun res!231661 () Bool)

(assert (=> b!278992 (=> (not res!231661) (not e!198799))))

(assert (=> b!278992 (= res!231661 e!198800)))

(declare-fun res!231663 () Bool)

(assert (=> b!278992 (=> res!231663 e!198800)))

(assert (=> b!278992 (= res!231663 (bvsge (_1!12411 lt!416180) (_2!12411 lt!416180)))))

(assert (=> b!278992 (= lt!416179 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!278992 (= lt!416181 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!278992 (= lt!416180 (arrayBitIndices!0 from!822 to!789))))

(assert (= (and d!95970 (not res!231665)) b!278992))

(assert (= (and b!278992 (not res!231663)) b!278987))

(assert (= (and b!278992 res!231661) b!278989))

(assert (= (and b!278989 c!12834) b!278990))

(assert (= (and b!278989 (not c!12834)) b!278988))

(assert (= (and b!278988 res!231664) b!278986))

(assert (= (and b!278986 (not res!231662)) b!278991))

(assert (= (or b!278990 b!278991) bm!4538))

(declare-fun m!412065 () Bool)

(assert (=> b!278987 m!412065))

(declare-fun m!412067 () Bool)

(assert (=> b!278988 m!412067))

(declare-fun m!412069 () Bool)

(assert (=> b!278988 m!412069))

(assert (=> b!278988 m!412067))

(assert (=> b!278988 m!412069))

(declare-fun m!412071 () Bool)

(assert (=> b!278988 m!412071))

(declare-fun m!412073 () Bool)

(assert (=> bm!4538 m!412073))

(declare-fun m!412075 () Bool)

(assert (=> bm!4538 m!412075))

(assert (=> bm!4538 m!412069))

(declare-fun m!412077 () Bool)

(assert (=> bm!4538 m!412077))

(assert (=> bm!4538 m!412067))

(assert (=> b!278992 m!412021))

(assert (=> b!278917 d!95970))

(push 1)

(assert (not bm!4538))

(assert (not b!278950))

(assert (not b!278988))

(assert (not b!278987))

(assert (not b!278992))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

