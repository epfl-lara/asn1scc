; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48160 () Bool)

(assert start!48160)

(declare-fun res!191902 () Bool)

(declare-fun e!156925 () Bool)

(assert (=> start!48160 (=> (not res!191902) (not e!156925))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11587 0))(
  ( (array!11588 (arr!6074 (Array (_ BitVec 32) (_ BitVec 8))) (size!5087 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9270 0))(
  ( (BitStream!9271 (buf!5628 array!11587) (currentByte!10490 (_ BitVec 32)) (currentBit!10485 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9270)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9270)

(assert (=> start!48160 (= res!191902 (and (= (size!5087 (buf!5628 b1!101)) (size!5087 (buf!5628 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48160 e!156925))

(declare-fun e!156927 () Bool)

(declare-fun inv!12 (BitStream!9270) Bool)

(assert (=> start!48160 (and (inv!12 b1!101) e!156927)))

(declare-fun e!156924 () Bool)

(assert (=> start!48160 (and (inv!12 b2!99) e!156924)))

(assert (=> start!48160 true))

(declare-fun b!228814 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228814 (= e!156925 (not (invariant!0 (currentBit!10485 b2!99) (currentByte!10490 b2!99) (size!5087 (buf!5628 b2!99)))))))

(declare-fun b!228815 () Bool)

(declare-fun array_inv!4828 (array!11587) Bool)

(assert (=> b!228815 (= e!156927 (array_inv!4828 (buf!5628 b1!101)))))

(declare-fun b!228816 () Bool)

(assert (=> b!228816 (= e!156924 (array_inv!4828 (buf!5628 b2!99)))))

(assert (= (and start!48160 res!191902) b!228814))

(assert (= start!48160 b!228815))

(assert (= start!48160 b!228816))

(declare-fun m!352613 () Bool)

(assert (=> start!48160 m!352613))

(declare-fun m!352615 () Bool)

(assert (=> start!48160 m!352615))

(declare-fun m!352617 () Bool)

(assert (=> b!228814 m!352617))

(declare-fun m!352619 () Bool)

(assert (=> b!228815 m!352619))

(declare-fun m!352621 () Bool)

(assert (=> b!228816 m!352621))

(check-sat (not b!228814) (not start!48160) (not b!228816) (not b!228815))
(check-sat)
(get-model)

(declare-fun d!77568 () Bool)

(assert (=> d!77568 (= (invariant!0 (currentBit!10485 b2!99) (currentByte!10490 b2!99) (size!5087 (buf!5628 b2!99))) (and (bvsge (currentBit!10485 b2!99) #b00000000000000000000000000000000) (bvslt (currentBit!10485 b2!99) #b00000000000000000000000000001000) (bvsge (currentByte!10490 b2!99) #b00000000000000000000000000000000) (or (bvslt (currentByte!10490 b2!99) (size!5087 (buf!5628 b2!99))) (and (= (currentBit!10485 b2!99) #b00000000000000000000000000000000) (= (currentByte!10490 b2!99) (size!5087 (buf!5628 b2!99)))))))))

(assert (=> b!228814 d!77568))

(declare-fun d!77570 () Bool)

(assert (=> d!77570 (= (inv!12 b1!101) (invariant!0 (currentBit!10485 b1!101) (currentByte!10490 b1!101) (size!5087 (buf!5628 b1!101))))))

(declare-fun bs!18993 () Bool)

(assert (= bs!18993 d!77570))

(declare-fun m!352633 () Bool)

(assert (=> bs!18993 m!352633))

(assert (=> start!48160 d!77570))

(declare-fun d!77572 () Bool)

(assert (=> d!77572 (= (inv!12 b2!99) (invariant!0 (currentBit!10485 b2!99) (currentByte!10490 b2!99) (size!5087 (buf!5628 b2!99))))))

(declare-fun bs!18994 () Bool)

(assert (= bs!18994 d!77572))

(assert (=> bs!18994 m!352617))

(assert (=> start!48160 d!77572))

(declare-fun d!77574 () Bool)

(assert (=> d!77574 (= (array_inv!4828 (buf!5628 b2!99)) (bvsge (size!5087 (buf!5628 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!228816 d!77574))

(declare-fun d!77578 () Bool)

(assert (=> d!77578 (= (array_inv!4828 (buf!5628 b1!101)) (bvsge (size!5087 (buf!5628 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!228815 d!77578))

(check-sat (not d!77570) (not d!77572))
(check-sat)
