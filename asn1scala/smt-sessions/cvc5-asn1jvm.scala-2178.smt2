; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55168 () Bool)

(assert start!55168)

(declare-fun b!257499 () Bool)

(declare-fun e!178564 () Bool)

(declare-fun e!178561 () Bool)

(assert (=> b!257499 (= e!178564 e!178561)))

(declare-fun res!215803 () Bool)

(assert (=> b!257499 (=> (not res!215803) (not e!178561))))

(declare-datatypes ((array!14004 0))(
  ( (array!14005 (arr!7129 (Array (_ BitVec 32) (_ BitVec 8))) (size!6142 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11206 0))(
  ( (BitStream!11207 (buf!6664 array!14004) (currentByte!12209 (_ BitVec 32)) (currentBit!12204 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22034 0))(
  ( (tuple2!22035 (_1!11953 Bool) (_2!11953 BitStream!11206)) )
))
(declare-fun lt!398750 () tuple2!22034)

(declare-fun expected!109 () Bool)

(assert (=> b!257499 (= res!215803 (= (_1!11953 lt!398750) expected!109))))

(declare-fun thiss!1754 () BitStream!11206)

(declare-fun readBit!0 (BitStream!11206) tuple2!22034)

(assert (=> b!257499 (= lt!398750 (readBit!0 thiss!1754))))

(declare-fun b!257500 () Bool)

(declare-fun res!215801 () Bool)

(assert (=> b!257500 (=> (not res!215801) (not e!178564))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!257500 (= res!215801 (not (= from!526 nBits!535)))))

(declare-fun b!257501 () Bool)

(declare-fun res!215802 () Bool)

(assert (=> b!257501 (=> (not res!215802) (not e!178564))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257501 (= res!215802 (validate_offset_bits!1 ((_ sign_extend 32) (size!6142 (buf!6664 thiss!1754))) ((_ sign_extend 32) (currentByte!12209 thiss!1754)) ((_ sign_extend 32) (currentBit!12204 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun res!215800 () Bool)

(assert (=> start!55168 (=> (not res!215800) (not e!178564))))

(assert (=> start!55168 (= res!215800 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55168 e!178564))

(assert (=> start!55168 true))

(declare-fun e!178563 () Bool)

(declare-fun inv!12 (BitStream!11206) Bool)

(assert (=> start!55168 (and (inv!12 thiss!1754) e!178563)))

(declare-fun b!257502 () Bool)

(declare-fun array_inv!5883 (array!14004) Bool)

(assert (=> b!257502 (= e!178563 (array_inv!5883 (buf!6664 thiss!1754)))))

(declare-fun b!257503 () Bool)

(assert (=> b!257503 (= e!178561 (not (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))))

(assert (=> b!257503 (validate_offset_bits!1 ((_ sign_extend 32) (size!6142 (buf!6664 (_2!11953 lt!398750)))) ((_ sign_extend 32) (currentByte!12209 (_2!11953 lt!398750))) ((_ sign_extend 32) (currentBit!12204 (_2!11953 lt!398750))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18387 0))(
  ( (Unit!18388) )
))
(declare-fun lt!398749 () Unit!18387)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11206 BitStream!11206 (_ BitVec 64) (_ BitVec 64)) Unit!18387)

(assert (=> b!257503 (= lt!398749 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11953 lt!398750) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and start!55168 res!215800) b!257501))

(assert (= (and b!257501 res!215802) b!257500))

(assert (= (and b!257500 res!215801) b!257499))

(assert (= (and b!257499 res!215803) b!257503))

(assert (= start!55168 b!257502))

(declare-fun m!386993 () Bool)

(assert (=> b!257501 m!386993))

(declare-fun m!386995 () Bool)

(assert (=> start!55168 m!386995))

(declare-fun m!386997 () Bool)

(assert (=> b!257499 m!386997))

(declare-fun m!386999 () Bool)

(assert (=> b!257503 m!386999))

(declare-fun m!387001 () Bool)

(assert (=> b!257503 m!387001))

(declare-fun m!387003 () Bool)

(assert (=> b!257502 m!387003))

(push 1)

(assert (not b!257499))

(assert (not b!257503))

(assert (not start!55168))

(assert (not b!257502))

(assert (not b!257501))

(check-sat)

(pop 1)

(push 1)

(check-sat)

