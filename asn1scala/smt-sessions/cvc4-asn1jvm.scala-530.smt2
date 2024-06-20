; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15472 () Bool)

(assert start!15472)

(declare-fun b!78554 () Bool)

(declare-fun e!51554 () Bool)

(declare-fun e!51551 () Bool)

(assert (=> b!78554 (= e!51554 e!51551)))

(declare-fun res!64949 () Bool)

(assert (=> b!78554 (=> (not res!64949) (not e!51551))))

(declare-datatypes ((array!3347 0))(
  ( (array!3348 (arr!2150 (Array (_ BitVec 32) (_ BitVec 8))) (size!1549 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2660 0))(
  ( (BitStream!2661 (buf!1939 array!3347) (currentByte!3786 (_ BitVec 32)) (currentBit!3781 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5183 0))(
  ( (Unit!5184) )
))
(declare-datatypes ((tuple2!7000 0))(
  ( (tuple2!7001 (_1!3637 Unit!5183) (_2!3637 BitStream!2660)) )
))
(declare-fun lt!125459 () tuple2!7000)

(declare-fun lt!125457 () Bool)

(declare-datatypes ((tuple2!7002 0))(
  ( (tuple2!7003 (_1!3638 BitStream!2660) (_2!3638 Bool)) )
))
(declare-fun lt!125460 () tuple2!7002)

(assert (=> b!78554 (= res!64949 (and (= (_2!3638 lt!125460) lt!125457) (= (_1!3638 lt!125460) (_2!3637 lt!125459))))))

(declare-fun thiss!1107 () BitStream!2660)

(declare-fun readBitPure!0 (BitStream!2660) tuple2!7002)

(declare-fun readerFrom!0 (BitStream!2660 (_ BitVec 32) (_ BitVec 32)) BitStream!2660)

(assert (=> b!78554 (= lt!125460 (readBitPure!0 (readerFrom!0 (_2!3637 lt!125459) (currentBit!3781 thiss!1107) (currentByte!3786 thiss!1107))))))

(declare-fun b!78555 () Bool)

(declare-fun res!64950 () Bool)

(assert (=> b!78555 (=> (not res!64950) (not e!51554))))

(declare-fun isPrefixOf!0 (BitStream!2660 BitStream!2660) Bool)

(assert (=> b!78555 (= res!64950 (isPrefixOf!0 thiss!1107 (_2!3637 lt!125459)))))

(declare-fun b!78556 () Bool)

(declare-fun res!64953 () Bool)

(declare-fun e!51553 () Bool)

(assert (=> b!78556 (=> res!64953 e!51553)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!78556 (= res!64953 (not (invariant!0 (currentBit!3781 (_2!3637 lt!125459)) (currentByte!3786 (_2!3637 lt!125459)) (size!1549 (buf!1939 (_2!3637 lt!125459))))))))

(declare-fun b!78557 () Bool)

(declare-fun res!64952 () Bool)

(assert (=> b!78557 (=> res!64952 e!51553)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!78557 (= res!64952 (not (= (bitIndex!0 (size!1549 (buf!1939 (_2!3637 lt!125459))) (currentByte!3786 (_2!3637 lt!125459)) (currentBit!3781 (_2!3637 lt!125459))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1549 (buf!1939 thiss!1107)) (currentByte!3786 thiss!1107) (currentBit!3781 thiss!1107))))))))

(declare-fun b!78558 () Bool)

(assert (=> b!78558 (= e!51553 (invariant!0 (currentBit!3781 thiss!1107) (currentByte!3786 thiss!1107) (size!1549 (buf!1939 (_2!3637 lt!125459)))))))

(declare-fun b!78559 () Bool)

(declare-fun e!51550 () Bool)

(declare-fun array_inv!1395 (array!3347) Bool)

(assert (=> b!78559 (= e!51550 (array_inv!1395 (buf!1939 thiss!1107)))))

(declare-fun b!78560 () Bool)

(declare-fun lt!125458 () (_ BitVec 64))

(assert (=> b!78560 (= e!51551 (= (bitIndex!0 (size!1549 (buf!1939 (_1!3638 lt!125460))) (currentByte!3786 (_1!3638 lt!125460)) (currentBit!3781 (_1!3638 lt!125460))) lt!125458))))

(declare-fun b!78561 () Bool)

(declare-fun e!51555 () Bool)

(assert (=> b!78561 (= e!51555 (not e!51553))))

(declare-fun res!64948 () Bool)

(assert (=> b!78561 (=> res!64948 e!51553)))

(assert (=> b!78561 (= res!64948 (not (= (size!1549 (buf!1939 (_2!3637 lt!125459))) (size!1549 (buf!1939 thiss!1107)))))))

(declare-fun e!51552 () Bool)

(assert (=> b!78561 e!51552))

(declare-fun res!64947 () Bool)

(assert (=> b!78561 (=> (not res!64947) (not e!51552))))

(assert (=> b!78561 (= res!64947 (= (size!1549 (buf!1939 thiss!1107)) (size!1549 (buf!1939 (_2!3637 lt!125459)))))))

(declare-fun appendBit!0 (BitStream!2660 Bool) tuple2!7000)

(assert (=> b!78561 (= lt!125459 (appendBit!0 thiss!1107 lt!125457))))

(declare-fun b!215 () (_ BitVec 8))

(declare-fun bitNr!1 () (_ BitVec 32))

(assert (=> b!78561 (= lt!125457 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) b!215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) bitNr!1))) #b00000000000000000000000000000000)))))

