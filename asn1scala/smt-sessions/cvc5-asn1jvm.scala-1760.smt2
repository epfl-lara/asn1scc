; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48158 () Bool)

(assert start!48158)

(declare-fun res!191899 () Bool)

(declare-fun e!156913 () Bool)

(assert (=> start!48158 (=> (not res!191899) (not e!156913))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11585 0))(
  ( (array!11586 (arr!6073 (Array (_ BitVec 32) (_ BitVec 8))) (size!5086 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9268 0))(
  ( (BitStream!9269 (buf!5627 array!11585) (currentByte!10489 (_ BitVec 32)) (currentBit!10484 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9268)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9268)

(assert (=> start!48158 (= res!191899 (and (= (size!5086 (buf!5627 b1!101)) (size!5086 (buf!5627 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48158 e!156913))

(declare-fun e!156911 () Bool)

(declare-fun inv!12 (BitStream!9268) Bool)

(assert (=> start!48158 (and (inv!12 b1!101) e!156911)))

(declare-fun e!156910 () Bool)

(assert (=> start!48158 (and (inv!12 b2!99) e!156910)))

(assert (=> start!48158 true))

(declare-fun b!228805 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228805 (= e!156913 (not (invariant!0 (currentBit!10484 b2!99) (currentByte!10489 b2!99) (size!5086 (buf!5627 b2!99)))))))

(declare-fun b!228806 () Bool)

(declare-fun array_inv!4827 (array!11585) Bool)

(assert (=> b!228806 (= e!156911 (array_inv!4827 (buf!5627 b1!101)))))

(declare-fun b!228807 () Bool)

(assert (=> b!228807 (= e!156910 (array_inv!4827 (buf!5627 b2!99)))))

(assert (= (and start!48158 res!191899) b!228805))

(assert (= start!48158 b!228806))

(assert (= start!48158 b!228807))

(declare-fun m!352603 () Bool)

(assert (=> start!48158 m!352603))

(declare-fun m!352605 () Bool)

(assert (=> start!48158 m!352605))

(declare-fun m!352607 () Bool)

(assert (=> b!228805 m!352607))

(declare-fun m!352609 () Bool)

(assert (=> b!228806 m!352609))

(declare-fun m!352611 () Bool)

(assert (=> b!228807 m!352611))

(push 1)

(assert (not b!228805))

(assert (not start!48158))

(assert (not b!228806))

(assert (not b!228807))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77576 () Bool)

(assert (=> d!77576 (= (invariant!0 (currentBit!10484 b2!99) (currentByte!10489 b2!99) (size!5086 (buf!5627 b2!99))) (and (bvsge (currentBit!10484 b2!99) #b00000000000000000000000000000000) (bvslt (currentBit!10484 b2!99) #b00000000000000000000000000001000) (bvsge (currentByte!10489 b2!99) #b00000000000000000000000000000000) (or (bvslt (currentByte!10489 b2!99) (size!5086 (buf!5627 b2!99))) (and (= (currentBit!10484 b2!99) #b00000000000000000000000000000000) (= (currentByte!10489 b2!99) (size!5086 (buf!5627 b2!99)))))))))

(assert (=> b!228805 d!77576))

(declare-fun d!77584 () Bool)

(assert (=> d!77584 (= (inv!12 b1!101) (invariant!0 (currentBit!10484 b1!101) (currentByte!10489 b1!101) (size!5086 (buf!5627 b1!101))))))

(declare-fun bs!18995 () Bool)

(assert (= bs!18995 d!77584))

(declare-fun m!352635 () Bool)

(assert (=> bs!18995 m!352635))

(assert (=> start!48158 d!77584))

(declare-fun d!77586 () Bool)

