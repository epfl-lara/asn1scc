; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48162 () Bool)

(assert start!48162)

(declare-fun res!191905 () Bool)

(declare-fun e!156942 () Bool)

(assert (=> start!48162 (=> (not res!191905) (not e!156942))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11589 0))(
  ( (array!11590 (arr!6075 (Array (_ BitVec 32) (_ BitVec 8))) (size!5088 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9272 0))(
  ( (BitStream!9273 (buf!5629 array!11589) (currentByte!10491 (_ BitVec 32)) (currentBit!10486 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9272)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9272)

(assert (=> start!48162 (= res!191905 (and (= (size!5088 (buf!5629 b1!101)) (size!5088 (buf!5629 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48162 e!156942))

(declare-fun e!156939 () Bool)

(declare-fun inv!12 (BitStream!9272) Bool)

(assert (=> start!48162 (and (inv!12 b1!101) e!156939)))

(declare-fun e!156941 () Bool)

(assert (=> start!48162 (and (inv!12 b2!99) e!156941)))

(assert (=> start!48162 true))

(declare-fun b!228823 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228823 (= e!156942 (not (invariant!0 (currentBit!10486 b2!99) (currentByte!10491 b2!99) (size!5088 (buf!5629 b2!99)))))))

(declare-fun b!228824 () Bool)

(declare-fun array_inv!4829 (array!11589) Bool)

(assert (=> b!228824 (= e!156939 (array_inv!4829 (buf!5629 b1!101)))))

(declare-fun b!228825 () Bool)

(assert (=> b!228825 (= e!156941 (array_inv!4829 (buf!5629 b2!99)))))

(assert (= (and start!48162 res!191905) b!228823))

(assert (= start!48162 b!228824))

(assert (= start!48162 b!228825))

(declare-fun m!352623 () Bool)

(assert (=> start!48162 m!352623))

(declare-fun m!352625 () Bool)

(assert (=> start!48162 m!352625))

(declare-fun m!352627 () Bool)

(assert (=> b!228823 m!352627))

(declare-fun m!352629 () Bool)

(assert (=> b!228824 m!352629))

(declare-fun m!352631 () Bool)

(assert (=> b!228825 m!352631))

(push 1)

(assert (not b!228824))

(assert (not b!228823))

(assert (not b!228825))

(assert (not start!48162))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77580 () Bool)

(assert (=> d!77580 (= (array_inv!4829 (buf!5629 b1!101)) (bvsge (size!5088 (buf!5629 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!228824 d!77580))

(declare-fun d!77582 () Bool)

(assert (=> 