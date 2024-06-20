; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30896 () Bool)

(assert start!30896)

(declare-fun b!156343 () Bool)

(declare-fun e!105604 () Bool)

(declare-datatypes ((array!7162 0))(
  ( (array!7163 (arr!4069 (Array (_ BitVec 32) (_ BitVec 8))) (size!3213 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5684 0))(
  ( (BitStream!5685 (buf!3716 array!7162) (currentByte!6825 (_ BitVec 32)) (currentBit!6820 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5684)

(declare-fun array_inv!3002 (array!7162) Bool)

(assert (=> b!156343 (= e!105604 (array_inv!3002 (buf!3716 bs!65)))))

(declare-fun b!156340 () Bool)

(declare-fun res!130675 () Bool)

(declare-fun e!105602 () Bool)

(assert (=> b!156340 (=> (not res!130675) (not e!105602))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156340 (= res!130675 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3213 (buf!3716 bs!65))) ((_ sign_extend 32) (currentByte!6825 bs!65)) ((_ sign_extend 32) (currentBit!6820 bs!65)) (bvsub to!236 from!240)))))

(declare-fun res!130674 () Bool)

(assert (=> start!30896 (=> (not res!130674) (not e!105602))))

(declare-fun arr!153 () array!7162)

(assert (=> start!30896 (= res!130674 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3213 arr!153))))))

(assert (=> start!30896 e!105602))

(assert (=> start!30896 true))

(assert (=> start!30896 (array_inv!3002 arr!153)))

(declare-fun inv!12 (BitStream!5684) Bool)

(assert (=> start!30896 (and (inv!12 bs!65) e!105604)))

(declare-fun b!156342 () Bool)

(declare-fun e!105601 () Bool)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!156342 (= e!105601 (not (validate_offset_byte!0 ((_ sign_extend 32) (size!3213 (buf!3716 bs!65))) ((_ sign_extend 32) (currentByte!6825 bs!65)) ((_ sign_extend 32) (currentBit!6820 bs!65)))))))

(declare-fun b!156341 () Bool)

(assert (=> b!156341 (= e!105602 e!105601)))

(declare-fun res!130676 () Bool)

(assert (=> b!156341 (=> (not res!130676) (not e!105601))))

(assert (=> b!156341 (= res!130676 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!13962 0))(
  ( (tuple2!13963 (_1!7419 BitStream!5684) (_2!7419 array!7162)) )
))
(declare-fun lt!244552 () tuple2!13962)

(declare-fun readByteArrayLoopPure!0 (BitStream!5684 array!7162 (_ BitVec 32) (_ BitVec 32)) tuple2!13962)

(declare-fun withMovedByteIndex!0 (BitStream!5684 (_ BitVec 32)) BitStream!5684)

