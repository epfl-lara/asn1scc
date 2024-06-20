; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55166 () Bool)

(assert start!55166)

(declare-fun b!257484 () Bool)

(declare-fun e!178549 () Bool)

(assert (=> b!257484 (= e!178549 (not true))))

(declare-datatypes ((array!14002 0))(
  ( (array!14003 (arr!7128 (Array (_ BitVec 32) (_ BitVec 8))) (size!6141 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11204 0))(
  ( (BitStream!11205 (buf!6663 array!14002) (currentByte!12208 (_ BitVec 32)) (currentBit!12203 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22032 0))(
  ( (tuple2!22033 (_1!11952 Bool) (_2!11952 BitStream!11204)) )
))
(declare-fun lt!398743 () tuple2!22032)

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257484 (validate_offset_bits!1 ((_ sign_extend 32) (size!6141 (buf!6663 (_2!11952 lt!398743)))) ((_ sign_extend 32) (currentByte!12208 (_2!11952 lt!398743))) ((_ sign_extend 32) (currentBit!12203 (_2!11952 lt!398743))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun thiss!1754 () BitStream!11204)

(declare-datatypes ((Unit!18385 0))(
  ( (Unit!18386) )
))
(declare-fun lt!398744 () Unit!18385)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11204 BitStream!11204 (_ BitVec 64) (_ BitVec 64)) Unit!18385)

(assert (=> b!257484 (= lt!398744 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11952 lt!398743) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!257485 () Bool)

(declare-fun res!215788 () Bool)

(declare-fun e!178551 () Bool)

(assert (=> b!257485 (=> (not res!215788) (not e!178551))))

(assert (=> b!257485 (= res!215788 (validate_offset_bits!1 ((_ sign_extend 32) (size!6141 (buf!6663 thiss!1754))) ((_ sign_extend 32) (currentByte!12208 thiss!1754)) ((_ sign_extend 32) (currentBit!12203 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!257486 () Bool)

(declare-fun res!215789 () Bool)

(assert (=> b!257486 (=> (not res!215789) (not e!178551))))

(assert (=> b!257486 (= res!215789 (not (= from!526 nBits!535)))))

(declare-fun res!215790 () Bool)

(assert (=> start!55166 (=> (not res!215790) (not e!178551))))

(assert (=> start!55166 (= res!215790 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55166 e!178551))

(assert (=> start!55166 true))

(declare-fun e!178550 () Bool)

(declare-fun inv!12 (BitStream!11204) Bool)

(assert (=> start!55166 (and (inv!12 thiss!1754) e!178550)))

(declare-fun b!257487 () Bool)

(declare-fun array_inv!5882 (array!14002) Bool)

(assert (=> b!257487 (= e!178550 (array_inv!5882 (buf!6663 thiss!1754)))))

(declare-fun b!257488 () Bool)

(assert (=> b!257488 (= e!178551 e!178549)))

(declare-fun res!215791 () Bool)

(assert (=> b!257488 (=> (not res!215791) (not e!178549))))

(declare-fun expected!109 () Bool)

(assert (=> b!257488 (= res!215791 (= (_1!11952 lt!398743) expected!109))))

(declare-fun readBit!0 (BitStream!11204) tuple2!22032)

(assert (=> b!257488 (= lt!398743 (readBit!0 thiss!1754))))

(assert (= (and start!55166 res!215790) b!257485))

(assert (= (and b!257485 res!215788) b!257486))

(assert (= (and b!257486 res!215789) b!257488))

(assert (= (and b!257488 res!215791) b!257484))

(assert (= start!55166 b!257487))

(declare-fun m!386981 () Bool)

(assert (=> b!257487 m!386981))

(declare-fun m!386983 () Bool)

(assert (=> b!257484 m!386983))

(declare-fun m!386985 () Bool)

(assert (=> b!257484 m!386985))

(declare-fun m!386987 () Bool)

(assert (=> b!257488 m!386987))

(declare-fun m!386989 () Bool)

(assert (=> start!55166 m!386989))

(declare-fun m!386991 () Bool)

(assert (=> b!257485 m!386991))

(push 1)

(assert (not b!257487))

(assert (not b!257484))

(assert (not 