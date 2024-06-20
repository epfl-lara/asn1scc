; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14662 () Bool)

(assert start!14662)

(declare-fun b!75564 () Bool)

(declare-fun e!49426 () Bool)

(declare-fun e!49422 () Bool)

(assert (=> b!75564 (= e!49426 e!49422)))

(declare-fun res!62472 () Bool)

(assert (=> b!75564 (=> res!62472 e!49422)))

(declare-fun lt!121550 () (_ BitVec 64))

(declare-fun lt!121554 () (_ BitVec 64))

(assert (=> b!75564 (= res!62472 (not (= lt!121550 lt!121554)))))

(declare-fun lt!121552 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!75564 (= lt!121554 (bvsub lt!121552 i!635))))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!75564 (= lt!121552 (bvadd lt!121550 to!314))))

(declare-fun res!62469 () Bool)

(declare-fun e!49428 () Bool)

(assert (=> start!14662 (=> (not res!62469) (not e!49428))))

(declare-datatypes ((array!3086 0))(
  ( (array!3087 (arr!2036 (Array (_ BitVec 32) (_ BitVec 8))) (size!1438 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!3086)

(assert (=> start!14662 (= res!62469 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1438 srcBuffer!2))))))))

(assert (=> start!14662 e!49428))

(assert (=> start!14662 true))

(declare-fun array_inv!1284 (array!3086) Bool)

(assert (=> start!14662 (array_inv!1284 srcBuffer!2)))

