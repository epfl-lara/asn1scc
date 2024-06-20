; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14660 () Bool)

(assert start!14660)

(declare-fun b!75543 () Bool)

(declare-fun res!62455 () Bool)

(declare-fun e!49403 () Bool)

(assert (=> b!75543 (=> res!62455 e!49403)))

(declare-datatypes ((array!3084 0))(
  ( (array!3085 (arr!2035 (Array (_ BitVec 32) (_ BitVec 8))) (size!1437 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2448 0))(
  ( (BitStream!2449 (buf!1818 array!3084) (currentByte!3600 (_ BitVec 32)) (currentBit!3595 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2448)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!75543 (= res!62455 (not (invariant!0 (currentBit!3595 thiss!1379) (currentByte!3600 thiss!1379) (size!1437 (buf!1818 thiss!1379)))))))

(declare-fun b!75544 () Bool)

(declare-fun res!62453 () Bool)

(declare-fun e!49406 () Bool)

(assert (=> b!75544 (=> (not res!62453) (not e!49406))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75544 (= res!62453 (validate_offset_bits!1 ((_ sign_extend 32) (size!1437 (buf!1818 thiss!1379))) ((_ sign_extend 32) (currentByte!3600 thiss!1379)) ((_ sign_extend 32) (currentBit!3595 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75545 () Bool)

(declare-fun e!49402 () Bool)

(assert (=> b!75545 (= e!49406 (not e!49402))))

(declare-fun res!62452 () Bool)

(assert (=> b!75545 (=> res!62452 e!49402)))

(assert (=> b!75545 (= res!62452 (bvslt i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2448 BitStream!2448) Bool)

(assert (=> b!75545 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4971 0))(
  ( (Unit!4972) )
))
(declare-fun lt!121536 () Unit!4971)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2448) Unit!4971)

(assert (=> b!75545 (= lt!121536 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!121533 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!75545 (= lt!121533 (bitIndex!0 (size!1437 (buf!1818 thiss!1379)) (currentByte!3600 thiss!1379) (currentBit!3595 thiss!1379)))))

(declare-fun res!62454 () Bool)

(assert (=> start!14660 (=> (not res!62454) (not e!49406))))

(declare-fun srcBuffer!2 () array!3084)

(assert (=> start!14660 (= res!62454 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1437 srcBuffer!2))))))))

(assert (=> start!14660 e!49406))

(assert (=> start!14660 true))

(declare-fun array_inv!1283 (array!3084) Bool)

(assert (=> start!14660 (array_inv!1283 srcBuffer!2)))

(declare-fun e!49401 () Bool)

(declare-fun inv!12 (BitStream!2448) Bool)

(assert (=> start!14660 (and (inv!12 thiss!1379) e!49401)))

(declare-fun lt!121534 () (_ BitVec 64))

(declare-fun lt!121535 () (_ BitVec 64))

(declare-fun e!49404 () Bool)

(declare-fun b!75546 () Bool)

(assert (=> b!75546 (= e!49404 (or (= lt!121534 (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!121534 (bvand lt!121535 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!121531 () (_ BitVec 64))

(assert (=> b!75546 (= lt!121534 (bvand lt!121531 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!6506 0))(
  ( (tuple2!6507 (_1!3381 array!3084) (_2!3381 BitStream!2448)) )
))
(declare-fun lt!121532 () tuple2!6506)

(declare-fun checkByteArrayBitContent!0 (BitStream!2448 array!3084 array!3084 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75546 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3381 lt!121532) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!75547 () Bool)

(assert (=> b!75547 (= e!49403 e!49404)))

(declare-fun res!62450 () Bool)

(assert (=> b!75547 (=> res!62450 e!49404)))

(assert (=> b!75547 (= res!62450 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!2448 (_ BitVec 64)) tuple2!6506)

(declare-datatypes ((tuple2!6508 0))(
  ( (tuple2!6509 (_1!3382 BitStream!2448) (_2!3382 BitStream!2448)) )
))
(declare-fun reader!0 (BitStream!2448 BitStream!2448) tuple2!6508)

(assert (=> b!75547 (= lt!121532 (readBits!0 (_1!3382 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75548 () Bool)

(assert (=> b!75548 (= e!49401 (array_inv!1283 (buf!1818 thiss!1379)))))

(declare-fun b!75549 () Bool)

(assert (=> b!75549 (= e!49402 e!49403)))

(declare-fun res!62451 () Bool)

(assert (=> b!75549 (=> res!62451 e!49403)))

(assert (=> b!75549 (= res!62451 (not (= lt!121533 lt!121535)))))

(assert (=> b!75549 (= lt!121535 (bvsub lt!121531 i!635))))

(assert (=> b!75549 (= lt!121531 (bvadd lt!121533 to!314))))

(assert (= (and start!14660 res!62454) b!75544))

(assert (= (and b!75544 res!62453) b!75545))

(assert (= (and b!75545 (not res!62452)) b!75549))

(assert (= (and b!75549 (not res!62451)) b!75543))

(assert (= (and b!75543 (not res!62455)) b!75547))

(assert (= (and b!75547 (not res!62450)) b!75546))

(assert (= start!14660 b!75548))

(declare-fun m!120633 () Bool)

(assert (=> start!14660 m!120633))

(declare-fun m!120635 () Bool)

(assert (=> start!14660 m!120635))

(declare-fun m!120637 () Bool)

(assert (=> b!75543 m!120637))

(declare-fun m!120639 () Bool)

(assert (=> b!75548 m!120639))

(declare-fun m!120641 () Bool)

(assert (=> b!75544 m!120641))

(declare-fun m!120643 () Bool)

(assert (=> b!75545 m!120643))

(declare-fun m!120645 () Bool)

(assert (=> b!75545 m!120645))

(declare-fun m!120647 () Bool)

(assert (=> b!75545 m!120647))

(declare-fun m!120649 () Bool)

(assert (=> b!75547 m!120649))

(declare-fun m!120651 () Bool)

(assert (=> b!75547 m!120651))

(declare-fun m!120653 () Bool)

(assert (=> b!75546 m!120653))

(check-sat (not b!75545) (not start!14660) (not b!75543) (not b!75544) (not b!75547) (not b!75546) (not b!75548))
(check-sat)
(get-model)

(declare-fun d!24020 () Bool)

(assert (=> d!24020 (= (array_inv!1283 srcBuffer!2) (bvsge (size!1437 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!14660 d!24020))

(declare-fun d!24022 () Bool)

(assert (=> d!24022 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3595 thiss!1379) (currentByte!3600 thiss!1379) (size!1437 (buf!1818 thiss!1379))))))

(declare-fun bs!5773 () Bool)

(assert (= bs!5773 d!24022))

(assert (=> bs!5773 m!120637))

(assert (=> start!14660 d!24022))

(declare-fun d!24024 () Bool)

(declare-fun res!62481 () Bool)

(declare-fun e!49434 () Bool)

(assert (=> d!24024 (=> (not res!62481) (not e!49434))))

(assert (=> d!24024 (= res!62481 (= (size!1437 (buf!1818 thiss!1379)) (size!1437 (buf!1818 thiss!1379))))))

(assert (=> d!24024 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!49434)))

(declare-fun b!75577 () Bool)

(declare-fun res!62482 () Bool)

(assert (=> b!75577 (=> (not res!62482) (not e!49434))))

(assert (=> b!75577 (= res!62482 (bvsle (bitIndex!0 (size!1437 (buf!1818 thiss!1379)) (currentByte!3600 thiss!1379) (currentBit!3595 thiss!1379)) (bitIndex!0 (size!1437 (buf!1818 thiss!1379)) (currentByte!3600 thiss!1379) (currentBit!3595 thiss!1379))))))

(declare-fun b!75578 () Bool)

(declare-fun e!49433 () Bool)

(assert (=> b!75578 (= e!49434 e!49433)))

(declare-fun res!62480 () Bool)

(assert (=> b!75578 (=> res!62480 e!49433)))

(assert (=> b!75578 (= res!62480 (= (size!1437 (buf!1818 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!75579 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3084 array!3084 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75579 (= e!49433 (arrayBitRangesEq!0 (buf!1818 thiss!1379) (buf!1818 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1437 (buf!1818 thiss!1379)) (currentByte!3600 thiss!1379) (currentBit!3595 thiss!1379))))))

(assert (= (and d!24024 res!62481) b!75577))

(assert (= (and b!75577 res!62482) b!75578))

(assert (= (and b!75578 (not res!62480)) b!75579))

(assert (=> b!75577 m!120647))

(assert (=> b!75577 m!120647))

(assert (=> b!75579 m!120647))

(assert (=> b!75579 m!120647))

(declare-fun m!120677 () Bool)

(assert (=> b!75579 m!120677))

(assert (=> b!75545 d!24024))

(declare-fun d!24026 () Bool)

(assert (=> d!24026 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!121557 () Unit!4971)

(declare-fun choose!11 (BitStream!2448) Unit!4971)

(assert (=> d!24026 (= lt!121557 (choose!11 thiss!1379))))

(assert (=> d!24026 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!121557)))

(declare-fun bs!5775 () Bool)

(assert (= bs!5775 d!24026))

(assert (=> bs!5775 m!120643))

(declare-fun m!120679 () Bool)

(assert (=> bs!5775 m!120679))

(assert (=> b!75545 d!24026))

(declare-fun d!24028 () Bool)

(declare-fun e!49437 () Bool)

(assert (=> d!24028 e!49437))

(declare-fun res!62487 () Bool)

(assert (=> d!24028 (=> (not res!62487) (not e!49437))))

(declare-fun lt!121571 () (_ BitVec 64))

(declare-fun lt!121570 () (_ BitVec 64))

(declare-fun lt!121572 () (_ BitVec 64))

(assert (=> d!24028 (= res!62487 (= lt!121572 (bvsub lt!121570 lt!121571)))))

(assert (=> d!24028 (or (= (bvand lt!121570 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!121571 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!121570 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!121570 lt!121571) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24028 (= lt!121571 (remainingBits!0 ((_ sign_extend 32) (size!1437 (buf!1818 thiss!1379))) ((_ sign_extend 32) (currentByte!3600 thiss!1379)) ((_ sign_extend 32) (currentBit!3595 thiss!1379))))))

(declare-fun lt!121575 () (_ BitVec 64))

(declare-fun lt!121573 () (_ BitVec 64))

(assert (=> d!24028 (= lt!121570 (bvmul lt!121575 lt!121573))))

(assert (=> d!24028 (or (= lt!121575 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!121573 (bvsdiv (bvmul lt!121575 lt!121573) lt!121575)))))

(assert (=> d!24028 (= lt!121573 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24028 (= lt!121575 ((_ sign_extend 32) (size!1437 (buf!1818 thiss!1379))))))

(assert (=> d!24028 (= lt!121572 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3600 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3595 thiss!1379))))))

(assert (=> d!24028 (invariant!0 (currentBit!3595 thiss!1379) (currentByte!3600 thiss!1379) (size!1437 (buf!1818 thiss!1379)))))

(assert (=> d!24028 (= (bitIndex!0 (size!1437 (buf!1818 thiss!1379)) (currentByte!3600 thiss!1379) (currentBit!3595 thiss!1379)) lt!121572)))

(declare-fun b!75584 () Bool)

(declare-fun res!62488 () Bool)

(assert (=> b!75584 (=> (not res!62488) (not e!49437))))

(assert (=> b!75584 (= res!62488 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!121572))))

(declare-fun b!75585 () Bool)

(declare-fun lt!121574 () (_ BitVec 64))

(assert (=> b!75585 (= e!49437 (bvsle lt!121572 (bvmul lt!121574 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!75585 (or (= lt!121574 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!121574 #b0000000000000000000000000000000000000000000000000000000000001000) lt!121574)))))

(assert (=> b!75585 (= lt!121574 ((_ sign_extend 32) (size!1437 (buf!1818 thiss!1379))))))

(assert (= (and d!24028 res!62487) b!75584))

(assert (= (and b!75584 res!62488) b!75585))

(declare-fun m!120681 () Bool)

(assert (=> d!24028 m!120681))

(assert (=> d!24028 m!120637))

(assert (=> b!75545 d!24028))

(declare-fun d!24030 () Bool)

(assert (=> d!24030 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1437 (buf!1818 thiss!1379))) ((_ sign_extend 32) (currentByte!3600 thiss!1379)) ((_ sign_extend 32) (currentBit!3595 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1437 (buf!1818 thiss!1379))) ((_ sign_extend 32) (currentByte!3600 thiss!1379)) ((_ sign_extend 32) (currentBit!3595 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5776 () Bool)

(assert (= bs!5776 d!24030))

(assert (=> bs!5776 m!120681))

(assert (=> b!75544 d!24030))

(declare-fun d!24034 () Bool)

(assert (=> d!24034 (= (array_inv!1283 (buf!1818 thiss!1379)) (bvsge (size!1437 (buf!1818 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!75548 d!24034))

(declare-fun d!24036 () Bool)

(assert (=> d!24036 (= (invariant!0 (currentBit!3595 thiss!1379) (currentByte!3600 thiss!1379) (size!1437 (buf!1818 thiss!1379))) (and (bvsge (currentBit!3595 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!3595 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!3600 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!3600 thiss!1379) (size!1437 (buf!1818 thiss!1379))) (and (= (currentBit!3595 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!3600 thiss!1379) (size!1437 (buf!1818 thiss!1379)))))))))

(assert (=> b!75543 d!24036))

(declare-fun d!24038 () Bool)

(declare-fun e!49446 () Bool)

(assert (=> d!24038 e!49446))

(declare-fun res!62506 () Bool)

(assert (=> d!24038 (=> (not res!62506) (not e!49446))))

(declare-fun lt!121602 () tuple2!6506)

(assert (=> d!24038 (= res!62506 (= (buf!1818 (_2!3381 lt!121602)) (buf!1818 (_1!3382 (reader!0 thiss!1379 thiss!1379)))))))

(declare-datatypes ((tuple3!214 0))(
  ( (tuple3!215 (_1!3385 Unit!4971) (_2!3385 BitStream!2448) (_3!128 array!3084)) )
))
(declare-fun lt!121594 () tuple3!214)

(assert (=> d!24038 (= lt!121602 (tuple2!6507 (_3!128 lt!121594) (_2!3385 lt!121594)))))

(declare-fun readBitsLoop!0 (BitStream!2448 (_ BitVec 64) array!3084 (_ BitVec 64) (_ BitVec 64)) tuple3!214)

(assert (=> d!24038 (= lt!121594 (readBitsLoop!0 (_1!3382 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635) (array!3085 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)))))

(assert (=> d!24038 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bvsle (bvsub to!314 i!635) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!24038 (= (readBits!0 (_1!3382 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)) lt!121602)))

(declare-fun b!75602 () Bool)

(declare-fun res!62505 () Bool)

(assert (=> b!75602 (=> (not res!62505) (not e!49446))))

(declare-fun lt!121600 () (_ BitVec 64))

(assert (=> b!75602 (= res!62505 (= (size!1437 (_1!3381 lt!121602)) ((_ extract 31 0) lt!121600)))))

(assert (=> b!75602 (and (bvslt lt!121600 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!121600 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!121599 () (_ BitVec 64))

(declare-fun lt!121598 () (_ BitVec 64))

(assert (=> b!75602 (= lt!121600 (bvsdiv lt!121599 lt!121598))))

(assert (=> b!75602 (and (not (= lt!121598 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!121599 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!121598 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!75602 (= lt!121598 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!121601 () (_ BitVec 64))

(declare-fun lt!121596 () (_ BitVec 64))

(assert (=> b!75602 (= lt!121599 (bvsub lt!121601 lt!121596))))

(assert (=> b!75602 (or (= (bvand lt!121601 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!121596 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!121601 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!121601 lt!121596) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75602 (= lt!121596 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!121595 () (_ BitVec 64))

(assert (=> b!75602 (= lt!121601 (bvadd (bvsub to!314 i!635) lt!121595))))

(assert (=> b!75602 (or (not (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!121595 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub to!314 i!635) lt!121595) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75602 (= lt!121595 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!75603 () Bool)

(declare-fun res!62508 () Bool)

(assert (=> b!75603 (=> (not res!62508) (not e!49446))))

(assert (=> b!75603 (= res!62508 (invariant!0 (currentBit!3595 (_2!3381 lt!121602)) (currentByte!3600 (_2!3381 lt!121602)) (size!1437 (buf!1818 (_2!3381 lt!121602)))))))

(declare-fun b!75604 () Bool)

(declare-fun res!62509 () Bool)

(assert (=> b!75604 (=> (not res!62509) (not e!49446))))

(declare-fun lt!121597 () (_ BitVec 64))

(assert (=> b!75604 (= res!62509 (= (bvadd lt!121597 (bvsub to!314 i!635)) (bitIndex!0 (size!1437 (buf!1818 (_2!3381 lt!121602))) (currentByte!3600 (_2!3381 lt!121602)) (currentBit!3595 (_2!3381 lt!121602)))))))

(assert (=> b!75604 (or (not (= (bvand lt!121597 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!121597 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!121597 (bvsub to!314 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75604 (= lt!121597 (bitIndex!0 (size!1437 (buf!1818 (_1!3382 (reader!0 thiss!1379 thiss!1379)))) (currentByte!3600 (_1!3382 (reader!0 thiss!1379 thiss!1379))) (currentBit!3595 (_1!3382 (reader!0 thiss!1379 thiss!1379)))))))

(declare-fun b!75605 () Bool)

(declare-datatypes ((List!780 0))(
  ( (Nil!777) (Cons!776 (h!895 Bool) (t!1530 List!780)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!2448 array!3084 (_ BitVec 64) (_ BitVec 64)) List!780)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2448 BitStream!2448 (_ BitVec 64)) List!780)

(assert (=> b!75605 (= e!49446 (= (byteArrayBitContentToList!0 (_2!3381 lt!121602) (_1!3381 lt!121602) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bitStreamReadBitsIntoList!0 (_2!3381 lt!121602) (_1!3382 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635))))))

(declare-fun b!75606 () Bool)

(declare-fun res!62507 () Bool)

(assert (=> b!75606 (=> (not res!62507) (not e!49446))))

(assert (=> b!75606 (= res!62507 (bvsle (currentByte!3600 (_1!3382 (reader!0 thiss!1379 thiss!1379))) (currentByte!3600 (_2!3381 lt!121602))))))

(assert (= (and d!24038 res!62506) b!75604))

(assert (= (and b!75604 res!62509) b!75603))

(assert (= (and b!75603 res!62508) b!75602))

(assert (= (and b!75602 res!62505) b!75606))

(assert (= (and b!75606 res!62507) b!75605))

(declare-fun m!120697 () Bool)

(assert (=> d!24038 m!120697))

(declare-fun m!120699 () Bool)

(assert (=> b!75603 m!120699))

(declare-fun m!120701 () Bool)

(assert (=> b!75604 m!120701))

(declare-fun m!120703 () Bool)

(assert (=> b!75604 m!120703))

(declare-fun m!120705 () Bool)

(assert (=> b!75605 m!120705))

(declare-fun m!120707 () Bool)

(assert (=> b!75605 m!120707))

(assert (=> b!75547 d!24038))

(declare-fun b!75647 () Bool)

(declare-fun e!49458 () Unit!4971)

(declare-fun Unit!4975 () Unit!4971)

(assert (=> b!75647 (= e!49458 Unit!4975)))

(declare-fun lt!121697 () tuple2!6508)

(declare-fun e!49457 () Bool)

(declare-fun lt!121700 () (_ BitVec 64))

(declare-fun lt!121706 () (_ BitVec 64))

(declare-fun b!75648 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2448 (_ BitVec 64)) BitStream!2448)

(assert (=> b!75648 (= e!49457 (= (_1!3382 lt!121697) (withMovedBitIndex!0 (_2!3382 lt!121697) (bvsub lt!121706 lt!121700))))))

(assert (=> b!75648 (or (= (bvand lt!121706 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!121700 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!121706 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!121706 lt!121700) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75648 (= lt!121700 (bitIndex!0 (size!1437 (buf!1818 thiss!1379)) (currentByte!3600 thiss!1379) (currentBit!3595 thiss!1379)))))

(assert (=> b!75648 (= lt!121706 (bitIndex!0 (size!1437 (buf!1818 thiss!1379)) (currentByte!3600 thiss!1379) (currentBit!3595 thiss!1379)))))

(declare-fun b!75649 () Bool)

(declare-fun lt!121705 () Unit!4971)

(assert (=> b!75649 (= e!49458 lt!121705)))

(declare-fun lt!121715 () (_ BitVec 64))

(assert (=> b!75649 (= lt!121715 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121702 () (_ BitVec 64))

(assert (=> b!75649 (= lt!121702 (bitIndex!0 (size!1437 (buf!1818 thiss!1379)) (currentByte!3600 thiss!1379) (currentBit!3595 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!3084 array!3084 (_ BitVec 64) (_ BitVec 64)) Unit!4971)

(assert (=> b!75649 (= lt!121705 (arrayBitRangesEqSymmetric!0 (buf!1818 thiss!1379) (buf!1818 thiss!1379) lt!121715 lt!121702))))

(assert (=> b!75649 (arrayBitRangesEq!0 (buf!1818 thiss!1379) (buf!1818 thiss!1379) lt!121715 lt!121702)))

(declare-fun b!75650 () Bool)

(declare-fun res!62548 () Bool)

(assert (=> b!75650 (=> (not res!62548) (not e!49457))))

(assert (=> b!75650 (= res!62548 (isPrefixOf!0 (_1!3382 lt!121697) thiss!1379))))

(declare-fun d!24060 () Bool)

(assert (=> d!24060 e!49457))

(declare-fun res!62546 () Bool)

(assert (=> d!24060 (=> (not res!62546) (not e!49457))))

(assert (=> d!24060 (= res!62546 (isPrefixOf!0 (_1!3382 lt!121697) (_2!3382 lt!121697)))))

(declare-fun lt!121710 () BitStream!2448)

(assert (=> d!24060 (= lt!121697 (tuple2!6509 lt!121710 thiss!1379))))

(declare-fun lt!121714 () Unit!4971)

(declare-fun lt!121716 () Unit!4971)

(assert (=> d!24060 (= lt!121714 lt!121716)))

(assert (=> d!24060 (isPrefixOf!0 lt!121710 thiss!1379)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2448 BitStream!2448 BitStream!2448) Unit!4971)

(assert (=> d!24060 (= lt!121716 (lemmaIsPrefixTransitive!0 lt!121710 thiss!1379 thiss!1379))))

(declare-fun lt!121698 () Unit!4971)

(declare-fun lt!121708 () Unit!4971)

(assert (=> d!24060 (= lt!121698 lt!121708)))

(assert (=> d!24060 (isPrefixOf!0 lt!121710 thiss!1379)))

(assert (=> d!24060 (= lt!121708 (lemmaIsPrefixTransitive!0 lt!121710 thiss!1379 thiss!1379))))

(declare-fun lt!121699 () Unit!4971)

(assert (=> d!24060 (= lt!121699 e!49458)))

(declare-fun c!5534 () Bool)

(assert (=> d!24060 (= c!5534 (not (= (size!1437 (buf!1818 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!121712 () Unit!4971)

(declare-fun lt!121711 () Unit!4971)

(assert (=> d!24060 (= lt!121712 lt!121711)))

(assert (=> d!24060 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!24060 (= lt!121711 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!121703 () Unit!4971)

(declare-fun lt!121713 () Unit!4971)

(assert (=> d!24060 (= lt!121703 lt!121713)))

(assert (=> d!24060 (= lt!121713 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!121701 () Unit!4971)

(declare-fun lt!121707 () Unit!4971)

(assert (=> d!24060 (= lt!121701 lt!121707)))

(assert (=> d!24060 (isPrefixOf!0 lt!121710 lt!121710)))

(assert (=> d!24060 (= lt!121707 (lemmaIsPrefixRefl!0 lt!121710))))

(declare-fun lt!121709 () Unit!4971)

(declare-fun lt!121704 () Unit!4971)

(assert (=> d!24060 (= lt!121709 lt!121704)))

(assert (=> d!24060 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!24060 (= lt!121704 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!24060 (= lt!121710 (BitStream!2449 (buf!1818 thiss!1379) (currentByte!3600 thiss!1379) (currentBit!3595 thiss!1379)))))

(assert (=> d!24060 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!24060 (= (reader!0 thiss!1379 thiss!1379) lt!121697)))

(declare-fun b!75651 () Bool)

(declare-fun res!62547 () Bool)

(assert (=> b!75651 (=> (not res!62547) (not e!49457))))

(assert (=> b!75651 (= res!62547 (isPrefixOf!0 (_2!3382 lt!121697) thiss!1379))))

(assert (= (and d!24060 c!5534) b!75649))

(assert (= (and d!24060 (not c!5534)) b!75647))

(assert (= (and d!24060 res!62546) b!75650))

(assert (= (and b!75650 res!62548) b!75651))

(assert (= (and b!75651 res!62547) b!75648))

(declare-fun m!120733 () Bool)

(assert (=> b!75650 m!120733))

(declare-fun m!120735 () Bool)

(assert (=> b!75648 m!120735))

(assert (=> b!75648 m!120647))

(assert (=> b!75648 m!120647))

(declare-fun m!120737 () Bool)

(assert (=> b!75651 m!120737))

(assert (=> b!75649 m!120647))

(declare-fun m!120739 () Bool)

(assert (=> b!75649 m!120739))

(declare-fun m!120741 () Bool)

(assert (=> b!75649 m!120741))

(declare-fun m!120743 () Bool)

(assert (=> d!24060 m!120743))

(assert (=> d!24060 m!120645))

(declare-fun m!120745 () Bool)

(assert (=> d!24060 m!120745))

(assert (=> d!24060 m!120643))

(declare-fun m!120747 () Bool)

(assert (=> d!24060 m!120747))

(assert (=> d!24060 m!120745))

(declare-fun m!120749 () Bool)

(assert (=> d!24060 m!120749))

(declare-fun m!120751 () Bool)

(assert (=> d!24060 m!120751))

(assert (=> d!24060 m!120643))

(assert (=> d!24060 m!120645))

(assert (=> d!24060 m!120643))

(assert (=> b!75547 d!24060))

(declare-fun d!24066 () Bool)

(declare-fun res!62553 () Bool)

(declare-fun e!49463 () Bool)

(assert (=> d!24066 (=> res!62553 e!49463)))

(assert (=> d!24066 (= res!62553 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24066 (= (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3381 lt!121532) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) e!49463)))

(declare-fun b!75656 () Bool)

(declare-fun e!49464 () Bool)

(assert (=> b!75656 (= e!49463 e!49464)))

(declare-fun res!62554 () Bool)

(assert (=> b!75656 (=> (not res!62554) (not e!49464))))

(assert (=> b!75656 (= res!62554 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!2035 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!2035 (_1!3381 lt!121532)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!75657 () Bool)

(assert (=> b!75657 (= e!49464 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3381 lt!121532) (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!24066 (not res!62553)) b!75656))

(assert (= (and b!75656 res!62554) b!75657))

(declare-fun m!120753 () Bool)

(assert (=> b!75656 m!120753))

(declare-fun m!120755 () Bool)

(assert (=> b!75656 m!120755))

(declare-fun m!120757 () Bool)

(assert (=> b!75656 m!120757))

(declare-fun m!120759 () Bool)

(assert (=> b!75656 m!120759))

(declare-fun m!120761 () Bool)

(assert (=> b!75657 m!120761))

(assert (=> b!75546 d!24066))

(check-sat (not b!75605) (not d!24038) (not d!24030) (not b!75604) (not b!75603) (not d!24026) (not d!24060) (not b!75650) (not b!75579) (not d!24028) (not b!75651) (not b!75657) (not b!75648) (not b!75577) (not d!24022) (not b!75649))
(check-sat)
