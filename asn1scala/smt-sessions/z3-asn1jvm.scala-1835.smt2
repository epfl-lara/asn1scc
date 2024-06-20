; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49274 () Bool)

(assert start!49274)

(declare-fun b!234078 () Bool)

(declare-fun res!195816 () Bool)

(declare-fun e!161375 () Bool)

(assert (=> b!234078 (=> (not res!195816) (not e!161375))))

(declare-datatypes ((array!12108 0))(
  ( (array!12109 (arr!6299 (Array (_ BitVec 32) (_ BitVec 8))) (size!5312 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9720 0))(
  ( (BitStream!9721 (buf!5853 array!12108) (currentByte!10905 (_ BitVec 32)) (currentBit!10900 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9720)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!234078 (= res!195816 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5312 (buf!5853 b1!101))) ((_ sign_extend 32) (currentByte!10905 b1!101)) ((_ sign_extend 32) (currentBit!10900 b1!101)) bytes!19))))

(declare-fun b!234079 () Bool)

(declare-fun res!195817 () Bool)

(assert (=> b!234079 (=> (not res!195817) (not e!161375))))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> b!234079 (= res!195817 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!234080 () Bool)

(declare-fun e!161374 () Bool)

(declare-fun array_inv!5053 (array!12108) Bool)

(assert (=> b!234080 (= e!161374 (array_inv!5053 (buf!5853 b1!101)))))

(declare-fun b!234081 () Bool)

(declare-fun res!195818 () Bool)

(assert (=> b!234081 (=> (not res!195818) (not e!161375))))

(declare-fun b2!99 () BitStream!9720)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!234081 (= res!195818 (bvsle bits!86 (bitIndex!0 (size!5312 (buf!5853 b2!99)) (currentByte!10905 b2!99) (currentBit!10900 b2!99))))))

(declare-fun res!195819 () Bool)

(assert (=> start!49274 (=> (not res!195819) (not e!161375))))

(assert (=> start!49274 (= res!195819 (and (= (size!5312 (buf!5853 b1!101)) (size!5312 (buf!5853 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49274 e!161375))

(declare-fun inv!12 (BitStream!9720) Bool)

(assert (=> start!49274 (and (inv!12 b1!101) e!161374)))

(declare-fun e!161371 () Bool)

(assert (=> start!49274 (and (inv!12 b2!99) e!161371)))

(assert (=> start!49274 true))

(declare-fun b!234082 () Bool)

(assert (=> b!234082 (= e!161371 (array_inv!5053 (buf!5853 b2!99)))))

(declare-fun b!234083 () Bool)

(assert (=> b!234083 (= e!161375 false)))

(declare-fun lt!369846 () (_ BitVec 64))

(assert (=> b!234083 (= lt!369846 (bitIndex!0 (size!5312 (buf!5853 b1!101)) (currentByte!10905 b1!101) (currentBit!10900 b1!101)))))

(assert (= (and start!49274 res!195819) b!234081))

(assert (= (and b!234081 res!195818) b!234079))

(assert (= (and b!234079 res!195817) b!234078))

(assert (= (and b!234078 res!195816) b!234083))

(assert (= start!49274 b!234080))

(assert (= start!49274 b!234082))

(declare-fun m!356413 () Bool)

(assert (=> b!234080 m!356413))

(declare-fun m!356415 () Bool)

(assert (=> b!234078 m!356415))

(declare-fun m!356417 () Bool)

(assert (=> b!234082 m!356417))

(declare-fun m!356419 () Bool)

(assert (=> b!234081 m!356419))

(declare-fun m!356421 () Bool)

(assert (=> b!234083 m!356421))

(declare-fun m!356423 () Bool)

(assert (=> start!49274 m!356423))

(declare-fun m!356425 () Bool)

(assert (=> start!49274 m!356425))

(check-sat (not b!234081) (not b!234080) (not b!234082) (not b!234083) (not b!234078) (not start!49274))
