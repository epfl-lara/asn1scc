; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48782 () Bool)

(assert start!48782)

(declare-fun res!193470 () Bool)

(declare-fun e!158672 () Bool)

(assert (=> start!48782 (=> (not res!193470) (not e!158672))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11802 0))(
  ( (array!11803 (arr!6158 (Array (_ BitVec 32) (_ BitVec 8))) (size!5171 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9438 0))(
  ( (BitStream!9439 (buf!5712 array!11802) (currentByte!10707 (_ BitVec 32)) (currentBit!10702 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9438)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9438)

(assert (=> start!48782 (= res!193470 (and (= (size!5171 (buf!5712 b1!101)) (size!5171 (buf!5712 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48782 e!158672))

(declare-fun e!158675 () Bool)

(declare-fun inv!12 (BitStream!9438) Bool)

(assert (=> start!48782 (and (inv!12 b1!101) e!158675)))

(declare-fun e!158673 () Bool)

(assert (=> start!48782 (and (inv!12 b2!99) e!158673)))

(assert (=> start!48782 true))

(declare-fun b!230886 () Bool)

(assert (=> b!230886 (= e!158672 false)))

(declare-fun lt!368388 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230886 (= lt!368388 (bitIndex!0 (size!5171 (buf!5712 b2!99)) (currentByte!10707 b2!99) (currentBit!10702 b2!99)))))

(declare-fun b!230887 () Bool)

(declare-fun array_inv!4912 (array!11802) Bool)

(assert (=> b!230887 (= e!158675 (array_inv!4912 (buf!5712 b1!101)))))

(declare-fun b!230888 () Bool)

(assert (=> b!230888 (= e!158673 (array_inv!4912 (buf!5712 b2!99)))))

(assert (= (and start!48782 res!193470) b!230886))

(assert (= start!48782 b!230887))

(assert (= start!48782 b!230888))

(declare-fun m!354117 () Bool)

(assert (=> start!48782 m!354117))

(declare-fun m!354119 () Bool)

(assert (=> start!48782 m!354119))

(declare-fun m!354121 () Bool)

(assert (=> b!230886 m!354121))

(declare-fun m!354123 () Bool)

(assert (=> b!230887 m!354123))

(declare-fun m!354125 () Bool)

(assert (=> b!230888 m!354125))

(check-sat (not b!230887) (not b!230888) (not b!230886) (not start!48782))
