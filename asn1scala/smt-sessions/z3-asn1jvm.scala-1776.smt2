; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48546 () Bool)

(assert start!48546)

(declare-fun b!229969 () Bool)

(declare-fun e!157895 () Bool)

(declare-fun e!157891 () Bool)

(assert (=> b!229969 (= e!157895 e!157891)))

(declare-fun res!192778 () Bool)

(assert (=> b!229969 (=> (not res!192778) (not e!157891))))

(declare-fun lt!367746 () (_ BitVec 32))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!229969 (= res!192778 (bvsle lt!367746 bytes!19))))

(declare-fun lt!367741 () (_ BitVec 64))

(assert (=> b!229969 (= lt!367746 ((_ extract 31 0) lt!367741))))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> b!229969 (= lt!367741 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!229970 () Bool)

(declare-fun res!192777 () Bool)

(assert (=> b!229970 (=> (not res!192777) (not e!157891))))

(declare-fun lt!367742 () (_ BitVec 64))

(declare-datatypes ((array!11713 0))(
  ( (array!11714 (arr!6122 (Array (_ BitVec 32) (_ BitVec 8))) (size!5135 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9366 0))(
  ( (BitStream!9367 (buf!5676 array!11713) (currentByte!10623 (_ BitVec 32)) (currentBit!10618 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9366)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!229970 (= res!192777 (= lt!367742 (bvadd (bitIndex!0 (size!5135 (buf!5676 b1!101)) (currentByte!10623 b1!101) (currentBit!10618 b1!101)) bits!86)))))

(declare-fun b!229971 () Bool)

(declare-fun e!157899 () Bool)

(declare-fun b2!99 () BitStream!9366)

(declare-fun array_inv!4876 (array!11713) Bool)

(assert (=> b!229971 (= e!157899 (array_inv!4876 (buf!5676 b2!99)))))

(declare-fun b!229972 () Bool)

(declare-fun res!192776 () Bool)

(assert (=> b!229972 (=> (not res!192776) (not e!157891))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!229972 (= res!192776 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5135 (buf!5676 b1!101))) ((_ sign_extend 32) (currentByte!10623 b1!101)) ((_ sign_extend 32) (currentBit!10618 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!229973 () Bool)

(declare-fun e!157900 () Bool)

(assert (=> b!229973 (= e!157891 e!157900)))

(declare-fun res!192772 () Bool)

(assert (=> b!229973 (=> (not res!192772) (not e!157900))))

(declare-fun lt!367743 () (_ BitVec 64))

(assert (=> b!229973 (= res!192772 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5135 (buf!5676 b1!101)))) lt!367743) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!229973 (= lt!367743 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10623 b1!101))) ((_ sign_extend 32) (currentBit!10618 b1!101))))))

(declare-fun b!229974 () Bool)

(declare-fun e!157897 () Bool)

(assert (=> b!229974 (= e!157897 e!157895)))

(declare-fun res!192774 () Bool)

(assert (=> b!229974 (=> (not res!192774) (not e!157895))))

(assert (=> b!229974 (= res!192774 (bvsle bits!86 lt!367742))))

(assert (=> b!229974 (= lt!367742 (bitIndex!0 (size!5135 (buf!5676 b2!99)) (currentByte!10623 b2!99) (currentBit!10618 b2!99)))))

(declare-fun b!229975 () Bool)

(declare-fun e!157896 () Bool)

(assert (=> b!229975 (= e!157900 e!157896)))

(declare-fun res!192771 () Bool)

(assert (=> b!229975 (=> (not res!192771) (not e!157896))))

(declare-fun lt!367745 () (_ BitVec 64))

(assert (=> b!229975 (= res!192771 (and (= lt!367742 lt!367745) (= (bvsub lt!367742 bits!86) lt!367743)))))

(assert (=> b!229975 (= lt!367745 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10623 b2!99))) ((_ sign_extend 32) (currentBit!10618 b2!99))))))

(declare-fun b!229976 () Bool)

