; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29292 () Bool)

(assert start!29292)

(declare-fun b!151776 () Bool)

(declare-fun res!127279 () Bool)

(declare-fun e!101386 () Bool)

(assert (=> b!151776 (=> (not res!127279) (not e!101386))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!151776 (= res!127279 (bvsge from!447 to!404))))

(declare-fun b!151777 () Bool)

(assert (=> b!151777 (= e!101386 (not (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))))

(declare-fun lt!237850 () (_ BitVec 64))

(declare-datatypes ((array!6751 0))(
  ( (array!6752 (arr!3870 (Array (_ BitVec 32) (_ BitVec 8))) (size!3053 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5364 0))(
  ( (BitStream!5365 (buf!3550 array!6751) (currentByte!6482 (_ BitVec 32)) (currentBit!6477 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5364)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!151777 (= lt!237850 (bitIndex!0 (size!3053 (buf!3550 thiss!1634)) (currentByte!6482 thiss!1634) (currentBit!6477 thiss!1634)))))

(declare-fun isPrefixOf!0 (BitStream!5364 BitStream!5364) Bool)

(assert (=> b!151777 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!9618 0))(
  ( (Unit!9619) )
))
(declare-fun lt!237849 () Unit!9618)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5364) Unit!9618)

(assert (=> b!151777 (= lt!237849 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!151778 () Bool)

(declare-fun e!101387 () Bool)

(declare-fun array_inv!2842 (array!6751) Bool)

(assert (=> b!151778 (= e!101387 (array_inv!2842 (buf!3550 thiss!1634)))))

(declare-fun res!127280 () Bool)

(assert (=> start!29292 (=> (not res!127280) (not e!101386))))

(declare-fun arr!237 () array!6751)

(assert (=> start!29292 (= res!127280 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3053 arr!237))))))

(assert (=> start!29292 e!101386))

(assert (=> start!29292 true))

(assert (=> start!29292 (array_inv!2842 arr!237)))

(declare-fun inv!12 (BitStream!5364) Bool)

(assert (=> start!29292 (and (inv!12 thiss!1634) e!101387)))

(declare-fun b!151775 () Bool)

(declare-fun res!127281 () Bool)

(assert (=> b!151775 (=> (not res!127281) (not e!101386))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!151775 (= res!127281 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3053 (buf!3550 thiss!1634))) ((_ sign_extend 32) (currentByte!6482 thiss!1634)) ((_ sign_extend 32) (currentBit!6477 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!29292 res!127280) b!151775))

(assert (= (and b!151775 res!127281) b!151776))

(assert (= (and b!151776 res!127279) b!151777))

(assert (= start!29292 b!151778))

(declare-fun m!237471 () Bool)

(assert (=> b!151777 m!237471))

(declare-fun m!237473 () Bool)

(assert (=> b!151777 m!237473))

(declare-fun m!237475 () Bool)

(assert (=> b!151777 m!237475))

(declare-fun m!237477 () Bool)

(assert (=> b!151778 m!237477))

(declare-fun m!237479 () Bool)

(assert (=> start!29292 m!237479))

(declare-fun m!237481 () Bool)

(assert (=> start!29292 m!237481))

(declare-fun m!237483 () Bool)

(assert (=> b!151775 m!237483))

(check-sat (not b!151775) (not start!29292) (not b!151777) (not b!151778))
(check-sat)
