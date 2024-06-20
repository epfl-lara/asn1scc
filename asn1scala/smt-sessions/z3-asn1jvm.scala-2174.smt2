; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55146 () Bool)

(assert start!55146)

(declare-fun b!257334 () Bool)

(declare-fun res!215671 () Bool)

(declare-fun e!178431 () Bool)

(assert (=> b!257334 (=> (not res!215671) (not e!178431))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!257334 (= res!215671 (not (= from!526 nBits!535)))))

(declare-fun res!215670 () Bool)

(assert (=> start!55146 (=> (not res!215670) (not e!178431))))

(assert (=> start!55146 (= res!215670 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55146 e!178431))

(assert (=> start!55146 true))

(declare-datatypes ((array!13982 0))(
  ( (array!13983 (arr!7118 (Array (_ BitVec 32) (_ BitVec 8))) (size!6131 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11184 0))(
  ( (BitStream!11185 (buf!6653 array!13982) (currentByte!12198 (_ BitVec 32)) (currentBit!12193 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11184)

(declare-fun e!178429 () Bool)

(declare-fun inv!12 (BitStream!11184) Bool)

(assert (=> start!55146 (and (inv!12 thiss!1754) e!178429)))

(declare-fun b!257335 () Bool)

(declare-fun array_inv!5872 (array!13982) Bool)

(assert (=> b!257335 (= e!178429 (array_inv!5872 (buf!6653 thiss!1754)))))

(declare-fun b!257336 () Bool)

(declare-fun e!178432 () Bool)

(assert (=> b!257336 (= e!178431 e!178432)))

(declare-fun res!215669 () Bool)

(assert (=> b!257336 (=> (not res!215669) (not e!178432))))

(declare-fun expected!109 () Bool)

(declare-datatypes ((tuple2!22012 0))(
  ( (tuple2!22013 (_1!11942 Bool) (_2!11942 BitStream!11184)) )
))
(declare-fun lt!398661 () tuple2!22012)

(assert (=> b!257336 (= res!215669 (and (= (_1!11942 lt!398661) expected!109) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)) (= (size!6131 (buf!6653 thiss!1754)) (size!6131 (buf!6653 (_2!11942 lt!398661))))))))

(declare-fun readBit!0 (BitStream!11184) tuple2!22012)

(assert (=> b!257336 (= lt!398661 (readBit!0 thiss!1754))))

(declare-fun b!257337 () Bool)

(assert (=> b!257337 (= e!178432 false)))

(declare-fun lt!398662 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!257337 (= lt!398662 (bitIndex!0 (size!6131 (buf!6653 (_2!11942 lt!398661))) (currentByte!12198 (_2!11942 lt!398661)) (currentBit!12193 (_2!11942 lt!398661))))))

(declare-fun lt!398663 () (_ BitVec 64))

(assert (=> b!257337 (= lt!398663 (bitIndex!0 (size!6131 (buf!6653 thiss!1754)) (currentByte!12198 thiss!1754) (currentBit!12193 thiss!1754)))))

(declare-fun b!257338 () Bool)

(declare-fun res!215668 () Bool)

(assert (=> b!257338 (=> (not res!215668) (not e!178431))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257338 (= res!215668 (validate_offset_bits!1 ((_ sign_extend 32) (size!6131 (buf!6653 thiss!1754))) ((_ sign_extend 32) (currentByte!12198 thiss!1754)) ((_ sign_extend 32) (currentBit!12193 thiss!1754)) (bvsub nBits!535 from!526)))))

(assert (= (and start!55146 res!215670) b!257338))

(assert (= (and b!257338 res!215668) b!257334))

(assert (= (and b!257334 res!215671) b!257336))

(assert (= (and b!257336 res!215669) b!257337))

(assert (= start!55146 b!257335))

(declare-fun m!386861 () Bool)

(assert (=> b!257338 m!386861))

(declare-fun m!386863 () Bool)

(assert (=> b!257337 m!386863))

(declare-fun m!386865 () Bool)

(assert (=> b!257337 m!386865))

(declare-fun m!386867 () Bool)

(assert (=> b!257335 m!386867))

(declare-fun m!386869 () Bool)

(assert (=> b!257336 m!386869))

(declare-fun m!386871 () Bool)

(assert (=> start!55146 m!386871))

(check-sat (not start!55146) (not b!257336) (not b!257337) (not b!257338) (not b!257335))
