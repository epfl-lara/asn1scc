; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55130 () Bool)

(assert start!55130)

(declare-fun res!215573 () Bool)

(declare-fun e!178334 () Bool)

(assert (=> start!55130 (=> (not res!215573) (not e!178334))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!55130 (= res!215573 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55130 e!178334))

(assert (=> start!55130 true))

(declare-datatypes ((array!13966 0))(
  ( (array!13967 (arr!7110 (Array (_ BitVec 32) (_ BitVec 8))) (size!6123 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11168 0))(
  ( (BitStream!11169 (buf!6645 array!13966) (currentByte!12190 (_ BitVec 32)) (currentBit!12185 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11168)

(declare-fun e!178335 () Bool)

(declare-fun inv!12 (BitStream!11168) Bool)

(assert (=> start!55130 (and (inv!12 thiss!1754) e!178335)))

(declare-fun b!257214 () Bool)

(declare-fun array_inv!5864 (array!13966) Bool)

(assert (=> b!257214 (= e!178335 (array_inv!5864 (buf!6645 thiss!1754)))))

(declare-fun b!257215 () Bool)

(declare-fun res!215574 () Bool)

(assert (=> b!257215 (=> (not res!215574) (not e!178334))))

(assert (=> b!257215 (= res!215574 (not (= from!526 nBits!535)))))

(declare-fun b!257216 () Bool)

(declare-fun e!178333 () Bool)

(assert (=> b!257216 (= e!178333 false)))

(declare-fun lt!398591 () (_ BitVec 64))

(declare-datatypes ((tuple2!21996 0))(
  ( (tuple2!21997 (_1!11934 Bool) (_2!11934 BitStream!11168)) )
))
(declare-fun lt!398590 () tuple2!21996)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!257216 (= lt!398591 (bitIndex!0 (size!6123 (buf!6645 (_2!11934 lt!398590))) (currentByte!12190 (_2!11934 lt!398590)) (currentBit!12185 (_2!11934 lt!398590))))))

(declare-fun lt!398589 () (_ BitVec 64))

(assert (=> b!257216 (= lt!398589 (bitIndex!0 (size!6123 (buf!6645 thiss!1754)) (currentByte!12190 thiss!1754) (currentBit!12185 thiss!1754)))))

(declare-fun b!257217 () Bool)

(declare-fun res!215575 () Bool)

(assert (=> b!257217 (=> (not res!215575) (not e!178334))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257217 (= res!215575 (validate_offset_bits!1 ((_ sign_extend 32) (size!6123 (buf!6645 thiss!1754))) ((_ sign_extend 32) (currentByte!12190 thiss!1754)) ((_ sign_extend 32) (currentBit!12185 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!257218 () Bool)

(assert (=> b!257218 (= e!178334 e!178333)))

(declare-fun res!215572 () Bool)

(assert (=> b!257218 (=> (not res!215572) (not e!178333))))

(declare-fun expected!109 () Bool)

(assert (=> b!257218 (= res!215572 (not (= (_1!11934 lt!398590) expected!109)))))

(declare-fun readBit!0 (BitStream!11168) tuple2!21996)

(assert (=> b!257218 (= lt!398590 (readBit!0 thiss!1754))))

(assert (= (and start!55130 res!215573) b!257217))

(assert (= (and b!257217 res!215575) b!257215))

(assert (= (and b!257215 res!215574) b!257218))

(assert (= (and b!257218 res!215572) b!257216))

(assert (= start!55130 b!257214))

(declare-fun m!386765 () Bool)

(assert (=> b!257217 m!386765))

(declare-fun m!386767 () Bool)

(assert (=> b!257216 m!386767))

(declare-fun m!386769 () Bool)

(assert (=> b!257216 m!386769))

(declare-fun m!386771 () Bool)

(assert (=> start!55130 m!386771))

(declare-fun m!386773 () Bool)

(assert (=> b!257214 m!386773))

(declare-fun m!386775 () Bool)

(assert (=> b!257218 m!386775))

(push 1)

(assert (not b!257218))

(assert (not start!55130))

(assert (not b!257217))

(assert (not b!257214))

(assert (not b!257216))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

