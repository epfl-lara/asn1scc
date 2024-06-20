; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62068 () Bool)

(assert start!62068)

(declare-fun b!278128 () Bool)

(declare-fun e!198011 () Bool)

(declare-fun e!198012 () Bool)

(assert (=> b!278128 (= e!198011 e!198012)))

(declare-fun res!230977 () Bool)

(assert (=> b!278128 (=> (not res!230977) (not e!198012))))

(declare-datatypes ((tuple4!616 0))(
  ( (tuple4!617 (_1!12383 (_ BitVec 32)) (_2!12383 (_ BitVec 32)) (_3!1088 (_ BitVec 32)) (_4!308 (_ BitVec 32))) )
))
(declare-fun lt!415793 () tuple4!616)

(assert (=> b!278128 (= res!230977 (= (_3!1088 lt!415793) (_4!308 lt!415793)))))

(declare-datatypes ((Unit!19451 0))(
  ( (Unit!19452) )
))
(declare-fun lt!415794 () Unit!19451)

(declare-fun e!198015 () Unit!19451)

(assert (=> b!278128 (= lt!415794 e!198015)))

(declare-fun c!12747 () Bool)

(assert (=> b!278128 (= c!12747 (bvslt (_1!12383 lt!415793) (_2!12383 lt!415793)))))

(declare-fun lt!415791 () (_ BitVec 32))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!278128 (= lt!415791 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!415790 () (_ BitVec 32))

(declare-fun from!822 () (_ BitVec 64))

(assert (=> b!278128 (= lt!415790 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!616)

(assert (=> b!278128 (= lt!415793 (arrayBitIndices!0 from!822 to!789))))

(declare-fun e!198010 () Bool)

(declare-datatypes ((array!15989 0))(
  ( (array!15990 (arr!7911 (Array (_ BitVec 32) (_ BitVec 8))) (size!6915 (_ BitVec 32))) )
))
(declare-fun a2!699 () array!15989)

(declare-fun b!278129 () Bool)

(declare-fun a1!699 () array!15989)

(assert (=> b!278129 (= e!198010 (or (bvsgt (size!6915 a2!699) (size!6915 a1!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6915 a2!699))))))))

(declare-fun b!278130 () Bool)

(declare-fun Unit!19453 () Unit!19451)

(assert (=> b!278130 (= e!198015 Unit!19453)))

(declare-fun res!230980 () Bool)

(assert (=> start!62068 (=> (not res!230980) (not e!198011))))

(assert (=> start!62068 (= res!230980 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6915 a1!699) (size!6915 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6915 a1!699))))))))

(assert (=> start!62068 e!198011))

(assert (=> start!62068 true))

(declare-fun array_inv!6639 (array!15989) Bool)

(assert (=> start!62068 (array_inv!6639 a1!699)))

(assert (=> start!62068 (array_inv!6639 a2!699)))

(declare-fun b!278131 () Bool)

(declare-fun res!230981 () Bool)

(assert (=> b!278131 (=> (not res!230981) (not e!198011))))

(assert (=> b!278131 (= res!230981 (bvslt from!822 to!789))))

(declare-fun b!278132 () Bool)

(declare-fun Unit!19454 () Unit!19451)

(assert (=> b!278132 (= e!198015 Unit!19454)))

(declare-fun arrayRangesEq!1201 (array!15989 array!15989 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278132 (arrayRangesEq!1201 a1!699 a2!699 (_1!12383 lt!415793) (_2!12383 lt!415793))))

(declare-fun lt!415792 () Unit!19451)

(declare-fun arrayRangesEqSymmetricLemma!120 (array!15989 array!15989 (_ BitVec 32) (_ BitVec 32)) Unit!19451)

(assert (=> b!278132 (= lt!415792 (arrayRangesEqSymmetricLemma!120 a1!699 a2!699 (_1!12383 lt!415793) (_2!12383 lt!415793)))))

(assert (=> b!278132 (arrayRangesEq!1201 a2!699 a1!699 (_1!12383 lt!415793) (_2!12383 lt!415793))))

(declare-fun b!278133 () Bool)

(assert (=> b!278133 (= e!198012 (not e!198010))))

(declare-fun res!230979 () Bool)

(assert (=> b!278133 (=> res!230979 e!198010)))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278133 (= res!230979 (not (byteRangesEq!0 (select (arr!7911 a2!699) (_3!1088 lt!415793)) (select (arr!7911 a1!699) (_3!1088 lt!415793)) lt!415790 lt!415791)))))

(assert (=> b!278133 (byteRangesEq!0 (select (arr!7911 a1!699) (_3!1088 lt!415793)) (select (arr!7911 a2!699) (_3!1088 lt!415793)) lt!415790 lt!415791)))

(declare-fun b!278134 () Bool)

(declare-fun res!230978 () Bool)

(assert (=> b!278134 (=> (not res!230978) (not e!198011))))

(declare-fun arrayBitRangesEq!0 (array!15989 array!15989 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278134 (= res!230978 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(assert (= (and start!62068 res!230980) b!278134))

(assert (= (and b!278134 res!230978) b!278131))

(assert (= (and b!278131 res!230981) b!278128))

(assert (= (and b!278128 c!12747) b!278132))

(assert (= (and b!278128 (not c!12747)) b!278130))

(assert (= (and b!278128 res!230977) b!278133))

(assert (= (and b!278133 (not res!230979)) b!278129))

(declare-fun m!411237 () Bool)

(assert (=> b!278128 m!411237))

(declare-fun m!411239 () Bool)

(assert (=> b!278133 m!411239))

(declare-fun m!411241 () Bool)

(assert (=> b!278133 m!411241))

(assert (=> b!278133 m!411239))

(assert (=> b!278133 m!411241))

(declare-fun m!411243 () Bool)

(assert (=> b!278133 m!411243))

(assert (=> b!278133 m!411241))

(assert (=> b!278133 m!411239))

(declare-fun m!411245 () Bool)

(assert (=> b!278133 m!411245))

(declare-fun m!411247 () Bool)

(assert (=> start!62068 m!411247))

(declare-fun m!411249 () Bool)

(assert (=> start!62068 m!411249))

(declare-fun m!411251 () Bool)

(assert (=> b!278134 m!411251))

(declare-fun m!411253 () Bool)

(assert (=> b!278132 m!411253))

(declare-fun m!411255 () Bool)

(assert (=> b!278132 m!411255))

(declare-fun m!411257 () Bool)

(assert (=> b!278132 m!411257))

(push 1)

(assert (not b!278133))

(assert (not b!278128))

(assert (not b!278132))

(assert (not start!62068))

(assert (not b!278134))

(check-sat)

(pop 1)

(push 1)

(check-sat)