(declare-fun b!78562 () Bool)

(declare-fun res!64951 () Bool)

(assert (=> b!78562 (=> res!64951 e!51553)))

(assert (=> b!78562 (= res!64951 (not (isPrefixOf!0 thiss!1107 (_2!3637 lt!125459))))))

(declare-fun res!64954 () Bool)

(assert (=> start!15472 (=> (not res!64954) (not e!51555))))

(assert (=> start!15472 (= res!64954 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000)))))

(assert (=> start!15472 e!51555))

(assert (=> start!15472 true))

(declare-fun inv!12 (BitStream!2660) Bool)

(assert (=> start!15472 (and (inv!12 thiss!1107) e!51550)))

(declare-fun b!78563 () Bool)

(assert (=> b!78563 (= e!51552 e!51554)))

(declare-fun res!64946 () Bool)

(assert (=> b!78563 (=> (not res!64946) (not e!51554))))

(declare-fun lt!125456 () (_ BitVec 64))

(assert (=> b!78563 (= res!64946 (= lt!125458 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!125456)))))

(assert (=> b!78563 (= lt!125458 (bitIndex!0 (size!1549 (buf!1939 (_2!3637 lt!125459))) (currentByte!3786 (_2!3637 lt!125459)) (currentBit!3781 (_2!3637 lt!125459))))))

(assert (=> b!78563 (= lt!125456 (bitIndex!0 (size!1549 (buf!1939 thiss!1107)) (currentByte!3786 thiss!1107) (currentBit!3781 thiss!1107)))))

(declare-fun b!78564 () Bool)

(declare-fun res!64945 () Bool)

(assert (=> b!78564 (=> (not res!64945) (not e!51555))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!78564 (= res!64945 (validate_offset_bit!0 ((_ sign_extend 32) (size!1549 (buf!1939 thiss!1107))) ((_ sign_extend 32) (currentByte!3786 thiss!1107)) ((_ sign_extend 32) (currentBit!3781 thiss!1107))))))

(assert (= (and start!15472 res!64954) b!78564))

(assert (= (and b!78564 res!64945) b!78561))

(assert (= (and b!78561 res!64947) b!78563))

(assert (= (and b!78563 res!64946) b!78555))

(assert (= (and b!78555 res!64950) b!78554))

(assert (= (and b!78554 res!64949) b!78560))

(assert (= (and b!78561 (not res!64948)) b!78557))

(assert (= (and b!78557 (not res!64952)) b!78562))

(assert (= (and b!78562 (not res!64951)) b!78556))

(assert (= (and b!78556 (not res!64953)) b!78558))

(assert (= start!15472 b!78559))

(declare-fun m!124075 () Bool)

(assert (=> b!78563 m!124075))

(declare-fun m!124077 () Bool)

(assert (=> b!78563 m!124077))

(declare-fun m!124079 () Bool)

(assert (=> b!78561 m!124079))

(declare-fun m!124081 () Bool)

(assert (=> b!78561 m!124081))

(declare-fun m!124083 () Bool)

(assert (=> b!78558 m!124083))

(declare-fun m!124085 () Bool)

(assert (=> b!78564 m!124085))

(declare-fun m!124087 () Bool)

