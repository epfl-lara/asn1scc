; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56076 () Bool)

(assert start!56076)

(declare-datatypes ((array!14243 0))(
  ( (array!14244 (arr!7220 (Array (_ BitVec 32) (_ BitVec 8))) (size!6233 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11388 0))(
  ( (BitStream!11389 (buf!6755 array!14243) (currentByte!12429 (_ BitVec 32)) (currentBit!12424 (_ BitVec 32))) )
))
(declare-fun b1!100 () BitStream!11388)

(declare-fun buf!79 () array!14243)

(declare-fun bits!81 () (_ BitVec 64))

(assert (=> start!56076 (and (= (size!6233 (buf!6755 b1!100)) (size!6233 buf!79)) (bvsge bits!81 #b0000000000000000000000000000000000000000000000000000000000000000) (or (bvsgt ((_ sign_extend 32) (size!6233 (buf!6755 b1!100))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!12429 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!12424 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun e!180692 () Bool)

(declare-fun inv!12 (BitStream!11388) Bool)

(assert (=> start!56076 (and (inv!12 b1!100) e!180692)))

(declare-fun array_inv!5974 (array!14243) Bool)

(assert (=> start!56076 (array_inv!5974 buf!79)))

(assert (=> start!56076 true))

(declare-fun b!260320 () Bool)

(assert (=> b!260320 (= e!180692 (array_inv!5974 (buf!6755 b1!100)))))

(assert (= start!56076 b!260320))

(declare-fun m!389561 () Bool)

(assert (=> start!56076 m!389561))

(declare-fun m!389563 () Bool)

(assert (=> start!56076 m!389563))

(declare-fun m!389565 () Bool)

(assert (=> b!260320 m!389565))

(check-sat (not start!56076) (not b!260320))
(check-sat)
