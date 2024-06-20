; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58612 () Bool)

(assert start!58612)

(declare-fun b!269119 () Bool)

(declare-fun e!189094 () Bool)

(declare-datatypes ((array!15003 0))(
  ( (array!15004 (arr!7527 (Array (_ BitVec 32) (_ BitVec 8))) (size!6540 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11894 0))(
  ( (BitStream!11895 (buf!7008 array!15003) (currentByte!12944 (_ BitVec 32)) (currentBit!12939 (_ BitVec 32))) )
))
(declare-fun w3!25 () BitStream!11894)

(declare-fun array_inv!6264 (array!15003) Bool)

(assert (=> b!269119 (= e!189094 (array_inv!6264 (buf!7008 w3!25)))))

(declare-fun b!269120 () Bool)

(declare-fun e!189091 () Bool)

(declare-fun w1!591 () BitStream!11894)

(assert (=> b!269120 (= e!189091 (array_inv!6264 (buf!7008 w1!591)))))

(declare-fun w2!587 () BitStream!11894)

(declare-fun b!269121 () Bool)

(declare-fun e!189096 () Bool)

(assert (=> b!269121 (= e!189096 (and (bvsle #b00000000000000000000000000000000 (currentByte!12944 w1!591)) (bvsle (currentByte!12944 w1!591) (currentByte!12944 w2!587)) (or (bvsgt (size!6540 (buf!7008 w1!591)) (size!6540 (buf!7008 w2!587))) (bvsgt (size!6540 (buf!7008 w2!587)) (size!6540 (buf!7008 w3!25))))))))

(declare-fun res!224361 () Bool)

(assert (=> start!58612 (=> (not res!224361) (not e!189096))))

(declare-fun isPrefixOf!0 (BitStream!11894 BitStream!11894) Bool)

(assert (=> start!58612 (= res!224361 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58612 e!189096))

(declare-fun inv!12 (BitStream!11894) Bool)

(assert (=> start!58612 (and (inv!12 w1!591) e!189091)))

(declare-fun e!189092 () Bool)

(assert (=> start!58612 (and (inv!12 w2!587) e!189092)))

(assert (=> start!58612 (and (inv!12 w3!25) e!189094)))

(declare-fun b!269122 () Bool)

(declare-fun res!224362 () Bool)

(assert (=> b!269122 (=> (not res!224362) (not e!189096))))

(assert (=> b!269122 (= res!224362 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!269123 () Bool)

(assert (=> b!269123 (= e!189092 (array_inv!6264 (buf!7008 w2!587)))))

(assert (= (and start!58612 res!224361) b!269122))

(assert (= (and b!269122 res!224362) b!269121))

(assert (= start!58612 b!269120))

(assert (= start!58612 b!269123))

(assert (= start!58612 b!269119))

(declare-fun m!400663 () Bool)

(assert (=> start!58612 m!400663))

(declare-fun m!400665 () Bool)

(assert (=> start!58612 m!400665))

(declare-fun m!400667 () Bool)

(assert (=> start!58612 m!400667))

(declare-fun m!400669 () Bool)

(assert (=> start!58612 m!400669))

(declare-fun m!400671 () Bool)

(assert (=> b!269123 m!400671))

(declare-fun m!400673 () Bool)

(assert (=> b!269120 m!400673))

(declare-fun m!400675 () Bool)

(assert (=> b!269119 m!400675))

(declare-fun m!400677 () Bool)

(assert (=> b!269122 m!400677))

(push 1)

(assert (not b!269122))

(assert (not b!269120))

(assert (not b!269123))

(assert (not start!58612))

(assert (not b!269119))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91056 () Bool)

(assert (=> d!91056 (= (array_inv!6264 (buf!7008 w2!587)) (bvsge (size!6540 (buf!7008 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!269123 d!91056))

(declare-fun d!91060 () Bool)

(declare-fun res!224393 () Bool)

(declare-fun e!189118 () Bool)

(assert (=> d!91060 (=> (not res!224393) (not e!189118))))

(assert (=> d!91060 (= res!224393 (= (size!6540 (buf!7008 w2!587)) (size!6540 (buf!7008 w3!25))))))

(assert (=> d!91060 (= (isPrefixOf!0 w2!587 w3!25) e!189118)))

(declare-fun b!269154 () Bool)

(declare-fun res!224395 () Bool)

(assert (=> b!269154 (=> (not res!224395) (not e!189118))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!269154 (= res!224395 (bvsle (bitIndex!0 (size!6540 (buf!7008 w2!587)) (currentByte!12944 w2!587) (currentBit!12939 w2!587)) (bitIndex!0 (size!6540 (buf!7008 w3!25)) (currentByte!12944 w3!25) (currentBit!12939 w3!25))))))

(declare-fun b!269155 () Bool)

(declare-fun e!189117 () Bool)

(assert (=> b!269155 (= e!189118 e!189117)))

(declare-fun res!224394 () Bool)

(assert (=> b!269155 (=> res!224394 e!189117)))

(assert (=> b!269155 (= res!224394 (= (size!6540 (buf!7008 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!269156 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15003 array!15003 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!269156 (= e!189117 (arrayBitRangesEq!0 (buf!7008 w2!587) (buf!7008 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6540 (buf!7008 w2!587)) (currentByte!12944 w2!587) (currentBit!12939 w2!587))))))

(assert (= (and d!91060 res!224393) b!269154))

(assert (= (and b!269154 res!224395) b!269155))

(assert (= (and b!269155 (not res!224394)) b!269156))

(declare-fun m!400711 () Bool)

(assert (=> b!269154 m!400711))

(declare-fun m!400713 () Bool)

(assert (=> b!269154 m!400713))

(assert (=> b!269156 m!400711))

(assert (=> b!269156 m!400711))

(declare-fun m!400715 () Bool)

(assert (=> b!269156 m!400715))

(assert (=> b!269122 d!91060))

(declare-fun d!91076 () Bool)

(assert (=> d!91076 (= (array_inv!6264 (buf!7008 w3!25)) (bvsge (size!6540 (buf!7008 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!269119 d!91076))

(declare-fun d!91078 () Bool)

(declare-fun res!224396 () Bool)

(declare-fun e!189120 () Bool)

(assert (=> d!91078 (=> (not res!224396) (not e!189120))))

(assert (=> d!91078 (= res!224396 (= (size!6540 (buf!7008 w1!591)) (size!6540 (buf!7008 w2!587))))))

(assert (=> d!91078 (= (isPrefixOf!0 w1!591 w2!587) e!189120)))

(declare-fun b!269157 () Bool)

(declare-fun res!224398 () Bool)

(assert (=> b!269157 (=> (not res!224398) (not e!189120))))

(assert (=> b!269157 (= res!224398 (bvsle (bitIndex!0 (size!6540 (buf!7008 w1!591)) (currentByte!12944 w1!591) (currentBit!12939 w1!591)) (bitIndex!0 (size!6540 (buf!7008 w2!587)) (currentByte!12944 w2!587) (currentBit!12939 w2!587))))))

(declare-fun b!269158 () Bool)

(declare-fun e!189119 () Bool)

(assert (=> b!269158 (= e!189120 e!189119)))

(declare-fun res!224397 () Bool)

(assert (=> b!269158 (=> res!224397 e!189119)))

(assert (=> b!269158 (= res!224397 (= (size!6540 (buf!7008 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!269159 () Bool)

(assert (=> b!269159 (= e!189119 (arrayBitRangesEq!0 (buf!7008 w1!591) (buf!7008 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6540 (buf!7008 w1!591)) (currentByte!12944 w1!591) (currentBit!12939 w1!591))))))

(assert (= (and d!91078 res!224396) b!269157))

(assert (= (and b!269157 res!224398) b!269158))

(assert (= (and b!269158 (not res!224397)) b!269159))

(declare-fun m!400717 () Bool)

(assert (=> b!269157 m!400717))

(assert (=> b!269157 m!400711))

(assert (=> b!269159 m!400717))

(assert (=> b!269159 m!400717))

(declare-fun m!400719 () Bool)

(assert (=> b!269159 m!400719))

(assert (=> start!58612 d!91078))

(declare-fun d!91080 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!91080 (= (inv!12 w1!591) (invariant!0 (currentBit!12939 w1!591) (currentByte!12944 w1!591) (size!6540 (buf!7008 w1!591))))))

(declare-fun bs!23088 () Bool)

(assert (= bs!23088 d!91080))

(declare-fun m!400721 () Bool)

(assert (=> bs!23088 m!400721))

(assert (=> start!58612 d!91080))

(declare-fun d!91082 () Bool)

(assert (=> d!91082 (= (inv!12 w2!587) (invariant!0 (currentBit!12939 w2!587) (currentByte!12944 w2!587) (size!6540 (buf!7008 w2!587))))))

(declare-fun bs!23089 () Bool)

(assert (= bs!23089 d!91082))

(declare-fun m!400723 () Bool)

(assert (=> bs!23089 m!400723))

(assert (=> start!58612 d!91082))

(declare-fun d!91084 () Bool)

(assert (=> d!91084 (= (inv!12 w3!25) (invariant!0 (currentBit!12939 w3!25) (currentByte!12944 w3!25) (size!6540 (buf!7008 w3!25))))))

(declare-fun bs!23090 () Bool)

(assert (= bs!23090 d!91084))

(declare-fun m!400725 () Bool)

(assert (=> bs!23090 m!400725))

(assert (=> start!58612 d!91084))

(declare-fun d!91086 () Bool)

(assert (=> d!91086 (= (array_inv!6264 (buf!7008 w1!591)) (bvsge (size!6540 (buf!7008 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!269120 d!91086))

(push 1)

