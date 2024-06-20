; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30484 () Bool)

(assert start!30484)

(declare-fun res!130193 () Bool)

(declare-fun e!104959 () Bool)

(assert (=> start!30484 (=> (not res!130193) (not e!104959))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7086 0))(
  ( (array!7087 (arr!4007 (Array (_ BitVec 32) (_ BitVec 8))) (size!3184 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7086)

(assert (=> start!30484 (= res!130193 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3184 arr!153))))))

(assert (=> start!30484 e!104959))

(assert (=> start!30484 true))

(declare-fun array_inv!2973 (array!7086) Bool)

(assert (=> start!30484 (array_inv!2973 arr!153)))

(declare-datatypes ((BitStream!5626 0))(
  ( (BitStream!5627 (buf!3687 array!7086) (currentByte!6745 (_ BitVec 32)) (currentBit!6740 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5626)

(declare-fun e!104958 () Bool)

(declare-fun inv!12 (BitStream!5626) Bool)

(assert (=> start!30484 (and (inv!12 bs!65) e!104958)))

(declare-fun b!155669 () Bool)

(declare-fun res!130192 () Bool)

(assert (=> b!155669 (=> (not res!130192) (not e!104959))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!155669 (= res!130192 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3184 (buf!3687 bs!65))) ((_ sign_extend 32) (currentByte!6745 bs!65)) ((_ sign_extend 32) (currentBit!6740 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!155670 () Bool)

(assert (=> b!155670 (= e!104959 (bvsgt from!240 to!236))))

(declare-fun b!155671 () Bool)

(assert (=> b!155671 (= e!104958 (array_inv!2973 (buf!3687 bs!65)))))

(assert (= (and start!30484 res!130193) b!155669))

(assert (= (and b!155669 res!130192) b!155670))

(assert (= start!30484 b!155671))

(declare-fun m!241815 () Bool)

(assert (=> start!30484 m!241815))

(declare-fun m!241817 () Bool)

(assert (=> start!30484 m!241817))

(declare-fun m!241819 () Bool)

(assert (=> b!155669 m!241819))

(declare-fun m!241821 () Bool)

(assert (=> b!155671 m!241821))

(push 1)

(assert (not b!155669))

(assert (not b!155671))

(assert (not start!30484))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