(declare-datatypes ((tuple2!13964 0))(
  ( (tuple2!13965 (_1!7420 BitStream!5684) (_2!7420 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5684) tuple2!13964)

(assert (=> b!156341 (= lt!244552 (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7163 (store (arr!4069 arr!153) from!240 (_2!7420 (readBytePure!0 bs!65))) (size!3213 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!244551 () tuple2!13962)

(assert (=> b!156341 (= lt!244551 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(assert (= (and start!30896 res!130674) b!156340))

(assert (= (and b!156340 res!130675) b!156341))

(assert (= (and b!156341 res!130676) b!156342))

(assert (= start!30896 b!156343))

(declare-fun m!243577 () Bool)

(assert (=> b!156343 m!243577))

(declare-fun m!243579 () Bool)

(assert (=> start!30896 m!243579))

(declare-fun m!243581 () Bool)

(assert (=> start!30896 m!243581))

(declare-fun m!243583 () Bool)

(assert (=> b!156342 m!243583))

(declare-fun m!243585 () Bool)

(assert (=> b!156341 m!243585))

(declare-fun m!243587 () Bool)

(assert (=> b!156341 m!243587))

(assert (=> b!156341 m!243587))

(declare-fun m!243589 () Bool)

(assert (=> b!156341 m!243589))

(declare-fun m!243591 () Bool)

(assert (=> b!156341 m!243591))

(declare-fun m!243593 () Bool)

(assert (=> b!156341 m!243593))

(declare-fun m!243595 () Bool)

(assert (=> b!156340 m!243595))

(push 1)

(assert (not b!156341))

(assert (not b!156342))

(assert (not b!156343))

(assert (not start!30896))

(assert (not b!156340))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!51976 () Bool)

(assert (=> d!51976 (= (array_inv!3002 arr!153) (bvsge (size!3213 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!30896 d!51976))

(declare-fun d!51978 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51978 (= (inv!12 bs!65) (invariant!0 (currentBit!6820 bs!65) (currentByte!6825 bs!65) (size!3213 (buf!3716 bs!65))))))

(declare-fun bs!12720 () Bool)

(assert (= bs!12720 d!51978))

(declare-fun m!243603 () Bool)

(assert (=> bs!12720 m!243603))

(assert (=> start!30896 d!51978))

(declare-fun d!51982 () Bool)

(assert (=> d!51982 (= (array_inv!3002 (buf!3716 bs!65)) (bvsge (size!3213 (buf!3716 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!156343 d!51982))

(declare-fun d!51984 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51984 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3213 (buf!3716 bs!65))) ((_ sign_extend 32) (currentByte!6825 bs!65)) ((_ sign_extend 32) (currentBit!6820 bs!65))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3213 (buf!3716 bs!65))) ((_ sign_extend 32) (currentByte!6825 bs!65)) ((_ sign_extend 32) (currentBit!6820 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!12722 () Bool)

(assert (= bs!12722 d!51984))

(declare-fun m!243607 () Bool)

(assert (=> bs!12722 m!243607))

(assert (=> b!156342 d!51984))

(declare-datatypes ((Unit!10077 0))(
  ( (Unit!10078) )
))
(declare-datatypes ((tuple3!644 0))(
  ( (tuple3!645 (_1!7424 Unit!10077) (_2!7424 BitStream!5684) (_3!439 array!7162)) )
))
(declare-fun lt!244562 () tuple3!644)

(declare-fun d!51988 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5684 array!7162 (_ BitVec 32) (_ BitVec 32)) tuple3!644)

(assert (=> d!51988 (= lt!244562 (readByteArrayLoop!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7163 (store (arr!4069 arr!153) from!240 (_2!7420 (readBytePure!0 bs!65))) (size!3213 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!51988 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7163 (store (arr!4069 arr!153) from!240 (_2!7420 (readBytePure!0 bs!65))) (size!3213 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!13963 (_2!7424 lt!244562) (_3!439 lt!244562)))))

(declare-fun bs!12726 () Bool)

(assert (= bs!12726 d!51988))

(assert (=> bs!12726 m!243587))

(declare-fun m!243613 () Bool)

(assert (=> bs!12726 m!243613))

(assert (=> b!156341 d!51988))

(declare-fun d!51996 () Bool)

(declare-datatypes ((tuple2!13970 0))(
  ( (tuple2!13971 (_1!7425 Unit!10077) (_2!7425 BitStream!5684)) )
))
(declare-fun moveByteIndex!0 (BitStream!5684 (_ BitVec 32)) tuple2!13970)

(assert (=> d!51996 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7425 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12727 () Bool)

(assert (= bs!12727 d!51996))

(declare-fun m!243615 () Bool)

(assert (=> bs!12727 m!243615))

(assert (=> b!156341 d!51996))

(declare-fun d!51998 () Bool)

(declare-datatypes ((tuple2!13972 0))(
  ( (tuple2!13973 (_1!7426 (_ BitVec 8)) (_2!7426 BitStream!5684)) )
))
(declare-fun lt!244565 () tuple2!13972)

(declare-fun readByte!0 (BitStream!5684) tuple2!13972)

(assert (=> d!51998 (= lt!244565 (readByte!0 bs!65))))

(assert (=> d!51998 (= (readBytePure!0 bs!65) (tuple2!13965 (_2!7426 lt!244565) (_1!7426 lt!244565)))))

(declare-fun bs!12728 () Bool)

(assert (= bs!12728 d!51998))

(declare-fun m!243617 () Bool)

(assert (=> bs!12728 m!243617))

(assert (=> b!156341 d!51998))

(declare-fun d!52000 () Bool)

(declare-fun lt!244566 () tuple3!644)

(assert (=> d!52000 (= lt!244566 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!52000 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!13963 (_2!7424 lt!244566) (_3!439 lt!244566)))))

(declare-fun bs!12729 () Bool)

(assert (= bs!12729 d!52000))

(declare-fun m!243619 () Bool)

(assert (=> bs!12729 m!243619))

(assert (=> b!156341 d!52000))

(declare-fun d!52002 () Bool)

(assert (=> d!52002 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3213 (buf!3716 bs!65))) ((_ sign_extend 32) (currentByte!6825 bs!65)) ((_ sign_extend 32) (currentBit!6820 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3213 (buf!3716 bs!65))) ((_ sign_extend 32) (currentByte!6825 bs!65)) ((_ sign_extend 32) (currentBit!6820 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12730 () Bool)

(assert (= bs!12730 d!52002))

(assert (=> bs!12730 m!243607))

(assert (=> b!156340 d!52002))

(push 1)

(assert (not d!51988))

(assert (not d!51978))

(assert (not d!51984))

(assert (not d!52002))

(assert (not d!51998))

(assert (not d!51996))

(assert (not d!52000))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

