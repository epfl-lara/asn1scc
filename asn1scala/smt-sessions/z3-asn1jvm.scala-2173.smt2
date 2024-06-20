; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55140 () Bool)

(assert start!55140)

(declare-fun b!257289 () Bool)

(declare-fun res!215634 () Bool)

(declare-fun e!178393 () Bool)

(assert (=> b!257289 (=> (not res!215634) (not e!178393))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-datatypes ((array!13976 0))(
  ( (array!13977 (arr!7115 (Array (_ BitVec 32) (_ BitVec 8))) (size!6128 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11178 0))(
  ( (BitStream!11179 (buf!6650 array!13976) (currentByte!12195 (_ BitVec 32)) (currentBit!12190 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11178)

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257289 (= res!215634 (validate_offset_bits!1 ((_ sign_extend 32) (size!6128 (buf!6650 thiss!1754))) ((_ sign_extend 32) (currentByte!12195 thiss!1754)) ((_ sign_extend 32) (currentBit!12190 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!257290 () Bool)

(declare-fun e!178395 () Bool)

(declare-fun array_inv!5869 (array!13976) Bool)

(assert (=> b!257290 (= e!178395 (array_inv!5869 (buf!6650 thiss!1754)))))

(declare-fun res!215635 () Bool)

(assert (=> start!55140 (=> (not res!215635) (not e!178393))))

(assert (=> start!55140 (= res!215635 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55140 e!178393))

(assert (=> start!55140 true))

(declare-fun inv!12 (BitStream!11178) Bool)

(assert (=> start!55140 (and (inv!12 thiss!1754) e!178395)))

(declare-fun b!257291 () Bool)

(declare-fun e!178396 () Bool)

(assert (=> b!257291 (= e!178396 false)))

(declare-fun lt!398635 () (_ BitVec 64))

(declare-datatypes ((tuple2!22006 0))(
  ( (tuple2!22007 (_1!11939 Bool) (_2!11939 BitStream!11178)) )
))
(declare-fun lt!398634 () tuple2!22006)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!257291 (= lt!398635 (bitIndex!0 (size!6128 (buf!6650 (_2!11939 lt!398634))) (currentByte!12195 (_2!11939 lt!398634)) (currentBit!12190 (_2!11939 lt!398634))))))

(declare-fun lt!398636 () (_ BitVec 64))

(assert (=> b!257291 (= lt!398636 (bitIndex!0 (size!6128 (buf!6650 thiss!1754)) (currentByte!12195 thiss!1754) (currentBit!12190 thiss!1754)))))

(declare-fun b!257292 () Bool)

(assert (=> b!257292 (= e!178393 e!178396)))

(declare-fun res!215633 () Bool)

(assert (=> b!257292 (=> (not res!215633) (not e!178396))))

(declare-fun expected!109 () Bool)

(assert (=> b!257292 (= res!215633 (and (= (_1!11939 lt!398634) expected!109) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)) (= (size!6128 (buf!6650 thiss!1754)) (size!6128 (buf!6650 (_2!11939 lt!398634))))))))

(declare-fun readBit!0 (BitStream!11178) tuple2!22006)

(assert (=> b!257292 (= lt!398634 (readBit!0 thiss!1754))))

(declare-fun b!257293 () Bool)

(declare-fun res!215632 () Bool)

(assert (=> b!257293 (=> (not res!215632) (not e!178393))))

(assert (=> b!257293 (= res!215632 (not (= from!526 nBits!535)))))

(assert (= (and start!55140 res!215635) b!257289))

(assert (= (and b!257289 res!215634) b!257293))

(assert (= (and b!257293 res!215632) b!257292))

(assert (= (and b!257292 res!215633) b!257291))

(assert (= start!55140 b!257290))

(declare-fun m!386825 () Bool)

(assert (=> b!257291 m!386825))

(declare-fun m!386827 () Bool)

(assert (=> b!257291 m!386827))

(declare-fun m!386829 () Bool)

(assert (=> start!55140 m!386829))

(declare-fun m!386831 () Bool)

(assert (=> b!257289 m!386831))

(declare-fun m!386833 () Bool)

(assert (=> b!257292 m!386833))

(declare-fun m!386835 () Bool)

(assert (=> b!257290 m!386835))

(check-sat (not b!257292) (not start!55140) (not b!257290) (not b!257291) (not b!257289))
