; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29318 () Bool)

(assert start!29318)

(declare-fun b!151948 () Bool)

(declare-fun res!127416 () Bool)

(declare-fun e!101562 () Bool)

(assert (=> b!151948 (=> (not res!127416) (not e!101562))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6777 0))(
  ( (array!6778 (arr!3883 (Array (_ BitVec 32) (_ BitVec 8))) (size!3066 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5390 0))(
  ( (BitStream!5391 (buf!3563 array!6777) (currentByte!6495 (_ BitVec 32)) (currentBit!6490 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5390)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!151948 (= res!127416 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3066 (buf!3563 thiss!1634))) ((_ sign_extend 32) (currentByte!6495 thiss!1634)) ((_ sign_extend 32) (currentBit!6490 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!151949 () Bool)

(declare-fun e!101561 () Bool)

(assert (=> b!151949 (= e!101562 (not e!101561))))

(declare-fun res!127415 () Bool)

(assert (=> b!151949 (=> res!127415 e!101561)))

(declare-fun lt!237971 () (_ BitVec 64))

(assert (=> b!151949 (= res!127415 (not (= lt!237971 (bvadd lt!237971 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!404 from!447)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!151949 (= lt!237971 (bitIndex!0 (size!3066 (buf!3563 thiss!1634)) (currentByte!6495 thiss!1634) (currentBit!6490 thiss!1634)))))

(declare-fun isPrefixOf!0 (BitStream!5390 BitStream!5390) Bool)

(assert (=> b!151949 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!9644 0))(
  ( (Unit!9645) )
))
(declare-fun lt!237973 () Unit!9644)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5390) Unit!9644)

(assert (=> b!151949 (= lt!237973 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun res!127414 () Bool)

(assert (=> start!29318 (=> (not res!127414) (not e!101562))))

(declare-fun arr!237 () array!6777)

(assert (=> start!29318 (= res!127414 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3066 arr!237))))))

(assert (=> start!29318 e!101562))

(assert (=> start!29318 true))

(declare-fun array_inv!2855 (array!6777) Bool)

(assert (=> start!29318 (array_inv!2855 arr!237)))

(declare-fun e!101559 () Bool)

(declare-fun inv!12 (BitStream!5390) Bool)

(assert (=> start!29318 (and (inv!12 thiss!1634) e!101559)))

(declare-fun b!151950 () Bool)

(assert (=> b!151950 (= e!101559 (array_inv!2855 (buf!3563 thiss!1634)))))

(declare-fun b!151951 () Bool)

(declare-fun res!127413 () Bool)

(assert (=> b!151951 (=> (not res!127413) (not e!101562))))

(assert (=> b!151951 (= res!127413 (bvsge from!447 to!404))))

(declare-fun b!151952 () Bool)

(assert (=> b!151952 (= e!101561 true)))

(declare-datatypes ((tuple2!13526 0))(
  ( (tuple2!13527 (_1!7138 BitStream!5390) (_2!7138 BitStream!5390)) )
))
(declare-fun lt!237972 () tuple2!13526)

(declare-fun reader!0 (BitStream!5390 BitStream!5390) tuple2!13526)

(assert (=> b!151952 (= lt!237972 (reader!0 thiss!1634 thiss!1634))))

(assert (= (and start!29318 res!127414) b!151948))

(assert (= (and b!151948 res!127416) b!151951))

(assert (= (and b!151951 res!127413) b!151949))

(assert (= (and b!151949 (not res!127415)) b!151952))

(assert (= start!29318 b!151950))

(declare-fun m!237663 () Bool)

(assert (=> b!151952 m!237663))

(declare-fun m!237665 () Bool)

(assert (=> b!151950 m!237665))

(declare-fun m!237667 () Bool)

(assert (=> start!29318 m!237667))

(declare-fun m!237669 () Bool)

(assert (=> start!29318 m!237669))

(declare-fun m!237671 () Bool)

(assert (=> b!151949 m!237671))

(declare-fun m!237673 () Bool)

(assert (=> b!151949 m!237673))

(declare-fun m!237675 () Bool)

(assert (=> b!151949 m!237675))

(declare-fun m!237677 () Bool)

(assert (=> b!151948 m!237677))

(push 1)

(assert (not start!29318))

(assert (not b!151948))

(assert (not b!151952))

(assert (not b!151949))

(assert (not b!151950))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

