; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30478 () Bool)

(assert start!30478)

(declare-fun res!130174 () Bool)

(declare-fun e!104923 () Bool)

(assert (=> start!30478 (=> (not res!130174) (not e!104923))))

(declare-datatypes ((array!7080 0))(
  ( (array!7081 (arr!4004 (Array (_ BitVec 32) (_ BitVec 8))) (size!3181 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5620 0))(
  ( (BitStream!5621 (buf!3684 array!7080) (currentByte!6742 (_ BitVec 32)) (currentBit!6737 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5620)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun arr!153 () array!7080)

(assert (=> start!30478 (= res!130174 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3181 arr!153)) (bvsle ((_ sign_extend 32) (size!3181 (buf!3684 bs!65))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!6742 bs!65)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!6737 bs!65)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3181 (buf!3684 bs!65))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!6742 bs!65)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!6737 bs!65)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!30478 e!104923))

(assert (=> start!30478 true))

(declare-fun array_inv!2970 (array!7080) Bool)

(assert (=> start!30478 (array_inv!2970 arr!153)))

(declare-fun e!104921 () Bool)

(declare-fun inv!12 (BitStream!5620) Bool)

(assert (=> start!30478 (and (inv!12 bs!65) e!104921)))

(declare-fun b!155642 () Bool)

(declare-fun res!130175 () Bool)

(assert (=> b!155642 (=> (not res!130175) (not e!104923))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!155642 (= res!130175 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!6737 bs!65))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!6742 bs!65))) ((_ extract 31 0) ((_ sign_extend 32) (size!3181 (buf!3684 bs!65))))))))

(declare-fun b!155643 () Bool)

(assert (=> b!155643 (= e!104923 (bvslt (bvsub to!236 from!240) #b00000000000000000000000000000000))))

(declare-fun b!155644 () Bool)

(assert (=> b!155644 (= e!104921 (array_inv!2970 (buf!3684 bs!65)))))

(assert (= (and start!30478 res!130174) b!155642))

(assert (= (and b!155642 res!130175) b!155643))

(assert (= start!30478 b!155644))

(declare-fun m!241791 () Bool)

(assert (=> start!30478 m!241791))

(declare-fun m!241793 () Bool)

(assert (=> start!30478 m!241793))

(declare-fun m!241795 () Bool)

(assert (=> b!155642 m!241795))

(declare-fun m!241797 () Bool)

(assert (=> b!155644 m!241797))

(push 1)

(assert (not b!155644))

(assert (not start!30478))

(assert (not b!155642))

(check-sat)

(pop 1)

(push 1)

(check-sat)

