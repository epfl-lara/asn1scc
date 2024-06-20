; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29306 () Bool)

(assert start!29306)

(declare-fun b!151860 () Bool)

(declare-fun res!127343 () Bool)

(declare-fun e!101472 () Bool)

(assert (=> b!151860 (=> (not res!127343) (not e!101472))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!151860 (= res!127343 (bvsge from!447 to!404))))

(declare-fun b!151862 () Bool)

(declare-fun e!101470 () Bool)

(declare-datatypes ((array!6765 0))(
  ( (array!6766 (arr!3877 (Array (_ BitVec 32) (_ BitVec 8))) (size!3060 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5378 0))(
  ( (BitStream!5379 (buf!3557 array!6765) (currentByte!6489 (_ BitVec 32)) (currentBit!6484 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5378)

(declare-fun array_inv!2849 (array!6765) Bool)

(assert (=> b!151862 (= e!101470 (array_inv!2849 (buf!3557 thiss!1634)))))

(declare-fun res!127344 () Bool)

(assert (=> start!29306 (=> (not res!127344) (not e!101472))))

(declare-fun arr!237 () array!6765)

(assert (=> start!29306 (= res!127344 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3060 arr!237))))))

(assert (=> start!29306 e!101472))

(assert (=> start!29306 true))

(assert (=> start!29306 (array_inv!2849 arr!237)))

(declare-fun inv!12 (BitStream!5378) Bool)

(assert (=> start!29306 (and (inv!12 thiss!1634) e!101470)))

(declare-fun lt!237916 () (_ BitVec 64))

(declare-fun b!151861 () Bool)

(declare-fun lt!237917 () (_ BitVec 64))

(declare-fun lt!237918 () (_ BitVec 64))

(assert (=> b!151861 (= e!101472 (not (or (not (= lt!237916 (bvand lt!237917 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!237916 (bvand (bvadd lt!237918 lt!237917) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!151861 (= lt!237916 (bvand lt!237918 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!151861 (= lt!237917 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!404 from!447))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!151861 (= lt!237918 (bitIndex!0 (size!3060 (buf!3557 thiss!1634)) (currentByte!6489 thiss!1634) (currentBit!6484 thiss!1634)))))

(declare-fun isPrefixOf!0 (BitStream!5378 BitStream!5378) Bool)

(assert (=> b!151861 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!9632 0))(
  ( (Unit!9633) )
))
(declare-fun lt!237919 () Unit!9632)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5378) Unit!9632)

(assert (=> b!151861 (= lt!237919 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!151859 () Bool)

(declare-fun res!127342 () Bool)

(assert (=> b!151859 (=> (not res!127342) (not e!101472))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!151859 (= res!127342 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3060 (buf!3557 thiss!1634))) ((_ sign_extend 32) (currentByte!6489 thiss!1634)) ((_ sign_extend 32) (currentBit!6484 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!29306 res!127344) b!151859))

(assert (= (and b!151859 res!127342) b!151860))

(assert (= (and b!151860 res!127343) b!151861))

(assert (= start!29306 b!151862))

(declare-fun m!237569 () Bool)

(assert (=> b!151862 m!237569))

(declare-fun m!237571 () Bool)

(assert (=> start!29306 m!237571))

(declare-fun m!237573 () Bool)

(assert (=> start!29306 m!237573))

(declare-fun m!237575 () Bool)

(assert (=> b!151861 m!237575))

(declare-fun m!237577 () Bool)

(assert (=> b!151861 m!237577))

(declare-fun m!237579 () Bool)

(assert (=> b!151861 m!237579))

(declare-fun m!237581 () Bool)

(assert (=> b!151859 m!237581))

(push 1)

(assert (not b!151862))

(assert (not b!151861))

(assert (not start!29306))

(assert (not b!151859))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

