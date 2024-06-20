; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55158 () Bool)

(assert start!55158)

(declare-fun b!257424 () Bool)

(declare-fun res!215740 () Bool)

(declare-fun e!178503 () Bool)

(assert (=> b!257424 (=> (not res!215740) (not e!178503))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!257424 (= res!215740 (not (= from!526 nBits!535)))))

(declare-fun res!215742 () Bool)

(assert (=> start!55158 (=> (not res!215742) (not e!178503))))

(assert (=> start!55158 (= res!215742 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55158 e!178503))

(assert (=> start!55158 true))

(declare-datatypes ((array!13994 0))(
  ( (array!13995 (arr!7124 (Array (_ BitVec 32) (_ BitVec 8))) (size!6137 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11196 0))(
  ( (BitStream!11197 (buf!6659 array!13994) (currentByte!12204 (_ BitVec 32)) (currentBit!12199 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11196)

(declare-fun e!178502 () Bool)

(declare-fun inv!12 (BitStream!11196) Bool)

(assert (=> start!55158 (and (inv!12 thiss!1754) e!178502)))

(declare-fun b!257425 () Bool)

(declare-fun res!215741 () Bool)

(assert (=> b!257425 (=> (not res!215741) (not e!178503))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257425 (= res!215741 (validate_offset_bits!1 ((_ sign_extend 32) (size!6137 (buf!6659 thiss!1754))) ((_ sign_extend 32) (currentByte!12204 thiss!1754)) ((_ sign_extend 32) (currentBit!12199 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!257426 () Bool)

(declare-fun e!178504 () Bool)

(assert (=> b!257426 (= e!178503 e!178504)))

(declare-fun res!215743 () Bool)

(assert (=> b!257426 (=> (not res!215743) (not e!178504))))

(declare-fun expected!109 () Bool)

(declare-datatypes ((tuple2!22024 0))(
  ( (tuple2!22025 (_1!11948 Bool) (_2!11948 BitStream!11196)) )
))
(declare-fun lt!398717 () tuple2!22024)

(assert (=> b!257426 (= res!215743 (and (= (_1!11948 lt!398717) expected!109) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)) (= (size!6137 (buf!6659 thiss!1754)) (size!6137 (buf!6659 (_2!11948 lt!398717))))))))

(declare-fun readBit!0 (BitStream!11196) tuple2!22024)

(assert (=> b!257426 (= lt!398717 (readBit!0 thiss!1754))))

(declare-fun b!257427 () Bool)

(declare-fun array_inv!5878 (array!13994) Bool)

(assert (=> b!257427 (= e!178502 (array_inv!5878 (buf!6659 thiss!1754)))))

(declare-fun b!257428 () Bool)

(assert (=> b!257428 (= e!178504 false)))

(declare-fun lt!398715 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!257428 (= lt!398715 (bitIndex!0 (size!6137 (buf!6659 (_2!11948 lt!398717))) (currentByte!12204 (_2!11948 lt!398717)) (currentBit!12199 (_2!11948 lt!398717))))))

(declare-fun lt!398716 () (_ BitVec 64))

(assert (=> b!257428 (= lt!398716 (bitIndex!0 (size!6137 (buf!6659 thiss!1754)) (currentByte!12204 thiss!1754) (currentBit!12199 thiss!1754)))))

(assert (= (and start!55158 res!215742) b!257425))

(assert (= (and b!257425 res!215741) b!257424))

(assert (= (and b!257424 res!215740) b!257426))

(assert (= (and b!257426 res!215743) b!257428))

(assert (= start!55158 b!257427))

(declare-fun m!386933 () Bool)

(assert (=> start!55158 m!386933))

(declare-fun m!386935 () Bool)

(assert (=> b!257428 m!386935))

(declare-fun m!386937 () Bool)

(assert (=> b!257428 m!386937))

(declare-fun m!386939 () Bool)

(assert (=> b!257426 m!386939))

(declare-fun m!386941 () Bool)

(assert (=> b!257425 m!386941))

(declare-fun m!386943 () Bool)

(assert (=> b!257427 m!386943))

(check-sat (not b!257426) (not b!257425) (not b!257427) (not start!55158) (not b!257428))
