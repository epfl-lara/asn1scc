; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58608 () Bool)

(assert start!58608)

(declare-fun e!189052 () Bool)

(declare-datatypes ((array!14999 0))(
  ( (array!15000 (arr!7525 (Array (_ BitVec 32) (_ BitVec 8))) (size!6538 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11890 0))(
  ( (BitStream!11891 (buf!7006 array!14999) (currentByte!12942 (_ BitVec 32)) (currentBit!12937 (_ BitVec 32))) )
))
(declare-fun w3!25 () BitStream!11890)

(declare-fun w2!587 () BitStream!11890)

(declare-fun w1!591 () BitStream!11890)

(declare-fun b!269089 () Bool)

(assert (=> b!269089 (= e!189052 (and (bvsle #b00000000000000000000000000000000 (currentByte!12942 w1!591)) (bvsle (currentByte!12942 w1!591) (currentByte!12942 w2!587)) (or (bvsgt (size!6538 (buf!7006 w1!591)) (size!6538 (buf!7006 w2!587))) (bvsgt (size!6538 (buf!7006 w2!587)) (size!6538 (buf!7006 w3!25))))))))

(declare-fun b!269090 () Bool)

(declare-fun e!189049 () Bool)

(declare-fun array_inv!6262 (array!14999) Bool)

(assert (=> b!269090 (= e!189049 (array_inv!6262 (buf!7006 w1!591)))))

(declare-fun b!269092 () Bool)

(declare-fun res!224350 () Bool)

(assert (=> b!269092 (=> (not res!224350) (not e!189052))))

(declare-fun isPrefixOf!0 (BitStream!11890 BitStream!11890) Bool)

(assert (=> b!269092 (= res!224350 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!269093 () Bool)

(declare-fun e!189054 () Bool)

(assert (=> b!269093 (= e!189054 (array_inv!6262 (buf!7006 w2!587)))))

(declare-fun b!269091 () Bool)

(declare-fun e!189053 () Bool)

(assert (=> b!269091 (= e!189053 (array_inv!6262 (buf!7006 w3!25)))))

(declare-fun res!224349 () Bool)

(assert (=> start!58608 (=> (not res!224349) (not e!189052))))

(assert (=> start!58608 (= res!224349 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58608 e!189052))

(declare-fun inv!12 (BitStream!11890) Bool)

(assert (=> start!58608 (and (inv!12 w1!591) e!189049)))

(assert (=> start!58608 (and (inv!12 w2!587) e!189054)))

(assert (=> start!58608 (and (inv!12 w3!25) e!189053)))

(assert (= (and start!58608 res!224349) b!269092))

(assert (= (and b!269092 res!224350) b!269089))

(assert (= start!58608 b!269090))

(assert (= start!58608 b!269093))

(assert (= start!58608 b!269091))

(declare-fun m!400631 () Bool)

(assert (=> b!269092 m!400631))

(declare-fun m!400633 () Bool)

(assert (=> b!269091 m!400633))

(declare-fun m!400635 () Bool)

(assert (=> start!58608 m!400635))

(declare-fun m!400637 () Bool)

(assert (=> start!58608 m!400637))

(declare-fun m!400639 () Bool)

(assert (=> start!58608 m!400639))

(declare-fun m!400641 () Bool)

(assert (=> start!58608 m!400641))

(declare-fun m!400643 () Bool)

(assert (=> b!269093 m!400643))

(declare-fun m!400645 () Bool)

(assert (=> b!269090 m!400645))

(push 1)

(assert (not start!58608))

(assert (not b!269090))

(assert (not b!269092))

(assert (not b!269093))

(assert (not b!269091))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91042 () Bool)

(declare-fun res!224381 () Bool)

(declare-fun e!189109 () Bool)

(assert (=> d!91042 (=> (not res!224381) (not e!189109))))

(assert (=> d!91042 (= res!224381 (= (size!6538 (buf!7006 w1!591)) (size!6538 (buf!7006 w2!587))))))

(assert (=> d!91042 (= (isPrefixOf!0 w1!591 w2!587) e!189109)))

(declare-fun b!269142 () Bool)

(declare-fun res!224382 () Bool)

(assert (=> b!269142 (=> (not res!224382) (not e!189109))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!269142 (= res!224382 (bvsle (bitIndex!0 (size!6538 (buf!7006 w1!591)) (currentByte!12942 w1!591) (currentBit!12937 w1!591)) (bitIndex!0 (size!6538 (buf!7006 w2!587)) (currentByte!12942 w2!587) (currentBit!12937 w2!587))))))

(declare-fun b!269143 () Bool)

(declare-fun e!189110 () Bool)

(assert (=> b!269143 (= e!189109 e!189110)))

(declare-fun res!224383 () Bool)

(assert (=> b!269143 (=> res!224383 e!189110)))

(assert (=> b!269143 (= res!224383 (= (size!6538 (buf!7006 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!269144 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14999 array!14999 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!269144 (= e!189110 (arrayBitRangesEq!0 (buf!7006 w1!591) (buf!7006 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6538 (buf!7006 w1!591)) (currentByte!12942 w1!591) (currentBit!12937 w1!591))))))

(assert (= (and d!91042 res!224381) b!269142))

(assert (= (and b!269142 res!224382) b!269143))

(assert (= (and b!269143 (not res!224383)) b!269144))

(declare-fun m!400695 () Bool)

(assert (=> b!269142 m!400695))

(declare-fun m!400697 () Bool)

(assert (=> b!269142 m!400697))

(assert (=> b!269144 m!400695))

(assert (=> b!269144 m!400695))

(declare-fun m!400699 () Bool)

(assert (=> b!269144 m!400699))

(assert (=> start!58608 d!91042))

(declare-fun d!91062 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!91062 (= (inv!12 w1!591) (invariant!0 (currentBit!12937 w1!591) (currentByte!12942 w1!591) (size!6538 (buf!7006 w1!591))))))

(declare-fun bs!23085 () Bool)

(assert (= bs!23085 d!91062))

(declare-fun m!400701 () Bool)

(assert (=> bs!23085 m!400701))

(assert (=> start!58608 d!91062))

(declare-fun d!91064 () Bool)

(assert (=> d!91064 (= (inv!12 w2!587) (invariant!0 (currentBit!12937 w2!587) (currentByte!12942 w2!587) (size!6538 (buf!7006 w2!587))))))

(declare-fun bs!23086 () Bool)

(assert (= bs!23086 d!91064))

(declare-fun m!400703 () Bool)

(assert (=> bs!23086 m!400703))

(assert (=> start!58608 d!91064))

(declare-fun d!91066 () Bool)

(assert (=> d!91066 (= (inv!12 w3!25) (invariant!0 (currentBit!12937 w3!25) (currentByte!12942 w3!25) (size!6538 (buf!7006 w3!25))))))

(declare-fun bs!23087 () Bool)

(assert (= bs!23087 d!91066))

(declare-fun m!400705 () Bool)

(assert (=> bs!23087 m!400705))

(assert (=> start!58608 d!91066))

(declare-fun d!91068 () Bool)

(assert (=> d!91068 (= (array_inv!6262 (buf!7006 w1!591)) (bvsge (size!6538 (buf!7006 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!269090 d!91068))

(declare-fun d!91070 () Bool)

(assert (=> d!91070 (= (array_inv!6262 (buf!7006 w3!25)) (bvsge (size!6538 (buf!7006 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!269091 d!91070))

(declare-fun d!91072 () Bool)

(assert (=> d!91072 (= (array_inv!6262 (buf!7006 w2!587)) (bvsge (size!6538 (buf!7006 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!269093 d!91072))

(declare-fun d!91074 () Bool)

(declare-fun res!224386 () Bool)

(declare-fun e!189113 () Bool)

(assert (=> d!91074 (=> (not res!224386) (not e!189113))))

(assert (=> d!91074 (= res!224386 (= (size!6538 (buf!7006 w2!587)) (size!6538 (buf!7006 w3!25))))))

(assert (=> d!91074 (= (isPrefixOf!0 w2!587 w3!25) e!189113)))

(declare-fun b!269147 () Bool)

(declare-fun res!224387 () Bool)

(assert (=> b!269147 (=> (not res!224387) (not e!189113))))

(assert (=> b!269147 (= res!224387 (bvsle (bitIndex!0 (size!6538 (buf!7006 w2!587)) (currentByte!12942 w2!587) (currentBit!12937 w2!587)) (bitIndex!0 (size!6538 (buf!7006 w3!25)) (currentByte!12942 w3!25) (currentBit!12937 w3!25))))))

(declare-fun b!269148 () Bool)

(declare-fun e!189114 () Bool)

(assert (=> b!269148 (= e!189113 e!189114)))

(declare-fun res!224388 () Bool)

(assert (=> b!269148 (=> res!224388 e!189114)))

(assert (=> b!269148 (= res!224388 (= (size!6538 (buf!7006 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!269149 () Bool)

(assert (=> b!269149 (= e!189114 (arrayBitRangesEq!0 (buf!7006 w2!587) (buf!7006 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6538 (buf!7006 w2!587)) (currentByte!12942 w2!587) (currentBit!12937 w2!587))))))

(assert (= (and d!91074 res!224386) b!269147))

(assert (= (and b!269147 res!224387) b!269148))

(assert (= (and b!269148 (not res!224388)) b!269149))

(assert (=> b!269147 m!400697))

(declare-fun m!400707 () Bool)

(assert (=> b!269147 m!400707))

(assert (=> b!269149 m!400697))

(assert (=> b!269149 m!400697))

(declare-fun m!400709 () Bool)

(assert (=> b!269149 m!400709))

(assert (=> b!269092 d!91074))

(push 1)

(assert (not b!269142))

(assert (not b!269147))

(assert (not b!269149))

(assert (not b!269144))

(assert (not d!91064))

(assert (not d!91066))

(assert (not d!91062))

(check-sat)

(pop 1)

(push 1)

(check-sat)

