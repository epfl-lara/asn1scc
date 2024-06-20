; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39350 () Bool)

(assert start!39350)

(declare-fun res!146516 () Bool)

(declare-fun e!123221 () Bool)

(assert (=> start!39350 (=> (not res!146516) (not e!123221))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!39350 (= res!146516 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39350 e!123221))

(assert (=> start!39350 true))

(declare-datatypes ((array!9542 0))(
  ( (array!9543 (arr!5137 (Array (_ BitVec 32) (_ BitVec 8))) (size!4207 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7522 0))(
  ( (BitStream!7523 (buf!4650 array!9542) (currentByte!8821 (_ BitVec 32)) (currentBit!8816 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7522)

(declare-fun e!123226 () Bool)

(declare-fun inv!12 (BitStream!7522) Bool)

(assert (=> start!39350 (and (inv!12 thiss!1204) e!123226)))

(declare-fun b!176806 () Bool)

(declare-fun res!146513 () Bool)

(declare-fun e!123222 () Bool)

(assert (=> b!176806 (=> (not res!146513) (not e!123222))))

(declare-datatypes ((Unit!12728 0))(
  ( (Unit!12729) )
))
(declare-datatypes ((tuple2!15218 0))(
  ( (tuple2!15219 (_1!8254 Unit!12728) (_2!8254 BitStream!7522)) )
))
(declare-fun lt!272024 () tuple2!15218)

(declare-fun isPrefixOf!0 (BitStream!7522 BitStream!7522) Bool)

(assert (=> b!176806 (= res!146513 (isPrefixOf!0 thiss!1204 (_2!8254 lt!272024)))))

(declare-fun b!176807 () Bool)

(declare-fun res!146518 () Bool)

(assert (=> b!176807 (=> (not res!146518) (not e!123221))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!176807 (= res!146518 (validate_offset_bits!1 ((_ sign_extend 32) (size!4207 (buf!4650 thiss!1204))) ((_ sign_extend 32) (currentByte!8821 thiss!1204)) ((_ sign_extend 32) (currentBit!8816 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!176808 () Bool)

(declare-fun e!123223 () Bool)

(assert (=> b!176808 (= e!123222 e!123223)))

(declare-fun res!146514 () Bool)

(assert (=> b!176808 (=> (not res!146514) (not e!123223))))

(declare-datatypes ((tuple2!15220 0))(
  ( (tuple2!15221 (_1!8255 BitStream!7522) (_2!8255 Bool)) )
))
(declare-fun lt!272023 () tuple2!15220)

(declare-fun lt!272020 () Bool)

(assert (=> b!176808 (= res!146514 (and (= (_2!8255 lt!272023) lt!272020) (= (_1!8255 lt!272023) (_2!8254 lt!272024))))))

(declare-fun readBitPure!0 (BitStream!7522) tuple2!15220)

(declare-fun readerFrom!0 (BitStream!7522 (_ BitVec 32) (_ BitVec 32)) BitStream!7522)

(assert (=> b!176808 (= lt!272023 (readBitPure!0 (readerFrom!0 (_2!8254 lt!272024) (currentBit!8816 thiss!1204) (currentByte!8821 thiss!1204))))))

(declare-fun b!176809 () Bool)

(assert (=> b!176809 (= e!123221 (not true))))

(declare-fun lt!272018 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!176809 (= lt!272018 (bitIndex!0 (size!4207 (buf!4650 (_2!8254 lt!272024))) (currentByte!8821 (_2!8254 lt!272024)) (currentBit!8816 (_2!8254 lt!272024))))))

(declare-fun lt!272019 () (_ BitVec 64))

(assert (=> b!176809 (= lt!272019 (bitIndex!0 (size!4207 (buf!4650 thiss!1204)) (currentByte!8821 thiss!1204) (currentBit!8816 thiss!1204)))))

(declare-fun e!123225 () Bool)

(assert (=> b!176809 e!123225))

(declare-fun res!146520 () Bool)

(assert (=> b!176809 (=> (not res!146520) (not e!123225))))

(assert (=> b!176809 (= res!146520 (= (size!4207 (buf!4650 thiss!1204)) (size!4207 (buf!4650 (_2!8254 lt!272024)))))))

(declare-fun appendBit!0 (BitStream!7522 Bool) tuple2!15218)

(assert (=> b!176809 (= lt!272024 (appendBit!0 thiss!1204 lt!272020))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!176809 (= lt!272020 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!176810 () Bool)

(declare-fun array_inv!3948 (array!9542) Bool)

(assert (=> b!176810 (= e!123226 (array_inv!3948 (buf!4650 thiss!1204)))))

(declare-fun b!176811 () Bool)

(assert (=> b!176811 (= e!123225 e!123222)))

(declare-fun res!146519 () Bool)

(assert (=> b!176811 (=> (not res!146519) (not e!123222))))

(declare-fun lt!272022 () (_ BitVec 64))

(declare-fun lt!272021 () (_ BitVec 64))

(assert (=> b!176811 (= res!146519 (= lt!272022 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!272021)))))

(assert (=> b!176811 (= lt!272022 (bitIndex!0 (size!4207 (buf!4650 (_2!8254 lt!272024))) (currentByte!8821 (_2!8254 lt!272024)) (currentBit!8816 (_2!8254 lt!272024))))))

(assert (=> b!176811 (= lt!272021 (bitIndex!0 (size!4207 (buf!4650 thiss!1204)) (currentByte!8821 thiss!1204) (currentBit!8816 thiss!1204)))))

(declare-fun b!176812 () Bool)

(declare-fun res!146515 () Bool)

(assert (=> b!176812 (=> (not res!146515) (not e!123221))))

(assert (=> b!176812 (= res!146515 (not (= i!590 nBits!348)))))

(declare-fun b!176813 () Bool)

(assert (=> b!176813 (= e!123223 (= (bitIndex!0 (size!4207 (buf!4650 (_1!8255 lt!272023))) (currentByte!8821 (_1!8255 lt!272023)) (currentBit!8816 (_1!8255 lt!272023))) lt!272022))))

(declare-fun b!176814 () Bool)

(declare-fun res!146517 () Bool)

(assert (=> b!176814 (=> (not res!146517) (not e!123221))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!176814 (= res!146517 (invariant!0 (currentBit!8816 thiss!1204) (currentByte!8821 thiss!1204) (size!4207 (buf!4650 thiss!1204))))))

(assert (= (and start!39350 res!146516) b!176807))

(assert (= (and b!176807 res!146518) b!176814))

(assert (= (and b!176814 res!146517) b!176812))

(assert (= (and b!176812 res!146515) b!176809))

(assert (= (and b!176809 res!146520) b!176811))

(assert (= (and b!176811 res!146519) b!176806))

(assert (= (and b!176806 res!146513) b!176808))

(assert (= (and b!176808 res!146514) b!176813))

(assert (= start!39350 b!176810))

(declare-fun m!276841 () Bool)

(assert (=> start!39350 m!276841))

(declare-fun m!276843 () Bool)

(assert (=> b!176807 m!276843))

(declare-fun m!276845 () Bool)

(assert (=> b!176811 m!276845))

(declare-fun m!276847 () Bool)

(assert (=> b!176811 m!276847))

(declare-fun m!276849 () Bool)

(assert (=> b!176813 m!276849))

(declare-fun m!276851 () Bool)

(assert (=> b!176806 m!276851))

(declare-fun m!276853 () Bool)

(assert (=> b!176814 m!276853))

(assert (=> b!176809 m!276845))

(assert (=> b!176809 m!276847))

(declare-fun m!276855 () Bool)

(assert (=> b!176809 m!276855))

(declare-fun m!276857 () Bool)

(assert (=> b!176808 m!276857))

(assert (=> b!176808 m!276857))

(declare-fun m!276859 () Bool)

(assert (=> b!176808 m!276859))

(declare-fun m!276861 () Bool)

(assert (=> b!176810 m!276861))

(push 1)

(assert (not b!176806))

(assert (not b!176807))

(assert (not b!176810))

(assert (not b!176814))

(assert (not b!176811))

(assert (not b!176808))

(assert (not b!176813))

(assert (not b!176809))

(assert (not start!39350))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

