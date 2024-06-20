; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55120 () Bool)

(assert start!55120)

(declare-fun res!215512 () Bool)

(declare-fun e!178276 () Bool)

(assert (=> start!55120 (=> (not res!215512) (not e!178276))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!55120 (= res!215512 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55120 e!178276))

(assert (=> start!55120 true))

(declare-datatypes ((array!13956 0))(
  ( (array!13957 (arr!7105 (Array (_ BitVec 32) (_ BitVec 8))) (size!6118 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11158 0))(
  ( (BitStream!11159 (buf!6640 array!13956) (currentByte!12185 (_ BitVec 32)) (currentBit!12180 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11158)

(declare-fun e!178274 () Bool)

(declare-fun inv!12 (BitStream!11158) Bool)

(assert (=> start!55120 (and (inv!12 thiss!1754) e!178274)))

(declare-fun b!257139 () Bool)

(declare-fun res!215513 () Bool)

(assert (=> b!257139 (=> (not res!215513) (not e!178276))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257139 (= res!215513 (validate_offset_bits!1 ((_ sign_extend 32) (size!6118 (buf!6640 thiss!1754))) ((_ sign_extend 32) (currentByte!12185 thiss!1754)) ((_ sign_extend 32) (currentBit!12180 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!257140 () Bool)

(declare-fun e!178273 () Bool)

(assert (=> b!257140 (= e!178276 e!178273)))

(declare-fun res!215514 () Bool)

(assert (=> b!257140 (=> (not res!215514) (not e!178273))))

(declare-datatypes ((tuple2!21986 0))(
  ( (tuple2!21987 (_1!11929 Bool) (_2!11929 BitStream!11158)) )
))
(declare-fun lt!398546 () tuple2!21986)

(declare-fun expected!109 () Bool)

(assert (=> b!257140 (= res!215514 (not (= (_1!11929 lt!398546) expected!109)))))

(declare-fun readBit!0 (BitStream!11158) tuple2!21986)

(assert (=> b!257140 (= lt!398546 (readBit!0 thiss!1754))))

(declare-fun b!257141 () Bool)

(assert (=> b!257141 (= e!178273 false)))

(declare-fun lt!398545 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!257141 (= lt!398545 (bitIndex!0 (size!6118 (buf!6640 (_2!11929 lt!398546))) (currentByte!12185 (_2!11929 lt!398546)) (currentBit!12180 (_2!11929 lt!398546))))))

(declare-fun lt!398544 () (_ BitVec 64))

(assert (=> b!257141 (= lt!398544 (bitIndex!0 (size!6118 (buf!6640 thiss!1754)) (currentByte!12185 thiss!1754) (currentBit!12180 thiss!1754)))))

(declare-fun b!257142 () Bool)

(declare-fun array_inv!5859 (array!13956) Bool)

(assert (=> b!257142 (= e!178274 (array_inv!5859 (buf!6640 thiss!1754)))))

(declare-fun b!257143 () Bool)

(declare-fun res!215515 () Bool)

(assert (=> b!257143 (=> (not res!215515) (not e!178276))))

(assert (=> b!257143 (= res!215515 (not (= from!526 nBits!535)))))

(assert (= (and start!55120 res!215512) b!257139))

(assert (= (and b!257139 res!215513) b!257143))

(assert (= (and b!257143 res!215515) b!257140))

(assert (= (and b!257140 res!215514) b!257141))

(assert (= start!55120 b!257142))

(declare-fun m!386705 () Bool)

(assert (=> b!257140 m!386705))

(declare-fun m!386707 () Bool)

(assert (=> b!257141 m!386707))

(declare-fun m!386709 () Bool)

(assert (=> b!257141 m!386709))

(declare-fun m!386711 () Bool)

(assert (=> b!257142 m!386711))

(declare-fun m!386713 () Bool)

(assert (=> b!257139 m!386713))

(declare-fun m!386715 () Bool)

(assert (=> start!55120 m!386715))

(push 1)

(assert (not start!55120))

(assert (not b!257141))

(assert (not b!257140))

(assert (not b!257139))

(assert (not b!257142))

(check-sat)

(pop 1)

