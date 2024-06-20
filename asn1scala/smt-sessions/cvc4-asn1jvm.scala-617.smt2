; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17510 () Bool)

(assert start!17510)

(declare-fun b!84440 () Bool)

(declare-fun e!56409 () Bool)

(assert (=> b!84440 (= e!56409 false)))

(declare-datatypes ((Unit!5659 0))(
  ( (Unit!5660) )
))
(declare-datatypes ((array!4000 0))(
  ( (array!4001 (arr!2447 (Array (_ BitVec 32) (_ BitVec 8))) (size!1810 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3182 0))(
  ( (BitStream!3183 (buf!2200 array!4000) (currentByte!4364 (_ BitVec 32)) (currentBit!4359 (_ BitVec 32))) )
))
(declare-datatypes ((tuple3!368 0))(
  ( (tuple3!369 (_1!3828 Unit!5659) (_2!3828 BitStream!3182) (_3!208 (_ BitVec 32))) )
))
(declare-fun lt!134259 () tuple3!368)

(declare-fun e!56408 () tuple3!368)

(assert (=> b!84440 (= lt!134259 e!56408)))

(declare-fun c!5813 () Bool)

(declare-fun nBits!333 () (_ BitVec 32))

(assert (=> b!84440 (= c!5813 (bvslt #b00000000000000000000000000000000 nBits!333))))

(declare-fun b!84441 () Bool)

(declare-fun thiss!1136 () BitStream!3182)

(declare-fun Unit!5661 () Unit!5659)

(assert (=> b!84441 (= e!56408 (tuple3!369 Unit!5661 thiss!1136 #b00000000000000000000000000000000))))

(declare-fun b!84442 () Bool)

(declare-fun e!56406 () Bool)

(declare-fun array_inv!1656 (array!4000) Bool)

(assert (=> b!84442 (= e!56406 (array_inv!1656 (buf!2200 thiss!1136)))))

(declare-fun res!69301 () Bool)

(assert (=> start!17510 (=> (not res!69301) (not e!56409))))

(assert (=> start!17510 (= res!69301 (and (bvsge nBits!333 #b00000000000000000000000000000000) (bvsle nBits!333 #b00000000000000000000000001000000)))))

(assert (=> start!17510 e!56409))

(assert (=> start!17510 true))

(declare-fun inv!12 (BitStream!3182) Bool)

(assert (=> start!17510 (and (inv!12 thiss!1136) e!56406)))

(declare-fun b!84443 () Bool)

(declare-fun res!69299 () Bool)

(assert (=> b!84443 (=> (not res!69299) (not e!56409))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!84443 (= res!69299 (validate_offset_bits!1 ((_ sign_extend 32) (size!1810 (buf!2200 thiss!1136))) ((_ sign_extend 32) (currentByte!4364 thiss!1136)) ((_ sign_extend 32) (currentBit!4359 thiss!1136)) ((_ sign_extend 32) nBits!333)))))

(declare-fun b!84444 () Bool)

(declare-fun res!69300 () Bool)

(assert (=> b!84444 (=> (not res!69300) (not e!56409))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!84444 (= res!69300 (invariant!0 (currentBit!4359 thiss!1136) (currentByte!4364 thiss!1136) (size!1810 (buf!2200 thiss!1136))))))

(declare-fun b!84445 () Bool)

(declare-fun v!176 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3182 (_ BitVec 64) BitStream!3182 (_ BitVec 32)) tuple3!368)

(assert (=> b!84445 (= e!56408 (appendBitsLSBFirstWhileWhile!0 nBits!333 thiss!1136 v!176 thiss!1136 #b00000000000000000000000000000000))))

(assert (= (and start!17510 res!69301) b!84443))

(assert (= (and b!84443 res!69299) b!84444))

(assert (= (and b!84444 res!69300) b!84440))

(assert (= (and b!84440 c!5813) b!84445))

(assert (= (and b!84440 (not c!5813)) b!84441))

(assert (= start!17510 b!84442))

(declare-fun m!131011 () Bool)

(assert (=> b!84443 m!131011))

(declare-fun m!131013 () Bool)

(assert (=> b!84444 m!131013))

(declare-fun m!131015 () Bool)

(assert (=> start!17510 m!131015))

(declare-fun m!131017 () Bool)

(assert (=> b!84442 m!131017))

(declare-fun m!131019 () Bool)

(assert (=> b!84445 m!131019))

(push 1)

(assert (not b!84443))

(assert (not b!84445))

(assert (not start!17510))

(assert (not b!84444))

