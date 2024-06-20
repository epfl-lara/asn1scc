; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62434 () Bool)

(assert start!62434)

(declare-fun b!279869 () Bool)

(declare-datatypes ((Unit!19625 0))(
  ( (Unit!19626) )
))
(declare-fun e!199580 () Unit!19625)

(declare-fun Unit!19627 () Unit!19625)

(assert (=> b!279869 (= e!199580 Unit!19627)))

(declare-datatypes ((array!16160 0))(
  ( (array!16161 (arr!7986 (Array (_ BitVec 32) (_ BitVec 8))) (size!6990 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16160)

(declare-fun a2!699 () array!16160)

(declare-datatypes ((tuple4!730 0))(
  ( (tuple4!731 (_1!12440 (_ BitVec 32)) (_2!12440 (_ BitVec 32)) (_3!1145 (_ BitVec 32)) (_4!365 (_ BitVec 32))) )
))
(declare-fun lt!416586 () tuple4!730)

(declare-fun arrayRangesEq!1258 (array!16160 array!16160 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279869 (arrayRangesEq!1258 a1!699 a2!699 (_1!12440 lt!416586) (_2!12440 lt!416586))))

(declare-fun lt!416583 () Unit!19625)

(declare-fun arrayRangesEqSymmetricLemma!165 (array!16160 array!16160 (_ BitVec 32) (_ BitVec 32)) Unit!19625)

(assert (=> b!279869 (= lt!416583 (arrayRangesEqSymmetricLemma!165 a1!699 a2!699 (_1!12440 lt!416586) (_2!12440 lt!416586)))))

(assert (=> b!279869 (arrayRangesEq!1258 a2!699 a1!699 (_1!12440 lt!416586) (_2!12440 lt!416586))))

(declare-fun b!279870 () Bool)

(declare-fun e!199583 () Bool)

(declare-fun e!199584 () Bool)

(assert (=> b!279870 (= e!199583 e!199584)))

(declare-fun res!232341 () Bool)

(assert (=> b!279870 (=> (not res!232341) (not e!199584))))

(assert (=> b!279870 (= res!232341 (= (_3!1145 lt!416586) (_4!365 lt!416586)))))

(declare-fun lt!416582 () Unit!19625)

(assert (=> b!279870 (= lt!416582 e!199580)))

(declare-fun c!12936 () Bool)

(assert (=> b!279870 (= c!12936 (bvslt (_1!12440 lt!416586) (_2!12440 lt!416586)))))

(declare-fun lt!416584 () (_ BitVec 32))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!279870 (= lt!416584 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!416585 () (_ BitVec 32))

(declare-fun from!822 () (_ BitVec 64))

(assert (=> b!279870 (= lt!416585 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!730)

(assert (=> b!279870 (= lt!416586 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!279872 () Bool)

(declare-fun Unit!19628 () Unit!19625)

(assert (=> b!279872 (= e!199580 Unit!19628)))

(declare-fun b!279873 () Bool)

(declare-fun res!232343 () Bool)

(assert (=> b!279873 (=> (not res!232343) (not e!199583))))

(declare-fun arrayBitRangesEq!0 (array!16160 array!16160 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!279873 (= res!232343 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!279874 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279874 (= e!199584 (not (byteRangesEq!0 (select (arr!7986 a2!699) (_3!1145 lt!416586)) (select (arr!7986 a1!699) (_3!1145 lt!416586)) lt!416585 lt!416584)))))

(assert (=> b!279874 (byteRangesEq!0 (select (arr!7986 a1!699) (_3!1145 lt!416586)) (select (arr!7986 a2!699) (_3!1145 lt!416586)) lt!416585 lt!416584)))

(declare-fun res!232340 () Bool)

(assert (=> start!62434 (=> (not res!232340) (not e!199583))))

(assert (=> start!62434 (= res!232340 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6990 a1!699) (size!6990 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6990 a1!699))))))))

(assert (=> start!62434 e!199583))

(assert (=> start!62434 true))

(declare-fun array_inv!6714 (array!16160) Bool)

(assert (=> start!62434 (array_inv!6714 a1!699)))

(assert (=> start!62434 (array_inv!6714 a2!699)))

(declare-fun b!279871 () Bool)

(declare-fun res!232342 () Bool)

(assert (=> b!279871 (=> (not res!232342) (not e!199583))))

(assert (=> b!279871 (= res!232342 (bvslt from!822 to!789))))

(assert (= (and start!62434 res!232340) b!279873))

(assert (= (and b!279873 res!232343) b!279871))

(assert (= (and b!279871 res!232342) b!279870))

(assert (= (and b!279870 c!12936) b!279869))

(assert (= (and b!279870 (not c!12936)) b!279872))

(assert (= (and b!279870 res!232341) b!279874))

(declare-fun m!412911 () Bool)

(assert (=> start!62434 m!412911))

(declare-fun m!412913 () Bool)

(assert (=> start!62434 m!412913))

(declare-fun m!412915 () Bool)

(assert (=> b!279874 m!412915))

(declare-fun m!412917 () Bool)

(assert (=> b!279874 m!412917))

(assert (=> b!279874 m!412915))

(assert (=> b!279874 m!412917))

(declare-fun m!412919 () Bool)

(assert (=> b!279874 m!412919))

(assert (=> b!279874 m!412917))

(assert (=> b!279874 m!412915))

(declare-fun m!412921 () Bool)

(assert (=> b!279874 m!412921))

(declare-fun m!412923 () Bool)

(assert (=> b!279869 m!412923))

(declare-fun m!412925 () Bool)

(assert (=> b!279869 m!412925))

(declare-fun m!412927 () Bool)

(assert (=> b!279869 m!412927))

(declare-fun m!412929 () Bool)

(assert (=> b!279870 m!412929))

(declare-fun m!412931 () Bool)

(assert (=> b!279873 m!412931))

(push 1)

(assert (not b!279870))

(assert (not b!279874))

(assert (not b!279873))

(assert (not b!279869))

(assert (not start!62434))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

