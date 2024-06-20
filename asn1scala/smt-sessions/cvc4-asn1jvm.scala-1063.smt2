; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30488 () Bool)

(assert start!30488)

(declare-fun res!130205 () Bool)

(declare-fun e!104984 () Bool)

(assert (=> start!30488 (=> (not res!130205) (not e!104984))))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7090 0))(
  ( (array!7091 (arr!4009 (Array (_ BitVec 32) (_ BitVec 8))) (size!3186 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7090)

(declare-fun from!240 () (_ BitVec 32))

(assert (=> start!30488 (= res!130205 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3186 arr!153))))))

(assert (=> start!30488 e!104984))

(assert (=> start!30488 true))

(declare-fun array_inv!2975 (array!7090) Bool)

(assert (=> start!30488 (array_inv!2975 arr!153)))

(declare-datatypes ((BitStream!5630 0))(
  ( (BitStream!5631 (buf!3689 array!7090) (currentByte!6747 (_ BitVec 32)) (currentBit!6742 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5630)

(declare-fun e!104983 () Bool)

(declare-fun inv!12 (BitStream!5630) Bool)

(assert (=> start!30488 (and (inv!12 bs!65) e!104983)))

(declare-fun b!155687 () Bool)

(declare-fun res!130204 () Bool)

(assert (=> b!155687 (=> (not res!130204) (not e!104984))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!155687 (= res!130204 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3186 (buf!3689 bs!65))) ((_ sign_extend 32) (currentByte!6747 bs!65)) ((_ sign_extend 32) (currentBit!6742 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!155688 () Bool)

(assert (=> b!155688 (= e!104984 (bvsgt from!240 to!236))))

(declare-fun b!155689 () Bool)

(assert (=> b!155689 (= e!104983 (array_inv!2975 (buf!3689 bs!65)))))

(assert (= (and start!30488 res!130205) b!155687))

(assert (= (and b!155687 res!130204) b!155688))

(assert (= start!30488 b!155689))

(declare-fun m!241831 () Bool)

(assert (=> start!30488 m!241831))

(declare-fun m!241833 () Bool)

(assert (=> start!30488 m!241833))

(declare-fun m!241835 () Bool)

(assert (=> b!155687 m!241835))

(declare-fun m!241837 () Bool)

(assert (=> b!155689 m!241837))

(push 1)

(assert (not b!155689))

(assert (not start!30488))

(assert (not b!155687))

(check-sat)

(pop 1)

(push 1)

(check-sat)