(assert (=> b!78559 m!124087))

(assert (=> b!78557 m!124075))

(assert (=> b!78557 m!124077))

(declare-fun m!124089 () Bool)

(assert (=> start!15472 m!124089))

(declare-fun m!124091 () Bool)

(assert (=> b!78562 m!124091))

(declare-fun m!124093 () Bool)

(assert (=> b!78556 m!124093))

(declare-fun m!124095 () Bool)

(assert (=> b!78560 m!124095))

(assert (=> b!78555 m!124091))

(declare-fun m!124097 () Bool)

(assert (=> b!78554 m!124097))

(assert (=> b!78554 m!124097))

(declare-fun m!124099 () Bool)

(assert (=> b!78554 m!124099))

(push 1)

(assert (not b!78561))

(assert (not b!78563))

(assert (not b!78562))

(assert (not b!78558))

(assert (not b!78554))

(assert (not start!15472))

(assert (not b!78560))

(assert (not b!78556))

(assert (not b!78557))

(assert (not b!78555))

(assert (not b!78559))

(assert (not b!78564))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!24814 () Bool)

(declare-fun e!51581 () Bool)

(assert (=> d!24814 e!51581))

(declare-fun res!64998 () Bool)

(assert (=> d!24814 (=> (not res!64998) (not e!51581))))

(declare-fun lt!125522 () (_ BitVec 64))

(declare-fun lt!125523 () (_ BitVec 64))

(declare-fun lt!125524 () (_ BitVec 64))

(assert (=> d!24814 (= res!64998 (= lt!125522 (bvsub lt!125524 lt!125523)))))

(assert (=> d!24814 (or (= (bvand lt!125524 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125523 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125524 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125524 lt!125523) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24814 (= lt!125523 (remainingBits!0 ((_ sign_extend 32) (size!1549 (buf!1939 (_1!3638 lt!125460)))) ((_ sign_extend 32) (currentByte!3786 (_1!3638 lt!125460))) ((_ sign_extend 32) (currentBit!3781 (_1!3638 lt!125460)))))))

(declare-fun lt!125526 () (_ BitVec 64))

(declare-fun lt!125521 () (_ BitVec 64))

(assert (=> d!24814 (= lt!125524 (bvmul lt!125526 lt!125521))))

(assert (=> d!24814 (or (= lt!125526 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125521 (bvsdiv (bvmul lt!125526 lt!125521) lt!125526)))))

(assert (=> d!24814 (= lt!125521 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24814 (= lt!125526 ((_ sign_extend 32) (size!1549 (buf!1939 (_1!3638 lt!125460)))))))

(assert (=> d!24814 (= lt!125522 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3786 (_1!3638 lt!125460))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3781 (_1!3638 lt!125460)))))))

(assert (=> d!24814 (invariant!0 (currentBit!3781 (_1!3638 lt!125460)) (currentByte!3786 (_1!3638 lt!125460)) (size!1549 (buf!1939 (_1!3638 lt!125460))))))

(assert (=> d!24814 (= (bitIndex!0 (size!1549 (buf!1939 (_1!3638 lt!125460))) (currentByte!3786 (_1!3638 lt!125460)) (currentBit!3781 (_1!3638 lt!125460))) lt!125522)))

(declare-fun b!78607 () Bool)

(declare-fun res!64999 () Bool)

(assert (=> b!78607 (=> (not res!64999) (not e!51581))))

(assert (=> b!78607 (= res!64999 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125522))))

(declare-fun b!78608 () Bool)

(declare-fun lt!125525 () (_ BitVec 64))

