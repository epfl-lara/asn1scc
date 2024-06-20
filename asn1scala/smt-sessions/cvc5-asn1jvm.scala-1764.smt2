; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48246 () Bool)

(assert start!48246)

(declare-fun b!228991 () Bool)

(declare-fun res!192013 () Bool)

(declare-fun e!157111 () Bool)

(assert (=> b!228991 (=> (not res!192013) (not e!157111))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11618 0))(
  ( (array!11619 (arr!6085 (Array (_ BitVec 32) (_ BitVec 8))) (size!5098 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9292 0))(
  ( (BitStream!9293 (buf!5639 array!11618) (currentByte!10515 (_ BitVec 32)) (currentBit!10510 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9292)

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!228991 (= res!192013 (and (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19) (bvsle ((_ sign_extend 32) (size!5098 (buf!5639 b1!101))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10515 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10510 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5098 (buf!5639 b1!101))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!10515 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!10510 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!192015 () Bool)

(assert (=> start!48246 (=> (not res!192015) (not e!157111))))

(declare-fun b2!99 () BitStream!9292)

(assert (=> start!48246 (= res!192015 (and (= (size!5098 (buf!5639 b1!101)) (size!5098 (buf!5639 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48246 e!157111))

(declare-fun e!157107 () Bool)

(declare-fun inv!12 (BitStream!9292) Bool)

(assert (=> start!48246 (and (inv!12 b1!101) e!157107)))

(declare-fun e!157110 () Bool)

(assert (=> start!48246 (and (inv!12 b2!99) e!157110)))

(assert (=> start!48246 true))

(declare-fun b!228992 () Bool)

(declare-fun res!192016 () Bool)

(assert (=> b!228992 (=> (not res!192016) (not e!157111))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228992 (= res!192016 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10510 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10515 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (size!5098 (buf!5639 b1!101))))))))

(declare-fun b!228993 () Bool)

(declare-fun array_inv!4839 (array!11618) Bool)

(assert (=> b!228993 (= e!157110 (array_inv!4839 (buf!5639 b2!99)))))

(declare-fun b!228994 () Bool)

(assert (=> b!228994 (= e!157107 (array_inv!4839 (buf!5639 b1!101)))))

(declare-fun b!228995 () Bool)

(declare-fun res!192014 () Bool)

(assert (=> b!228995 (=> (not res!192014) (not e!157111))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228995 (= res!192014 (bvsle bits!86 (bitIndex!0 (size!5098 (buf!5639 b2!99)) (currentByte!10515 b2!99) (currentBit!10510 b2!99))))))

(declare-fun b!228996 () Bool)

(assert (=> b!228996 (= e!157111 (bvslt bytes!19 #b00000000000000000000000000000000))))

(assert (= (and start!48246 res!192015) b!228995))

(assert (= (and b!228995 res!192014) b!228991))

(assert (= (and b!228991 res!192013) b!228992))

(assert (= (and b!228992 res!192016) b!228996))

(assert (= start!48246 b!228994))

(assert (= start!48246 b!228993))

(declare-fun m!352771 () Bool)

(assert (=> b!228992 m!352771))

(declare-fun m!352773 () Bool)

(assert (=> start!48246 m!352773))

(declare-fun m!352775 () Bool)

(assert (=> start!48246 m!352775))

(declare-fun m!352777 () Bool)

(assert (=> b!228993 m!352777))

(declare-fun m!352779 () Bool)

(assert (=> b!228994 m!352779))

(declare-fun m!352781 () Bool)

(assert (=> b!228995 m!352781))

(push 1)

(assert (not b!228995))

(assert (not b!228993))

(assert (not start!48246))

(assert (not b!228994))

(assert (not b!228992))

(check-sat)

(pop 1)

(push 1)

(check-sat)

