; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62430 () Bool)

(assert start!62430)

(declare-fun lt!416553 () (_ BitVec 32))

(declare-datatypes ((tuple4!726 0))(
  ( (tuple4!727 (_1!12438 (_ BitVec 32)) (_2!12438 (_ BitVec 32)) (_3!1143 (_ BitVec 32)) (_4!363 (_ BitVec 32))) )
))
(declare-fun lt!416555 () tuple4!726)

(declare-fun b!279833 () Bool)

(declare-datatypes ((array!16156 0))(
  ( (array!16157 (arr!7984 (Array (_ BitVec 32) (_ BitVec 8))) (size!6988 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16156)

(declare-fun e!199551 () Bool)

(declare-fun lt!416554 () (_ BitVec 32))

(declare-fun a2!699 () array!16156)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279833 (= e!199551 (not (byteRangesEq!0 (select (arr!7984 a2!699) (_3!1143 lt!416555)) (select (arr!7984 a1!699) (_3!1143 lt!416555)) lt!416553 lt!416554)))))

(assert (=> b!279833 (byteRangesEq!0 (select (arr!7984 a1!699) (_3!1143 lt!416555)) (select (arr!7984 a2!699) (_3!1143 lt!416555)) lt!416553 lt!416554)))

(declare-fun b!279834 () Bool)

(declare-datatypes ((Unit!19617 0))(
  ( (Unit!19618) )
))
(declare-fun e!199550 () Unit!19617)

(declare-fun Unit!19619 () Unit!19617)

(assert (=> b!279834 (= e!199550 Unit!19619)))

(declare-fun b!279835 () Bool)

(declare-fun res!232319 () Bool)

(declare-fun e!199552 () Bool)

(assert (=> b!279835 (=> (not res!232319) (not e!199552))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!279835 (= res!232319 (bvslt from!822 to!789))))

(declare-fun b!279836 () Bool)

(declare-fun res!232317 () Bool)

(assert (=> b!279836 (=> (not res!232317) (not e!199552))))

(declare-fun arrayBitRangesEq!0 (array!16156 array!16156 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!279836 (= res!232317 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun res!232316 () Bool)

(assert (=> start!62430 (=> (not res!232316) (not e!199552))))

(assert (=> start!62430 (= res!232316 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6988 a1!699) (size!6988 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6988 a1!699))))))))

(assert (=> start!62430 e!199552))

(assert (=> start!62430 true))

(declare-fun array_inv!6712 (array!16156) Bool)

(assert (=> start!62430 (array_inv!6712 a1!699)))

(assert (=> start!62430 (array_inv!6712 a2!699)))

(declare-fun b!279837 () Bool)

(declare-fun Unit!19620 () Unit!19617)

(assert (=> b!279837 (= e!199550 Unit!19620)))

(declare-fun arrayRangesEq!1256 (array!16156 array!16156 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279837 (arrayRangesEq!1256 a1!699 a2!699 (_1!12438 lt!416555) (_2!12438 lt!416555))))

(declare-fun lt!416556 () Unit!19617)

(declare-fun arrayRangesEqSymmetricLemma!163 (array!16156 array!16156 (_ BitVec 32) (_ BitVec 32)) Unit!19617)

(assert (=> b!279837 (= lt!416556 (arrayRangesEqSymmetricLemma!163 a1!699 a2!699 (_1!12438 lt!416555) (_2!12438 lt!416555)))))

(assert (=> b!279837 (arrayRangesEq!1256 a2!699 a1!699 (_1!12438 lt!416555) (_2!12438 lt!416555))))

(declare-fun b!279838 () Bool)

(assert (=> b!279838 (= e!199552 e!199551)))

(declare-fun res!232318 () Bool)

(assert (=> b!279838 (=> (not res!232318) (not e!199551))))

(assert (=> b!279838 (= res!232318 (= (_3!1143 lt!416555) (_4!363 lt!416555)))))

(declare-fun lt!416552 () Unit!19617)

(assert (=> b!279838 (= lt!416552 e!199550)))

(declare-fun c!12930 () Bool)

(assert (=> b!279838 (= c!12930 (bvslt (_1!12438 lt!416555) (_2!12438 lt!416555)))))

(assert (=> b!279838 (= lt!416554 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!279838 (= lt!416553 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!726)

(assert (=> b!279838 (= lt!416555 (arrayBitIndices!0 from!822 to!789))))

(assert (= (and start!62430 res!232316) b!279836))

(assert (= (and b!279836 res!232317) b!279835))

(assert (= (and b!279835 res!232319) b!279838))

(assert (= (and b!279838 c!12930) b!279837))

(assert (= (and b!279838 (not c!12930)) b!279834))

(assert (= (and b!279838 res!232318) b!279833))

(declare-fun m!412867 () Bool)

(assert (=> b!279833 m!412867))

(declare-fun m!412869 () Bool)

(assert (=> b!279833 m!412869))

(assert (=> b!279833 m!412867))

(assert (=> b!279833 m!412869))

(declare-fun m!412871 () Bool)

(assert (=> b!279833 m!412871))

(assert (=> b!279833 m!412869))

(assert (=> b!279833 m!412867))

(declare-fun m!412873 () Bool)

(assert (=> b!279833 m!412873))

(declare-fun m!412875 () Bool)

(assert (=> start!62430 m!412875))

(declare-fun m!412877 () Bool)

(assert (=> start!62430 m!412877))

(declare-fun m!412879 () Bool)

(assert (=> b!279838 m!412879))

(declare-fun m!412881 () Bool)

(assert (=> b!279837 m!412881))

(declare-fun m!412883 () Bool)

(assert (=> b!279837 m!412883))

(declare-fun m!412885 () Bool)

(assert (=> b!279837 m!412885))

(declare-fun m!412887 () Bool)

(assert (=> b!279836 m!412887))

(push 1)

(assert (not b!279836))

(assert (not b!279837))

(assert (not start!62430))

(assert (not b!279838))

(assert (not b!279833))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