(assert (=> b!78608 (= e!51581 (bvsle lt!125522 (bvmul lt!125525 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78608 (or (= lt!125525 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125525 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125525)))))

(assert (=> b!78608 (= lt!125525 ((_ sign_extend 32) (size!1549 (buf!1939 (_1!3638 lt!125460)))))))

(assert (= (and d!24814 res!64998) b!78607))

(assert (= (and b!78607 res!64999) b!78608))

(declare-fun m!124131 () Bool)

(assert (=> d!24814 m!124131))

(declare-fun m!124133 () Bool)

(assert (=> d!24814 m!124133))

(assert (=> b!78560 d!24814))

(declare-fun d!24820 () Bool)

(assert (=> d!24820 (= (array_inv!1395 (buf!1939 thiss!1107)) (bvsge (size!1549 (buf!1939 thiss!1107)) #b00000000000000000000000000000000))))

(assert (=> b!78559 d!24820))

(declare-fun d!24822 () Bool)

(assert (=> d!24822 (= (invariant!0 (currentBit!3781 thiss!1107) (currentByte!3786 thiss!1107) (size!1549 (buf!1939 (_2!3637 lt!125459)))) (and (bvsge (currentBit!3781 thiss!1107) #b00000000000000000000000000000000) (bvslt (currentBit!3781 thiss!1107) #b00000000000000000000000000001000) (bvsge (currentByte!3786 thiss!1107) #b00000000000000000000000000000000) (or (bvslt (currentByte!3786 thiss!1107) (size!1549 (buf!1939 (_2!3637 lt!125459)))) (and (= (currentBit!3781 thiss!1107) #b00000000000000000000000000000000) (= (currentByte!3786 thiss!1107) (size!1549 (buf!1939 (_2!3637 lt!125459))))))))))

(assert (=> b!78558 d!24822))

(declare-fun d!24826 () Bool)

(declare-fun e!51584 () Bool)

(assert (=> d!24826 e!51584))

(declare-fun res!65004 () Bool)

(assert (=> d!24826 (=> (not res!65004) (not e!51584))))

(declare-fun lt!125540 () (_ BitVec 64))

(declare-fun lt!125542 () (_ BitVec 64))

(declare-fun lt!125541 () (_ BitVec 64))

(assert (=> d!24826 (= res!65004 (= lt!125540 (bvsub lt!125542 lt!125541)))))

(assert (=> d!24826 (or (= (bvand lt!125542 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125541 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125542 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125542 lt!125541) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24826 (= lt!125541 (remainingBits!0 ((_ sign_extend 32) (size!1549 (buf!1939 (_2!3637 lt!125459)))) ((_ sign_extend 32) (currentByte!3786 (_2!3637 lt!125459))) ((_ sign_extend 32) (currentBit!3781 (_2!3637 lt!125459)))))))

(declare-fun lt!125544 () (_ BitVec 64))

(declare-fun lt!125539 () (_ BitVec 64))

(assert (=> d!24826 (= lt!125542 (bvmul lt!125544 lt!125539))))

(assert (=> d!24826 (or (= lt!125544 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125539 (bvsdiv (bvmul lt!125544 lt!125539) lt!125544)))))

(assert (=> d!24826 (= lt!125539 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24826 (= lt!125544 ((_ sign_extend 32) (size!1549 (buf!1939 (_2!3637 lt!125459)))))))

(assert (=> d!24826 (= lt!125540 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3786 (_2!3637 lt!125459))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3781 (_2!3637 lt!125459)))))))

(assert (=> d!24826 (invariant!0 (currentBit!3781 (_2!3637 lt!125459)) (currentByte!3786 (_2!3637 lt!125459)) (size!1549 (buf!1939 (_2!3637 lt!125459))))))

(assert (=> d!24826 (= (bitIndex!0 (size!1549 (buf!1939 (_2!3637 lt!125459))) (currentByte!3786 (_2!3637 lt!125459)) (currentBit!3781 (_2!3637 lt!125459))) lt!125540)))

(declare-fun b!78613 () Bool)

(declare-fun res!65005 () Bool)

(assert (=> b!78613 (=> (not res!65005) (not e!51584))))

(assert (=> b!78613 (= res!65005 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125540))))

(declare-fun b!78614 () Bool)

(declare-fun lt!125543 () (_ BitVec 64))

(assert (=> b!78614 (= e!51584 (bvsle lt!125540 (bvmul lt!125543 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78614 (or (= lt!125543 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125543 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125543)))))

(assert (=> b!78614 (= lt!125543 ((_ sign_extend 32) (size!1549 (buf!1939 (_2!3637 lt!125459)))))))

(assert (= (and d!24826 res!65004) b!78613))

(assert (= (and b!78613 res!65005) b!78614))

(declare-fun m!124135 () Bool)

(assert (=> d!24826 m!124135))

(assert (=> d!24826 m!124093))

(assert (=> b!78563 d!24826))

(declare-fun d!24828 () Bool)

(declare-fun e!51586 () Bool)

(assert (=> d!24828 e!51586))

(declare-fun res!65008 () Bool)

(assert (=> d!24828 (=> (not res!65008) (not e!51586))))

(declare-fun lt!125554 () (_ BitVec 64))

(declare-fun lt!125553 () (_ BitVec 64))

(declare-fun lt!125552 () (_ BitVec 64))

(assert (=> d!24828 (= res!65008 (= lt!125552 (bvsub lt!125554 lt!125553)))))

(assert (=> d!24828 (or (= (bvand lt!125554 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125553 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125554 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125554 lt!125553) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24828 (= lt!125553 (remainingBits!0 ((_ sign_extend 32) (size!1549 (buf!1939 thiss!1107))) ((_ sign_extend 32) (currentByte!3786 thiss!1107)) ((_ sign_extend 32) (currentBit!3781 thiss!1107))))))

(declare-fun lt!125556 () (_ BitVec 64))

(declare-fun lt!125551 () (_ BitVec 64))

(assert (=> d!24828 (= lt!125554 (bvmul lt!125556 lt!125551))))

(assert (=> d!24828 (or (= lt!125556 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125551 (bvsdiv (bvmul lt!125556 lt!125551) lt!125556)))))

(assert (=> d!24828 (= lt!125551 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24828 (= lt!125556 ((_ sign_extend 32) (size!1549 (buf!1939 thiss!1107))))))

(assert (=> d!24828 (= lt!125552 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3786 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3781 thiss!1107))))))

(assert (=> d!24828 (invariant!0 (currentBit!3781 thiss!1107) (currentByte!3786 thiss!1107) (size!1549 (buf!1939 thiss!1107)))))

(assert (=> d!24828 (= (bitIndex!0 (size!1549 (buf!1939 thiss!1107)) (currentByte!3786 thiss!1107) (currentBit!3781 thiss!1107)) lt!125552)))

(declare-fun b!78617 () Bool)

(declare-fun res!65009 () Bool)

(assert (=> b!78617 (=> (not res!65009) (not e!51586))))

(assert (=> b!78617 (= res!65009 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125552))))

(declare-fun b!78618 () Bool)

(declare-fun lt!125555 () (_ BitVec 64))

(assert (=> b!78618 (= e!51586 (bvsle lt!125552 (bvmul lt!125555 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78618 (or (= lt!125555 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125555 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125555)))))

(assert (=> b!78618 (= lt!125555 ((_ sign_extend 32) (size!1549 (buf!1939 thiss!1107))))))

(assert (= (and d!24828 res!65008) b!78617))

(assert (= (and b!78617 res!65009) b!78618))

(declare-fun m!124139 () Bool)

(assert (=> d!24828 m!124139))

(declare-fun m!124141 () Bool)

(assert (=> d!24828 m!124141))

(assert (=> b!78563 d!24828))

(declare-fun d!24832 () Bool)

(declare-fun res!65031 () Bool)

(declare-fun e!51600 () Bool)

(assert (=> d!24832 (=> (not res!65031) (not e!51600))))

(assert (=> d!24832 (= res!65031 (= (size!1549 (buf!1939 thiss!1107)) (size!1549 (buf!1939 (_2!3637 lt!125459)))))))

(assert (=> d!24832 (= (isPrefixOf!0 thiss!1107 (_2!3637 lt!125459)) e!51600)))

(declare-fun b!78638 () Bool)

(declare-fun res!65030 () Bool)

(assert (=> b!78638 (=> (not res!65030) (not e!51600))))

(assert (=> b!78638 (= res!65030 (bvsle (bitIndex!0 (size!1549 (buf!1939 thiss!1107)) (currentByte!3786 thiss!1107) (currentBit!3781 thiss!1107)) (bitIndex!0 (size!1549 (buf!1939 (_2!3637 lt!125459))) (currentByte!3786 (_2!3637 lt!125459)) (currentBit!3781 (_2!3637 lt!125459)))))))

(declare-fun b!78639 () Bool)

(declare-fun e!51599 () Bool)

(assert (=> b!78639 (= e!51600 e!51599)))

(declare-fun res!65029 () Bool)

(assert (=> b!78639 (=> res!65029 e!51599)))

(assert (=> b!78639 (= res!65029 (= (size!1549 (buf!1939 thiss!1107)) #b00000000000000000000000000000000))))

(declare-fun b!78640 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3347 array!3347 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!78640 (= e!51599 (arrayBitRangesEq!0 (buf!1939 thiss!1107) (buf!1939 (_2!3637 lt!125459)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1549 (buf!1939 thiss!1107)) (currentByte!3786 thiss!1107) (currentBit!3781 thiss!1107))))))

(assert (= (and d!24832 res!65031) b!78638))

(assert (= (and b!78638 res!65030) b!78639))

(assert (= (and b!78639 (not res!65029)) b!78640))

(assert (=> b!78638 m!124077))

(assert (=> b!78638 m!124075))

(assert (=> b!78640 m!124077))

(assert (=> b!78640 m!124077))

(declare-fun m!124151 () Bool)

(assert (=> b!78640 m!124151))

(assert (=> b!78562 d!24832))

(declare-fun b!78665 () Bool)

(declare-fun e!51611 () Bool)

(declare-fun e!51612 () Bool)

(assert (=> b!78665 (= e!51611 e!51612)))

(declare-fun res!65055 () Bool)

(assert (=> b!78665 (=> (not res!65055) (not e!51612))))

(declare-fun lt!125591 () tuple2!7002)

(declare-fun lt!125589 () tuple2!7000)

(assert (=> b!78665 (= res!65055 (and (= (_2!3638 lt!125591) lt!125457) (= (_1!3638 lt!125591) (_2!3637 lt!125589))))))

(assert (=> b!78665 (= lt!125591 (readBitPure!0 (readerFrom!0 (_2!3637 lt!125589) (currentBit!3781 thiss!1107) (currentByte!3786 thiss!1107))))))

(declare-fun d!24844 () Bool)

(assert (=> d!24844 e!51611))

(declare-fun res!65053 () Bool)

(assert (=> d!24844 (=> (not res!65053) (not e!51611))))

(assert (=> d!24844 (= res!65053 (= (size!1549 (buf!1939 thiss!1107)) (size!1549 (buf!1939 (_2!3637 lt!125589)))))))

(declare-fun choose!16 (BitStream!2660 Bool) tuple2!7000)

(assert (=> d!24844 (= lt!125589 (choose!16 thiss!1107 lt!125457))))

(assert (=> d!24844 (validate_offset_bit!0 ((_ sign_extend 32) (size!1549 (buf!1939 thiss!1107))) ((_ sign_extend 32) (currentByte!3786 thiss!1107)) ((_ sign_extend 32) (currentBit!3781 thiss!1107)))))

(assert (=> d!24844 (= (appendBit!0 thiss!1107 lt!125457) lt!125589)))

(declare-fun b!78666 () Bool)

(assert (=> b!78666 (= e!51612 (= (bitIndex!0 (size!1549 (buf!1939 (_1!3638 lt!125591))) (currentByte!3786 (_1!3638 lt!125591)) (currentBit!3781 (_1!3638 lt!125591))) (bitIndex!0 (size!1549 (buf!1939 (_2!3637 lt!125589))) (currentByte!3786 (_2!3637 lt!125589)) (currentBit!3781 (_2!3637 lt!125589)))))))

(declare-fun b!78663 () Bool)

(declare-fun res!65054 () Bool)

(assert (=> b!78663 (=> (not res!65054) (not e!51611))))

(declare-fun lt!125590 () (_ BitVec 64))

(declare-fun lt!125592 () (_ BitVec 64))

(assert (=> b!78663 (= res!65054 (= (bitIndex!0 (size!1549 (buf!1939 (_2!3637 lt!125589))) (currentByte!3786 (_2!3637 lt!125589)) (currentBit!3781 (_2!3637 lt!125589))) (bvadd lt!125592 lt!125590)))))

(assert (=> b!78663 (or (not (= (bvand lt!125592 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125590 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!125592 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!125592 lt!125590) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!78663 (= lt!125590 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!78663 (= lt!125592 (bitIndex!0 (size!1549 (buf!1939 thiss!1107)) (currentByte!3786 thiss!1107) (currentBit!3781 thiss!1107)))))

(declare-fun b!78664 () Bool)

(declare-fun res!65052 () Bool)

(assert (=> b!78664 (=> (not res!65052) (not e!51611))))

(assert (=> b!78664 (= res!65052 (isPrefixOf!0 thiss!1107 (_2!3637 lt!125589)))))

(assert (= (and d!24844 res!65053) b!78663))

(assert (= (and b!78663 res!65054) b!78664))

(assert (= (and b!78664 res!65052) b!78665))

(assert (= (and b!78665 res!65055) b!78666))

(declare-fun m!124165 () Bool)

(assert (=> b!78666 m!124165))

(declare-fun m!124167 () Bool)

(assert (=> b!78666 m!124167))

(declare-fun m!124169 () Bool)

(assert (=> b!78665 m!124169))

(assert (=> b!78665 m!124169))

(declare-fun m!124171 () Bool)

(assert (=> b!78665 m!124171))

(declare-fun m!124173 () Bool)

(assert (=> b!78664 m!124173))

(assert (=> b!78663 m!124167))

(assert (=> b!78663 m!124077))

(declare-fun m!124175 () Bool)

(assert (=> d!24844 m!124175))

(assert (=> d!24844 m!124085))

(assert (=> b!78561 d!24844))

(declare-fun d!24846 () Bool)

(assert (=> d!24846 (= (inv!12 thiss!1107) (invariant!0 (currentBit!3781 thiss!1107) (currentByte!3786 thiss!1107) (size!1549 (buf!1939 thiss!1107))))))

(declare-fun bs!6018 () Bool)

(assert (= bs!6018 d!24846))

(assert (=> bs!6018 m!124141))

(assert (=> start!15472 d!24846))

(assert (=> b!78555 d!24832))

(declare-fun d!24848 () Bool)

(declare-datatypes ((tuple2!7008 0))(
  ( (tuple2!7009 (_1!3641 Bool) (_2!3641 BitStream!2660)) )
))
(declare-fun lt!125595 () tuple2!7008)

(declare-fun readBit!0 (BitStream!2660) tuple2!7008)

(assert (=> d!24848 (= lt!125595 (readBit!0 (readerFrom!0 (_2!3637 lt!125459) (currentBit!3781 thiss!1107) (currentByte!3786 thiss!1107))))))

(assert (=> d!24848 (= (readBitPure!0 (readerFrom!0 (_2!3637 lt!125459) (currentBit!3781 thiss!1107) (currentByte!3786 thiss!1107))) (tuple2!7003 (_2!3641 lt!125595) (_1!3641 lt!125595)))))

(declare-fun bs!6019 () Bool)

(assert (= bs!6019 d!24848))

(assert (=> bs!6019 m!124097))

(declare-fun m!124177 () Bool)

(assert (=> bs!6019 m!124177))

(assert (=> b!78554 d!24848))

(declare-fun d!24850 () Bool)

(declare-fun e!51615 () Bool)

(assert (=> d!24850 e!51615))

(declare-fun res!65059 () Bool)

(assert (=> d!24850 (=> (not res!65059) (not e!51615))))

(assert (=> d!24850 (= res!65059 (invariant!0 (currentBit!3781 (_2!3637 lt!125459)) (currentByte!3786 (_2!3637 lt!125459)) (size!1549 (buf!1939 (_2!3637 lt!125459)))))))

(assert (=> d!24850 (= (readerFrom!0 (_2!3637 lt!125459) (currentBit!3781 thiss!1107) (currentByte!3786 thiss!1107)) (BitStream!2661 (buf!1939 (_2!3637 lt!125459)) (currentByte!3786 thiss!1107) (currentBit!3781 thiss!1107)))))

(declare-fun b!78669 () Bool)

(assert (=> b!78669 (= e!51615 (invariant!0 (currentBit!3781 thiss!1107) (currentByte!3786 thiss!1107) (size!1549 (buf!1939 (_2!3637 lt!125459)))))))

(assert (= (and d!24850 res!65059) b!78669))

(assert (=> d!24850 m!124093))

(assert (=> b!78669 m!124083))

(assert (=> b!78554 d!24850))

(declare-fun d!24852 () Bool)

(assert (=> d!24852 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!1549 (buf!1939 thiss!1107))) ((_ sign_extend 32) (currentByte!3786 thiss!1107)) ((_ sign_extend 32) (currentBit!3781 thiss!1107))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1549 (buf!1939 thiss!1107))) ((_ sign_extend 32) (currentByte!3786 thiss!1107)) ((_ sign_extend 32) (currentBit!3781 thiss!1107))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!6020 () Bool)

(assert (= bs!6020 d!24852))

(assert (=> bs!6020 m!124139))

(assert (=> b!78564 d!24852))

(assert (=> b!78557 d!24826))

(assert (=> b!78557 d!24828))

(declare-fun d!24854 () Bool)