(declare-fun res!192770 () Bool)

(declare-fun e!157893 () Bool)

(assert (=> b!229976 (=> (not res!192770) (not e!157893))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!229976 (= res!192770 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5135 (buf!5676 b2!99))) ((_ sign_extend 32) (currentByte!10623 b2!99)) ((_ sign_extend 32) (currentBit!10618 b2!99)) (bvsub bytes!19 lt!367746)))))

(declare-fun b!229977 () Bool)

(assert (=> b!229977 (= e!157896 e!157893)))

(declare-fun res!192769 () Bool)

(assert (=> b!229977 (=> (not res!192769) (not e!157893))))

(declare-fun lt!367744 () (_ BitVec 64))

(assert (=> b!229977 (= res!192769 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub lt!367744 (bvsub lt!367745 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub lt!367744 lt!367745) #b0000000000000000000000000000000000000000000000000000000000001000) lt!367741))))))

(assert (=> b!229977 (= lt!367744 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5135 (buf!5676 b2!99)))))))

(declare-fun res!192775 () Bool)

(assert (=> start!48546 (=> (not res!192775) (not e!157897))))

(assert (=> start!48546 (= res!192775 (and (= (size!5135 (buf!5676 b1!101)) (size!5135 (buf!5676 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48546 e!157897))

(declare-fun e!157894 () Bool)

(declare-fun inv!12 (BitStream!9366) Bool)

(assert (=> start!48546 (and (inv!12 b1!101) e!157894)))

(assert (=> start!48546 (and (inv!12 b2!99) e!157899)))

(assert (=> start!48546 true))

(declare-fun b!229978 () Bool)

(assert (=> b!229978 (= e!157894 (array_inv!4876 (buf!5676 b1!101)))))

(declare-fun b!229979 () Bool)

(declare-fun res!192773 () Bool)

(assert (=> b!229979 (=> (not res!192773) (not e!157891))))

(assert (=> b!229979 (= res!192773 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5135 (buf!5676 b1!101))) ((_ sign_extend 32) (currentByte!10623 b1!101)) ((_ sign_extend 32) (currentBit!10618 b1!101)) bytes!19))))

(declare-fun b!229980 () Bool)

(assert (=> b!229980 (= e!157893 (or (bvsgt ((_ sign_extend 32) (size!5135 (buf!5676 b2!99))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!10623 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!10618 b2!99)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (= (and start!48546 res!192775) b!229974))

(assert (= (and b!229974 res!192774) b!229969))

(assert (= (and b!229969 res!192778) b!229979))

(assert (= (and b!229979 res!192773) b!229970))

(assert (= (and b!229970 res!192777) b!229972))

(assert (= (and b!229972 res!192776) b!229973))

(assert (= (and b!229973 res!192772) b!229975))

(assert (= (and b!229975 res!192771) b!229977))

(assert (= (and b!229977 res!192769) b!229976))

(assert (= (and b!229976 res!192770) b!229980))

(assert (= start!48546 b!229978))

(assert (= start!48546 b!229971))

(declare-fun m!353467 () Bool)

(assert (=> b!229974 m!353467))

(declare-fun m!353469 () Bool)

(assert (=> b!229978 m!353469))

(declare-fun m!353471 () Bool)

(assert (=> b!229971 m!353471))

(declare-fun m!353473 () Bool)

(assert (=> start!48546 m!353473))

(declare-fun m!353475 () Bool)

(assert (=> start!48546 m!353475))

(declare-fun m!353477 () Bool)

(assert (=> b!229972 m!353477))

(declare-fun m!353479 () Bool)

(assert (=> b!229970 m!353479))

(declare-fun m!353481 () Bool)

(assert (=> b!229979 m!353481))

(declare-fun m!353483 () Bool)

(assert (=> b!229976 m!353483))

(check-sat (not b!229972) (not b!229974) (not b!229979) (not b!229978) (not b!229976) (not b!229970) (not start!48546) (not b!229971))
(check-sat)