(declare-datatypes ((BitStream!2450 0))(
  ( (BitStream!2451 (buf!1819 array!3086) (currentByte!3601 (_ BitVec 32)) (currentBit!3596 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2450)

(declare-fun e!49423 () Bool)

(declare-fun inv!12 (BitStream!2450) Bool)

(assert (=> start!14662 (and (inv!12 thiss!1379) e!49423)))

(declare-fun b!75565 () Bool)

(declare-fun res!62468 () Bool)

(assert (=> b!75565 (=> res!62468 e!49422)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!75565 (= res!62468 (not (invariant!0 (currentBit!3596 thiss!1379) (currentByte!3601 thiss!1379) (size!1438 (buf!1819 thiss!1379)))))))

(declare-fun b!75566 () Bool)

(assert (=> b!75566 (= e!49423 (array_inv!1284 (buf!1819 thiss!1379)))))

(declare-fun b!75567 () Bool)

(declare-fun res!62473 () Bool)

(assert (=> b!75567 (=> (not res!62473) (not e!49428))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75567 (= res!62473 (validate_offset_bits!1 ((_ sign_extend 32) (size!1438 (buf!1819 thiss!1379))) ((_ sign_extend 32) (currentByte!3601 thiss!1379)) ((_ sign_extend 32) (currentBit!3596 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75568 () Bool)

(assert (=> b!75568 (= e!49428 (not e!49426))))

(declare-fun res!62471 () Bool)

(assert (=> b!75568 (=> res!62471 e!49426)))

(assert (=> b!75568 (= res!62471 (bvslt i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2450 BitStream!2450) Bool)

(assert (=> b!75568 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4973 0))(
  ( (Unit!4974) )
))
(declare-fun lt!121553 () Unit!4973)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2450) Unit!4973)

(assert (=> b!75568 (= lt!121553 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!75568 (= lt!121550 (bitIndex!0 (size!1438 (buf!1819 thiss!1379)) (currentByte!3601 thiss!1379) (currentBit!3596 thiss!1379)))))

(declare-fun lt!121549 () (_ BitVec 64))

(declare-fun b!75569 () Bool)

(declare-fun e!49424 () Bool)

(assert (=> b!75569 (= e!49424 (or (= lt!121549 (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!121549 (bvand lt!121554 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!75569 (= lt!121549 (bvand lt!121552 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!6510 0))(
  ( (tuple2!6511 (_1!3383 array!3086) (_2!3383 BitStream!2450)) )
))
(declare-fun lt!121551 () tuple2!6510)

(declare-fun checkByteArrayBitContent!0 (BitStream!2450 array!3086 array!3086 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75569 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3383 lt!121551) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!75570 () Bool)

(assert (=> b!75570 (= e!49422 e!49424)))

(declare-fun res!62470 () Bool)

(assert (=> b!75570 (=> res!62470 e!49424)))

(assert (=> b!75570 (= res!62470 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!2450 (_ BitVec 64)) tuple2!6510)

(declare-datatypes ((tuple2!6512 0))(
  ( (tuple2!6513 (_1!3384 BitStream!2450) (_2!3384 BitStream!2450)) )
))
(declare-fun reader!0 (BitStream!2450 BitStream!2450) tuple2!6512)

(assert (=> b!75570 (= lt!121551 (readBits!0 (_1!3384 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!14662 res!62469) b!75567))

(assert (= (and b!75567 res!62473) b!75568))

(assert (= (and b!75568 (not res!62471)) b!75564))

(assert (= (and b!75564 (not res!62472)) b!75565))

(assert (= (and b!75565 (not res!62468)) b!75570))

(assert (= (and b!75570 (not res!62470)) b!75569))

(assert (= start!14662 b!75566))

(declare-fun m!120655 () Bool)

(assert (=> b!75567 m!120655))

(declare-fun m!120657 () Bool)

(assert (=> b!75569 m!120657))

(declare-fun m!120659 () Bool)

(assert (=> start!14662 m!120659))

(declare-fun m!120661 () Bool)

(assert (=> start!14662 m!120661))

(declare-fun m!120663 () Bool)

(assert (=> b!75565 m!120663))

(declare-fun m!120665 () Bool)

(assert (=> b!75570 m!120665))

(declare-fun m!120667 () Bool)

(assert (=> b!75570 m!120667))

(declare-fun m!120669 () Bool)

(assert (=> b!75566 m!120669))

(declare-fun m!120671 () Bool)

(assert (=> b!75568 m!120671))

(declare-fun m!120673 () Bool)

(assert (=> b!75568 m!120673))

(declare-fun m!120675 () Bool)

(assert (=> b!75568 m!120675))

(push 1)

(assert (not b!75568))

(assert (not b!75566))

(assert (not b!75567))

(assert (not b!75565))

(assert (not b!75569))

(assert (not b!75570))

(assert (not start!14662))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!24042 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24042 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1438 (buf!1819 thiss!1379))) ((_ sign_extend 32) (currentByte!3601 thiss!1379)) ((_ sign_extend 32) (currentBit!3596 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1438 (buf!1819 thiss!1379))) ((_ sign_extend 32) (currentByte!3601 thiss!1379)) ((_ sign_extend 32) (currentBit!3596 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5777 () Bool)

(assert (= bs!5777 d!24042))

(declare-fun m!120693 () Bool)

(assert (=> bs!5777 m!120693))

(assert (=> b!75567 d!24042))

(declare-fun d!24044 () Bool)

(assert (=> d!24044 (= (array_inv!1284 srcBuffer!2) (bvsge (size!1438 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!14662 d!24044))

(declare-fun d!24046 () Bool)

(assert (=> d!24046 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3596 thiss!1379) (currentByte!3601 thiss!1379) (size!1438 (buf!1819 thiss!1379))))))

(declare-fun bs!5778 () Bool)

(assert (= bs!5778 d!24046))

(assert (=> bs!5778 m!120663))

(assert (=> start!14662 d!24046))

(declare-fun d!24052 () Bool)

(assert (=> d!24052 (= (array_inv!1284 (buf!1819 thiss!1379)) (bvsge (size!1438 (buf!1819 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!75566 d!24052))

(declare-fun d!24054 () Bool)

(assert (=> d!24054 (= (invariant!0 (currentBit!3596 thiss!1379) (currentByte!3601 thiss!1379) (size!1438 (buf!1819 thiss!1379))) (and (bvsge (currentBit!3596 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!3596 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!3601 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!3601 thiss!1379) (size!1438 (buf!1819 thiss!1379))) (and (= (currentBit!3596 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!3601 thiss!1379) (size!1438 (buf!1819 thiss!1379)))))))))

(assert (=> b!75565 d!24054))

(declare-fun d!24058 () Bool)

(declare-fun e!49449 () Bool)

(assert (=> d!24058 e!49449))

(declare-fun res!62523 () Bool)

(assert (=> d!24058 (=> (not res!62523) (not e!49449))))

(declare-fun lt!121621 () tuple2!6510)

(assert (=> d!24058 (= res!62523 (= (buf!1819 (_2!3383 lt!121621)) (buf!1819 (_1!3384 (reader!0 thiss!1379 thiss!1379)))))))

(declare-datatypes ((tuple3!216 0))(
  ( (tuple3!217 (_1!3386 Unit!4973) (_2!3386 BitStream!2450) (_3!129 array!3086)) )
))
(declare-fun lt!121625 () tuple3!216)

(assert (=> d!24058 (= lt!121621 (tuple2!6511 (_3!129 lt!121625) (_2!3386 lt!121625)))))

(declare-fun readBitsLoop!0 (BitStream!2450 (_ BitVec 64) array!3086 (_ BitVec 64) (_ BitVec 64)) tuple3!216)

(assert (=> d!24058 (= lt!121625 (readBitsLoop!0 (_1!3384 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635) (array!3087 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)))))

(assert (=> d!24058 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bvsle (bvsub to!314 i!635) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!24058 (= (readBits!0 (_1!3384 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)) lt!121621)))

(declare-fun b!75617 () Bool)

(declare-fun res!62521 () Bool)

(assert (=> b!75617 (=> (not res!62521) (not e!49449))))

(assert (=> b!75617 (= res!62521 (invariant!0 (currentBit!3596 (_2!3383 lt!121621)) (currentByte!3601 (_2!3383 lt!121621)) (size!1438 (buf!1819 (_2!3383 lt!121621)))))))

(declare-fun b!75618 () Bool)

(declare-fun res!62522 () Bool)

(assert (=> b!75618 (=> (not res!62522) (not e!49449))))

(assert (=> b!75618 (= res!62522 (bvsle (currentByte!3601 (_1!3384 (reader!0 thiss!1379 thiss!1379))) (currentByte!3601 (_2!3383 lt!121621))))))

(declare-fun b!75619 () Bool)

(declare-datatypes ((List!781 0))(
  ( (Nil!778) (Cons!777 (h!896 Bool) (t!1531 List!781)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!2450 array!3086 (_ BitVec 64) (_ BitVec 64)) List!781)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2450 BitStream!2450 (_ BitVec 64)) List!781)

(assert (=> b!75619 (= e!49449 (= (byteArrayBitContentToList!0 (_2!3383 lt!121621) (_1!3383 lt!121621) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bitStreamReadBitsIntoList!0 (_2!3383 lt!121621) (_1!3384 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635))))))

(declare-fun b!75620 () Bool)

(declare-fun res!62524 () Bool)

(assert (=> b!75620 (=> (not res!62524) (not e!49449))))

(declare-fun lt!121627 () (_ BitVec 64))

(assert (=> b!75620 (= res!62524 (= (size!1438 (_1!3383 lt!121621)) ((_ extract 31 0) lt!121627)))))

(assert (=> b!75620 (and (bvslt lt!121627 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!121627 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!121629 () (_ BitVec 64))

(declare-fun lt!121628 () (_ BitVec 64))

(assert (=> b!75620 (= lt!121627 (bvsdiv lt!121629 lt!121628))))

(assert (=> b!75620 (and (not (= lt!121628 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!121629 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!121628 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!75620 (= lt!121628 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!121623 () (_ BitVec 64))

(declare-fun lt!121626 () (_ BitVec 64))

(assert (=> b!75620 (= lt!121629 (bvsub lt!121623 lt!121626))))

(assert (=> b!75620 (or (= (bvand lt!121623 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!121626 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!121623 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!121623 lt!121626) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75620 (= lt!121626 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!121624 () (_ BitVec 64))

(assert (=> b!75620 (= lt!121623 (bvadd (bvsub to!314 i!635) lt!121624))))

(assert (=> b!75620 (or (not (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!121624 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub to!314 i!635) lt!121624) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75620 (= lt!121624 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!75621 () Bool)

(declare-fun res!62520 () Bool)

(assert (=> b!75621 (=> (not res!62520) (not e!49449))))

(declare-fun lt!121622 () (_ BitVec 64))

(assert (=> b!75621 (= res!62520 (= (bvadd lt!121622 (bvsub to!314 i!635)) (bitIndex!0 (size!1438 (buf!1819 (_2!3383 lt!121621))) (currentByte!3601 (_2!3383 lt!121621)) (currentBit!3596 (_2!3383 lt!121621)))))))

(assert (=> b!75621 (or (not (= (bvand lt!121622 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!121622 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!121622 (bvsub to!314 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75621 (= lt!121622 (bitIndex!0 (size!1438 (buf!1819 (_1!3384 (reader!0 thiss!1379 thiss!1379)))) (currentByte!3601 (_1!3384 (reader!0 thiss!1379 thiss!1379))) (currentBit!3596 (_1!3384 (reader!0 thiss!1379 thiss!1379)))))))

(assert (= (and d!24058 res!62523) b!75621))

(assert (= (and b!75621 res!62520) b!75617))

(assert (= (and b!75617 res!62521) b!75620))

(assert (= (and b!75620 res!62524) b!75618))

(assert (= (and b!75618 res!62522) b!75619))

(declare-fun m!120709 () Bool)

(assert (=> d!24058 m!120709))

(declare-fun m!120711 () Bool)

(assert (=> b!75617 m!120711))

(declare-fun m!120713 () Bool)

(assert (=> b!75619 m!120713))

(declare-fun m!120715 () Bool)

(assert (=> b!75619 m!120715))

(declare-fun m!120717 () Bool)

(assert (=> b!75621 m!120717))

(declare-fun m!120719 () Bool)

(assert (=> b!75621 m!120719))

(assert (=> b!75570 d!24058))

(declare-fun lt!121771 () (_ BitVec 64))

(declare-fun b!75668 () Bool)

(declare-fun e!49469 () Bool)

(declare-fun lt!121770 () tuple2!6512)

(declare-fun lt!121757 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2450 (_ BitVec 64)) BitStream!2450)

(assert (=> b!75668 (= e!49469 (= (_1!3384 lt!121770) (withMovedBitIndex!0 (_2!3384 lt!121770) (bvsub lt!121757 lt!121771))))))

(assert (=> b!75668 (or (= (bvand lt!121757 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!121771 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!121757 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!121757 lt!121771) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75668 (= lt!121771 (bitIndex!0 (size!1438 (buf!1819 thiss!1379)) (currentByte!3601 thiss!1379) (currentBit!3596 thiss!1379)))))

(assert (=> b!75668 (= lt!121757 (bitIndex!0 (size!1438 (buf!1819 thiss!1379)) (currentByte!3601 thiss!1379) (currentBit!3596 thiss!1379)))))

(declare-fun d!24062 () Bool)

(assert (=> d!24062 e!49469))

(declare-fun res!62563 () Bool)

(assert (=> d!24062 (=> (not res!62563) (not e!49469))))

(assert (=> d!24062 (= res!62563 (isPrefixOf!0 (_1!3384 lt!121770) (_2!3384 lt!121770)))))

(declare-fun lt!121775 () BitStream!2450)

(assert (=> d!24062 (= lt!121770 (tuple2!6513 lt!121775 thiss!1379))))

(declare-fun lt!121758 () Unit!4973)

(declare-fun lt!121766 () Unit!4973)

(assert (=> d!24062 (= lt!121758 lt!121766)))

(assert (=> d!24062 (isPrefixOf!0 lt!121775 thiss!1379)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2450 BitStream!2450 BitStream!2450) Unit!4973)

(assert (=> d!24062 (= lt!121766 (lemmaIsPrefixTransitive!0 lt!121775 thiss!1379 thiss!1379))))

(declare-fun lt!121772 () Unit!4973)

(declare-fun lt!121759 () Unit!4973)

(assert (=> d!24062 (= lt!121772 lt!121759)))

(assert (=> d!24062 (isPrefixOf!0 lt!121775 thiss!1379)))

(assert (=> d!24062 (= lt!121759 (lemmaIsPrefixTransitive!0 lt!121775 thiss!1379 thiss!1379))))

(declare-fun lt!121776 () Unit!4973)

(declare-fun e!49470 () Unit!4973)

(assert (=> d!24062 (= lt!121776 e!49470)))

(declare-fun c!5537 () Bool)

(assert (=> d!24062 (= c!5537 (not (= (size!1438 (buf!1819 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!121767 () Unit!4973)

(declare-fun lt!121760 () Unit!4973)

(assert (=> d!24062 (= lt!121767 lt!121760)))

(assert (=> d!24062 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!24062 (= lt!121760 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!121761 () Unit!4973)

(declare-fun lt!121765 () Unit!4973)

(assert (=> d!24062 (= lt!121761 lt!121765)))

(assert (=> d!24062 (= lt!121765 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!121764 () Unit!4973)

(declare-fun lt!121773 () Unit!4973)

(assert (=> d!24062 (= lt!121764 lt!121773)))

(assert (=> d!24062 (isPrefixOf!0 lt!121775 lt!121775)))

(assert (=> d!24062 (= lt!121773 (lemmaIsPrefixRefl!0 lt!121775))))

(declare-fun lt!121774 () Unit!4973)

(declare-fun lt!121768 () Unit!4973)

(assert (=> d!24062 (= lt!121774 lt!121768)))

(assert (=> d!24062 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!24062 (= lt!121768 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!24062 (= lt!121775 (BitStream!2451 (buf!1819 thiss!1379) (currentByte!3601 thiss!1379) (currentBit!3596 thiss!1379)))))

(assert (=> d!24062 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!24062 (= (reader!0 thiss!1379 thiss!1379) lt!121770)))

(declare-fun b!75669 () Bool)

(declare-fun lt!121763 () Unit!4973)

(assert (=> b!75669 (= e!49470 lt!121763)))

(declare-fun lt!121762 () (_ BitVec 64))

(assert (=> b!75669 (= lt!121762 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121769 () (_ BitVec 64))

(assert (=> b!75669 (= lt!121769 (bitIndex!0 (size!1438 (buf!1819 thiss!1379)) (currentByte!3601 thiss!1379) (currentBit!3596 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!3086 array!3086 (_ BitVec 64) (_ BitVec 64)) Unit!4973)

(assert (=> b!75669 (= lt!121763 (arrayBitRangesEqSymmetric!0 (buf!1819 thiss!1379) (buf!1819 thiss!1379) lt!121762 lt!121769))))

(declare-fun arrayBitRangesEq!0 (array!3086 array!3086 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75669 (arrayBitRangesEq!0 (buf!1819 thiss!1379) (buf!1819 thiss!1379) lt!121762 lt!121769)))

(declare-fun b!75670 () Bool)

(declare-fun Unit!4977 () Unit!4973)

(assert (=> b!75670 (= e!49470 Unit!4977)))

(declare-fun b!75671 () Bool)

(declare-fun res!62561 () Bool)

(assert (=> b!75671 (=> (not res!62561) (not e!49469))))

(assert (=> b!75671 (= res!62561 (isPrefixOf!0 (_1!3384 lt!121770) thiss!1379))))

(declare-fun b!75672 () Bool)

(declare-fun res!62562 () Bool)

(assert (=> b!75672 (=> (not res!62562) (not e!49469))))

(assert (=> b!75672 (= res!62562 (isPrefixOf!0 (_2!3384 lt!121770) thiss!1379))))

(assert (= (and d!24062 c!5537) b!75669))

(assert (= (and d!24062 (not c!5537)) b!75670))

(assert (= (and d!24062 res!62563) b!75671))

(assert (= (and b!75671 res!62561) b!75672))

(assert (= (and b!75672 res!62562) b!75668))

(declare-fun m!120763 () Bool)

(assert (=> b!75671 m!120763))

(declare-fun m!120765 () Bool)

(assert (=> b!75672 m!120765))

(assert (=> b!75669 m!120675))

(declare-fun m!120767 () Bool)

(assert (=> b!75669 m!120767))

(declare-fun m!120769 () Bool)

(assert (=> b!75669 m!120769))

(declare-fun m!120771 () Bool)

(assert (=> b!75668 m!120771))

(assert (=> b!75668 m!120675))

(assert (=> b!75668 m!120675))

(assert (=> d!24062 m!120673))

(declare-fun m!120773 () Bool)

(assert (=> d!24062 m!120773))

(declare-fun m!120775 () Bool)

(assert (=> d!24062 m!120775))

(assert (=> d!24062 m!120671))

(assert (=> d!24062 m!120671))

(assert (=> d!24062 m!120775))

(declare-fun m!120777 () Bool)

(assert (=> d!24062 m!120777))

(assert (=> d!24062 m!120671))

(declare-fun m!120779 () Bool)

(assert (=> d!24062 m!120779))

(assert (=> d!24062 m!120673))

(declare-fun m!120781 () Bool)

(assert (=> d!24062 m!120781))

(assert (=> b!75570 d!24062))

(declare-fun d!24068 () Bool)

(declare-fun res!62568 () Bool)

(declare-fun e!49475 () Bool)

(assert (=> d!24068 (=> res!62568 e!49475)))

(assert (=> d!24068 (= res!62568 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24068 (= (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3383 lt!121551) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) e!49475)))

(declare-fun b!75677 () Bool)

(declare-fun e!49476 () Bool)

(assert (=> b!75677 (= e!49475 e!49476)))

(declare-fun res!62569 () Bool)

(assert (=> b!75677 (=> (not res!62569) (not e!49476))))

(assert (=> b!75677 (= res!62569 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!2036 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!2036 (_1!3383 lt!121551)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!75678 () Bool)

(assert (=> b!75678 (= e!49476 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3383 lt!121551) (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!24068 (not res!62568)) b!75677))

(assert (= (and b!75677 res!62569) b!75678))

(declare-fun m!120783 () Bool)

(assert (=> b!75677 m!120783))

(declare-fun m!120785 () Bool)

(assert (=> b!75677 m!120785))

(declare-fun m!120787 () Bool)

(assert (=> b!75677 m!120787))

(declare-fun m!120789 () Bool)

(assert (=> b!75677 m!120789))

(declare-fun m!120791 () Bool)

(assert (=> b!75678 m!120791))

(assert (=> b!75569 d!24068))

(declare-fun d!24070 () Bool)

(declare-fun res!62582 () Bool)

(declare-fun e!49485 () Bool)

(assert (=> d!24070 (=> (not res!62582) (not e!49485))))

(assert (=> d!24070 (= res!62582 (= (size!1438 (buf!1819 thiss!1379)) (size!1438 (buf!1819 thiss!1379))))))

(assert (=> d!24070 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!49485)))

(declare-fun b!75695 () Bool)

(declare-fun res!62583 () Bool)

(assert (=> b!75695 (=> (not res!62583) (not e!49485))))

(assert (=> b!75695 (= res!62583 (bvsle (bitIndex!0 (size!1438 (buf!1819 thiss!1379)) (currentByte!3601 thiss!1379) (currentBit!3596 thiss!1379)) (bitIndex!0 (size!1438 (buf!1819 thiss!1379)) (currentByte!3601 thiss!1379) (currentBit!3596 thiss!1379))))))

(declare-fun b!75696 () Bool)

(declare-fun e!49486 () Bool)

(assert (=> b!75696 (= e!49485 e!49486)))

(declare-fun res!62584 () Bool)

(assert (=> b!75696 (=> res!62584 e!49486)))

(assert (=> b!75696 (= res!62584 (= (size!1438 (buf!1819 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!75697 () Bool)

(assert (=> b!75697 (= e!49486 (arrayBitRangesEq!0 (buf!1819 thiss!1379) (buf!1819 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1438 (buf!1819 thiss!1379)) (currentByte!3601 thiss!1379) (currentBit!3596 thiss!1379))))))

(assert (= (and d!24070 res!62582) b!75695))

(assert (= (and b!75695 res!62583) b!75696))

(assert (= (and b!75696 (not res!62584)) b!75697))

(assert (=> b!75695 m!120675))

(assert (=> b!75695 m!120675))

(assert (=> b!75697 m!120675))

(assert (=> b!75697 m!120675))

(declare-fun m!120793 () Bool)

(assert (=> b!75697 m!120793))

(assert (=> b!75568 d!24070))

(declare-fun d!24072 () Bool)

(assert (=> d!24072 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!121839 () Unit!4973)

(declare-fun choose!11 (BitStream!2450) Unit!4973)

(assert (=> d!24072 (= lt!121839 (choose!11 thiss!1379))))

(assert (=> d!24072 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!121839)))

(declare-fun bs!5781 () Bool)

(assert (= bs!5781 d!24072))

(assert (=> bs!5781 m!120671))

(declare-fun m!120815 () Bool)

(assert (=> bs!5781 m!120815))

(assert (=> b!75568 d!24072))

(declare-fun d!24076 () Bool)

(declare-fun e!49497 () Bool)

(assert (=> d!24076 e!49497))

(declare-fun res!62601 () Bool)

(assert (=> d!24076 (=> (not res!62601) (not e!49497))))

(declare-fun lt!121859 () (_ BitVec 64))

(declare-fun lt!121856 () (_ BitVec 64))

(declare-fun lt!121860 () (_ BitVec 64))

(assert (=> d!24076 (= res!62601 (= lt!121856 (bvsub lt!121860 lt!121859)))))

(assert (=> d!24076 (or (= (bvand lt!121860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!121859 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!121860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!121860 lt!121859) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24076 (= lt!121859 (remainingBits!0 ((_ sign_extend 32) (size!1438 (buf!1819 thiss!1379))) ((_ sign_extend 32) (currentByte!3601 thiss!1379)) ((_ sign_extend 32) (currentBit!3596 thiss!1379))))))

(declare-fun lt!121855 () (_ BitVec 64))

(declare-fun lt!121857 () (_ BitVec 64))

(assert (=> d!24076 (= lt!121860 (bvmul lt!121855 lt!121857))))

(assert (=> d!24076 (or (= lt!121855 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!121857 (bvsdiv (bvmul lt!121855 lt!121857) lt!121855)))))

(assert (=> d!24076 (= lt!121857 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24076 (= lt!121855 ((_ sign_extend 32) (size!1438 (buf!1819 thiss!1379))))))

(assert (=> d!24076 (= lt!121856 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3601 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3596 thiss!1379))))))

(assert (=> d!24076 (invariant!0 (currentBit!3596 thiss!1379) (currentByte!3601 thiss!1379) (size!1438 (buf!1819 thiss!1379)))))

(assert (=> d!24076 (= (bitIndex!0 (size!1438 (buf!1819 thiss!1379)) (currentByte!3601 thiss!1379) (currentBit!3596 thiss!1379)) lt!121856)))

(declare-fun b!75716 () Bool)

(declare-fun res!62602 () Bool)

(assert (=> b!75716 (=> (not res!62602) (not e!49497))))

(assert (=> b!75716 (= res!62602 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!121856))))

(declare-fun b!75717 () Bool)

(declare-fun lt!121858 () (_ BitVec 64))

(assert (=> b!75717 (= e!49497 (bvsle lt!121856 (bvmul lt!121858 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!75717 (or (= lt!121858 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!121858 #b0000000000000000000000000000000000000000000000000000000000001000) lt!121858)))))

(assert (=> b!75717 (= lt!121858 ((_ sign_extend 32) (size!1438 (buf!1819 thiss!1379))))))

(assert (= (and d!24076 res!62601) b!75716))

(assert (= (and b!75716 res!62602) b!75717))

(assert (=> d!24076 m!120693))

(assert (=> d!24076 m!120663))

(assert (=> b!75568 d!24076))

(push 1)

(assert (not b!75672))

(assert (not d!24046))

(assert (not d!24072))

(assert (not b!75621))

(assert (not b!75697))

(assert (not b!75668))

(assert (not d!24042))

(assert (not b!75671))

(assert (not b!75678))

(assert (not b!75695))

(assert (not d!24058))

(assert (not b!75669))

(assert (not b!75619))

(assert (not d!24076))

(assert (not d!24062))

(assert (not b!75617))

(check-sat)

(pop 1)

(push 1)

(check-sat)

