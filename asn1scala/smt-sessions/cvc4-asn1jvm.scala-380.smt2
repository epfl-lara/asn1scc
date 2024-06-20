; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9168 () Bool)

(assert start!9168)

(declare-fun b!45584 () Bool)

(declare-fun res!38564 () Bool)

(declare-fun e!30364 () Bool)

(assert (=> b!45584 (=> (not res!38564) (not e!30364))))

(declare-datatypes ((array!2273 0))(
  ( (array!2274 (arr!1540 (Array (_ BitVec 32) (_ BitVec 8))) (size!1023 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1790 0))(
  ( (BitStream!1791 (buf!1372 array!2273) (currentByte!2865 (_ BitVec 32)) (currentBit!2860 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1790)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!45584 (= res!38564 (validate_offset_bits!1 ((_ sign_extend 32) (size!1023 (buf!1372 thiss!1379))) ((_ sign_extend 32) (currentByte!2865 thiss!1379)) ((_ sign_extend 32) (currentBit!2860 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!45585 () Bool)

(declare-fun e!30370 () Bool)

(assert (=> b!45585 (= e!30364 (not e!30370))))

(declare-fun res!38570 () Bool)

(assert (=> b!45585 (=> res!38570 e!30370)))

(assert (=> b!45585 (= res!38570 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1790 BitStream!1790) Bool)

(assert (=> b!45585 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3236 0))(
  ( (Unit!3237) )
))
(declare-fun lt!69917 () Unit!3236)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1790) Unit!3236)

(assert (=> b!45585 (= lt!69917 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!69916 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!45585 (= lt!69916 (bitIndex!0 (size!1023 (buf!1372 thiss!1379)) (currentByte!2865 thiss!1379) (currentBit!2860 thiss!1379)))))

(declare-fun b!45586 () Bool)

(declare-fun e!30366 () Bool)

(declare-fun e!30371 () Bool)

(assert (=> b!45586 (= e!30366 e!30371)))

(declare-fun res!38565 () Bool)

(assert (=> b!45586 (=> res!38565 e!30371)))

(declare-fun lt!69913 () (_ BitVec 64))

(assert (=> b!45586 (= res!38565 (not (= lt!69913 (bvsub (bvadd lt!69916 to!314) i!635))))))

(declare-datatypes ((tuple2!4448 0))(
  ( (tuple2!4449 (_1!2317 Unit!3236) (_2!2317 BitStream!1790)) )
))
(declare-fun lt!69912 () tuple2!4448)

(assert (=> b!45586 (= lt!69913 (bitIndex!0 (size!1023 (buf!1372 (_2!2317 lt!69912))) (currentByte!2865 (_2!2317 lt!69912)) (currentBit!2860 (_2!2317 lt!69912))))))

(declare-fun b!45587 () Bool)

(declare-fun res!38575 () Bool)

(declare-fun e!30374 () Bool)

(assert (=> b!45587 (=> res!38575 e!30374)))

(declare-fun lt!69921 () tuple2!4448)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!45587 (= res!38575 (not (invariant!0 (currentBit!2860 (_2!2317 lt!69921)) (currentByte!2865 (_2!2317 lt!69921)) (size!1023 (buf!1372 (_2!2317 lt!69912))))))))

(declare-fun b!45588 () Bool)

(assert (=> b!45588 (= e!30371 e!30374)))

(declare-fun res!38577 () Bool)

(assert (=> b!45588 (=> res!38577 e!30374)))

(assert (=> b!45588 (= res!38577 (not (= (size!1023 (buf!1372 (_2!2317 lt!69921))) (size!1023 (buf!1372 (_2!2317 lt!69912))))))))

(declare-fun e!30363 () Bool)

(assert (=> b!45588 e!30363))

(declare-fun res!38574 () Bool)

(assert (=> b!45588 (=> (not res!38574) (not e!30363))))

(assert (=> b!45588 (= res!38574 (= (size!1023 (buf!1372 (_2!2317 lt!69912))) (size!1023 (buf!1372 thiss!1379))))))

(declare-fun b!45589 () Bool)

(declare-fun e!30372 () Bool)

(declare-fun array_inv!948 (array!2273) Bool)

(assert (=> b!45589 (= e!30372 (array_inv!948 (buf!1372 thiss!1379)))))

(declare-fun b!45590 () Bool)

(declare-fun e!30373 () Bool)

(declare-datatypes ((List!536 0))(
  ( (Nil!533) (Cons!532 (h!651 Bool) (t!1286 List!536)) )
))
(declare-fun lt!69915 () List!536)

(declare-fun length!231 (List!536) Int)

(assert (=> b!45590 (= e!30373 (> (length!231 lt!69915) 0))))

(declare-fun srcBuffer!2 () array!2273)

(declare-fun b!45591 () Bool)

(declare-datatypes ((tuple2!4450 0))(
  ( (tuple2!4451 (_1!2318 BitStream!1790) (_2!2318 BitStream!1790)) )
))
(declare-fun lt!69909 () tuple2!4450)

(declare-fun e!30365 () Bool)

(declare-fun head!355 (List!536) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1790 array!2273 (_ BitVec 64) (_ BitVec 64)) List!536)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1790 BitStream!1790 (_ BitVec 64)) List!536)

(assert (=> b!45591 (= e!30365 (= (head!355 (byteArrayBitContentToList!0 (_2!2317 lt!69921) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!355 (bitStreamReadBitsIntoList!0 (_2!2317 lt!69921) (_1!2318 lt!69909) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!45592 () Bool)

(declare-fun e!30369 () Bool)

(assert (=> b!45592 (= e!30369 e!30366)))

(declare-fun res!38572 () Bool)

(assert (=> b!45592 (=> res!38572 e!30366)))

(assert (=> b!45592 (= res!38572 (not (isPrefixOf!0 (_2!2317 lt!69921) (_2!2317 lt!69912))))))

(assert (=> b!45592 (isPrefixOf!0 thiss!1379 (_2!2317 lt!69912))))

(declare-fun lt!69920 () Unit!3236)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1790 BitStream!1790 BitStream!1790) Unit!3236)

(assert (=> b!45592 (= lt!69920 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2317 lt!69921) (_2!2317 lt!69912)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1790 array!2273 (_ BitVec 64) (_ BitVec 64)) tuple2!4448)

(assert (=> b!45592 (= lt!69912 (appendBitsMSBFirstLoop!0 (_2!2317 lt!69921) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!45592 e!30365))

(declare-fun res!38568 () Bool)

(assert (=> b!45592 (=> (not res!38568) (not e!30365))))

(assert (=> b!45592 (= res!38568 (validate_offset_bits!1 ((_ sign_extend 32) (size!1023 (buf!1372 (_2!2317 lt!69921)))) ((_ sign_extend 32) (currentByte!2865 thiss!1379)) ((_ sign_extend 32) (currentBit!2860 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!69914 () Unit!3236)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1790 array!2273 (_ BitVec 64)) Unit!3236)

(assert (=> b!45592 (= lt!69914 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1372 (_2!2317 lt!69921)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1790 BitStream!1790) tuple2!4450)

(assert (=> b!45592 (= lt!69909 (reader!0 thiss!1379 (_2!2317 lt!69921)))))

(declare-fun b!45594 () Bool)

(declare-fun res!38566 () Bool)

(assert (=> b!45594 (=> res!38566 e!30371)))

(assert (=> b!45594 (= res!38566 (not (invariant!0 (currentBit!2860 (_2!2317 lt!69912)) (currentByte!2865 (_2!2317 lt!69912)) (size!1023 (buf!1372 (_2!2317 lt!69912))))))))

(declare-fun b!45595 () Bool)

(declare-fun res!38569 () Bool)

(assert (=> b!45595 (=> res!38569 e!30371)))

(assert (=> b!45595 (= res!38569 (not (= (size!1023 (buf!1372 thiss!1379)) (size!1023 (buf!1372 (_2!2317 lt!69912))))))))

(declare-fun b!45596 () Bool)

(assert (=> b!45596 (= e!30374 e!30373)))

(declare-fun res!38573 () Bool)

(assert (=> b!45596 (=> res!38573 e!30373)))

(assert (=> b!45596 (= res!38573 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!69908 () (_ BitVec 64))

(declare-fun lt!69911 () tuple2!4450)

(declare-fun lt!69910 () List!536)

(assert (=> b!45596 (= lt!69910 (bitStreamReadBitsIntoList!0 (_2!2317 lt!69912) (_1!2318 lt!69911) lt!69908))))

(declare-fun lt!69918 () tuple2!4450)

(assert (=> b!45596 (= lt!69915 (bitStreamReadBitsIntoList!0 (_2!2317 lt!69912) (_1!2318 lt!69918) (bvsub to!314 i!635)))))

(assert (=> b!45596 (validate_offset_bits!1 ((_ sign_extend 32) (size!1023 (buf!1372 (_2!2317 lt!69912)))) ((_ sign_extend 32) (currentByte!2865 (_2!2317 lt!69921))) ((_ sign_extend 32) (currentBit!2860 (_2!2317 lt!69921))) lt!69908)))

(declare-fun lt!69907 () Unit!3236)

(assert (=> b!45596 (= lt!69907 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2317 lt!69921) (buf!1372 (_2!2317 lt!69912)) lt!69908))))

(assert (=> b!45596 (= lt!69911 (reader!0 (_2!2317 lt!69921) (_2!2317 lt!69912)))))

(assert (=> b!45596 (validate_offset_bits!1 ((_ sign_extend 32) (size!1023 (buf!1372 (_2!2317 lt!69912)))) ((_ sign_extend 32) (currentByte!2865 thiss!1379)) ((_ sign_extend 32) (currentBit!2860 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!69919 () Unit!3236)

(assert (=> b!45596 (= lt!69919 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1372 (_2!2317 lt!69912)) (bvsub to!314 i!635)))))

(assert (=> b!45596 (= lt!69918 (reader!0 thiss!1379 (_2!2317 lt!69912)))))

(declare-fun b!45597 () Bool)

(assert (=> b!45597 (= e!30370 e!30369)))

(declare-fun res!38576 () Bool)

(assert (=> b!45597 (=> res!38576 e!30369)))

(assert (=> b!45597 (= res!38576 (not (isPrefixOf!0 thiss!1379 (_2!2317 lt!69921))))))

(assert (=> b!45597 (validate_offset_bits!1 ((_ sign_extend 32) (size!1023 (buf!1372 (_2!2317 lt!69921)))) ((_ sign_extend 32) (currentByte!2865 (_2!2317 lt!69921))) ((_ sign_extend 32) (currentBit!2860 (_2!2317 lt!69921))) lt!69908)))

(assert (=> b!45597 (= lt!69908 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!69922 () Unit!3236)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1790 BitStream!1790 (_ BitVec 64) (_ BitVec 64)) Unit!3236)

(assert (=> b!45597 (= lt!69922 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2317 lt!69921) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1790 (_ BitVec 8) (_ BitVec 32)) tuple2!4448)

(assert (=> b!45597 (= lt!69921 (appendBitFromByte!0 thiss!1379 (select (arr!1540 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!45598 () Bool)

(declare-fun res!38571 () Bool)

(assert (=> b!45598 (=> res!38571 e!30374)))

(assert (=> b!45598 (= res!38571 (not (invariant!0 (currentBit!2860 (_2!2317 lt!69921)) (currentByte!2865 (_2!2317 lt!69921)) (size!1023 (buf!1372 (_2!2317 lt!69921))))))))

(declare-fun res!38567 () Bool)

(assert (=> start!9168 (=> (not res!38567) (not e!30364))))

(assert (=> start!9168 (= res!38567 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1023 srcBuffer!2))))))))

(assert (=> start!9168 e!30364))

(assert (=> start!9168 true))

(assert (=> start!9168 (array_inv!948 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1790) Bool)

(assert (=> start!9168 (and (inv!12 thiss!1379) e!30372)))

(declare-fun b!45593 () Bool)

(assert (=> b!45593 (= e!30363 (= lt!69913 (bvsub (bvsub (bvadd (bitIndex!0 (size!1023 (buf!1372 (_2!2317 lt!69921))) (currentByte!2865 (_2!2317 lt!69921)) (currentBit!2860 (_2!2317 lt!69921))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and start!9168 res!38567) b!45584))

(assert (= (and b!45584 res!38564) b!45585))

(assert (= (and b!45585 (not res!38570)) b!45597))

(assert (= (and b!45597 (not res!38576)) b!45592))

(assert (= (and b!45592 res!38568) b!45591))

(assert (= (and b!45592 (not res!38572)) b!45586))

(assert (= (and b!45586 (not res!38565)) b!45594))

(assert (= (and b!45594 (not res!38566)) b!45595))

(assert (= (and b!45595 (not res!38569)) b!45588))

(assert (= (and b!45588 res!38574) b!45593))

(assert (= (and b!45588 (not res!38577)) b!45598))

(assert (= (and b!45598 (not res!38571)) b!45587))

(assert (= (and b!45587 (not res!38575)) b!45596))

(assert (= (and b!45596 (not res!38573)) b!45590))

(assert (= start!9168 b!45589))

(declare-fun m!69563 () Bool)

(assert (=> b!45585 m!69563))

(declare-fun m!69565 () Bool)

(assert (=> b!45585 m!69565))

(declare-fun m!69567 () Bool)

(assert (=> b!45585 m!69567))

(declare-fun m!69569 () Bool)

(assert (=> b!45591 m!69569))

(assert (=> b!45591 m!69569))

(declare-fun m!69571 () Bool)

(assert (=> b!45591 m!69571))

(declare-fun m!69573 () Bool)

(assert (=> b!45591 m!69573))

(assert (=> b!45591 m!69573))

(declare-fun m!69575 () Bool)

(assert (=> b!45591 m!69575))

(declare-fun m!69577 () Bool)

(assert (=> b!45598 m!69577))

(declare-fun m!69579 () Bool)

(assert (=> b!45589 m!69579))

(declare-fun m!69581 () Bool)

(assert (=> b!45593 m!69581))

(declare-fun m!69583 () Bool)

(assert (=> b!45594 m!69583))

(declare-fun m!69585 () Bool)

(assert (=> b!45586 m!69585))

(declare-fun m!69587 () Bool)

(assert (=> b!45592 m!69587))

(declare-fun m!69589 () Bool)

(assert (=> b!45592 m!69589))

(declare-fun m!69591 () Bool)

(assert (=> b!45592 m!69591))

(declare-fun m!69593 () Bool)

(assert (=> b!45592 m!69593))

(declare-fun m!69595 () Bool)

(assert (=> b!45592 m!69595))

(declare-fun m!69597 () Bool)

(assert (=> b!45592 m!69597))

(declare-fun m!69599 () Bool)

(assert (=> b!45592 m!69599))

(declare-fun m!69601 () Bool)

(assert (=> b!45587 m!69601))

(declare-fun m!69603 () Bool)

(assert (=> start!9168 m!69603))

(declare-fun m!69605 () Bool)

(assert (=> start!9168 m!69605))

(declare-fun m!69607 () Bool)

(assert (=> b!45590 m!69607))

(declare-fun m!69609 () Bool)

(assert (=> b!45584 m!69609))

(declare-fun m!69611 () Bool)

(assert (=> b!45597 m!69611))

(declare-fun m!69613 () Bool)

(assert (=> b!45597 m!69613))

(assert (=> b!45597 m!69613))

(declare-fun m!69615 () Bool)

(assert (=> b!45597 m!69615))

(declare-fun m!69617 () Bool)

(assert (=> b!45597 m!69617))

(declare-fun m!69619 () Bool)

(assert (=> b!45597 m!69619))

(declare-fun m!69621 () Bool)

(assert (=> b!45596 m!69621))

(declare-fun m!69623 () Bool)

(assert (=> b!45596 m!69623))

(declare-fun m!69625 () Bool)

(assert (=> b!45596 m!69625))

(declare-fun m!69627 () Bool)

(assert (=> b!45596 m!69627))

(declare-fun m!69629 () Bool)

(assert (=> b!45596 m!69629))

(declare-fun m!69631 () Bool)

(assert (=> b!45596 m!69631))

(declare-fun m!69633 () Bool)

(assert (=> b!45596 m!69633))

(declare-fun m!69635 () Bool)

(assert (=> b!45596 m!69635))

(push 1)

(assert (not b!45590))

(assert (not b!45594))

(assert (not b!45589))

(assert (not b!45584))

(assert (not b!45585))

(assert (not b!45593))

(assert (not b!45592))

(assert (not b!45597))

(assert (not b!45598))

(assert (not b!45591))

(assert (not b!45586))

(assert (not b!45596))

(assert (not start!9168))

(assert (not b!45587))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!13274 () Bool)

(declare-fun e!30440 () Bool)

(assert (=> d!13274 e!30440))

(declare-fun res!38660 () Bool)

(assert (=> d!13274 (=> (not res!38660) (not e!30440))))

(declare-fun lt!70185 () (_ BitVec 64))

(declare-fun lt!70189 () (_ BitVec 64))

(declare-fun lt!70188 () (_ BitVec 64))

(assert (=> d!13274 (= res!38660 (= lt!70188 (bvsub lt!70185 lt!70189)))))

(assert (=> d!13274 (or (= (bvand lt!70185 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!70189 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!70185 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!70185 lt!70189) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!13274 (= lt!70189 (remainingBits!0 ((_ sign_extend 32) (size!1023 (buf!1372 (_2!2317 lt!69912)))) ((_ sign_extend 32) (currentByte!2865 (_2!2317 lt!69912))) ((_ sign_extend 32) (currentBit!2860 (_2!2317 lt!69912)))))))

(declare-fun lt!70184 () (_ BitVec 64))

(declare-fun lt!70187 () (_ BitVec 64))

(assert (=> d!13274 (= lt!70185 (bvmul lt!70184 lt!70187))))

(assert (=> d!13274 (or (= lt!70184 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!70187 (bvsdiv (bvmul lt!70184 lt!70187) lt!70184)))))

(assert (=> d!13274 (= lt!70187 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13274 (= lt!70184 ((_ sign_extend 32) (size!1023 (buf!1372 (_2!2317 lt!69912)))))))

(assert (=> d!13274 (= lt!70188 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2865 (_2!2317 lt!69912))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2860 (_2!2317 lt!69912)))))))

(assert (=> d!13274 (invariant!0 (currentBit!2860 (_2!2317 lt!69912)) (currentByte!2865 (_2!2317 lt!69912)) (size!1023 (buf!1372 (_2!2317 lt!69912))))))

(assert (=> d!13274 (= (bitIndex!0 (size!1023 (buf!1372 (_2!2317 lt!69912))) (currentByte!2865 (_2!2317 lt!69912)) (currentBit!2860 (_2!2317 lt!69912))) lt!70188)))

(declare-fun b!45729 () Bool)

(declare-fun res!38659 () Bool)

(assert (=> b!45729 (=> (not res!38659) (not e!30440))))

(assert (=> b!45729 (= res!38659 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!70188))))

(declare-fun b!45730 () Bool)

(declare-fun lt!70186 () (_ BitVec 64))

(assert (=> b!45730 (= e!30440 (bvsle lt!70188 (bvmul lt!70186 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!45730 (or (= lt!70186 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!70186 #b0000000000000000000000000000000000000000000000000000000000001000) lt!70186)))))

(assert (=> b!45730 (= lt!70186 ((_ sign_extend 32) (size!1023 (buf!1372 (_2!2317 lt!69912)))))))

(assert (= (and d!13274 res!38660) b!45729))

(assert (= (and b!45729 res!38659) b!45730))

(declare-fun m!69803 () Bool)

(assert (=> d!13274 m!69803))

(assert (=> d!13274 m!69583))

(assert (=> b!45586 d!13274))

(declare-fun d!13278 () Bool)

(declare-fun res!38676 () Bool)

(declare-fun e!30451 () Bool)

(assert (=> d!13278 (=> (not res!38676) (not e!30451))))

(assert (=> d!13278 (= res!38676 (= (size!1023 (buf!1372 thiss!1379)) (size!1023 (buf!1372 thiss!1379))))))

(assert (=> d!13278 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!30451)))

(declare-fun b!45746 () Bool)

(declare-fun res!38677 () Bool)

(assert (=> b!45746 (=> (not res!38677) (not e!30451))))

(assert (=> b!45746 (= res!38677 (bvsle (bitIndex!0 (size!1023 (buf!1372 thiss!1379)) (currentByte!2865 thiss!1379) (currentBit!2860 thiss!1379)) (bitIndex!0 (size!1023 (buf!1372 thiss!1379)) (currentByte!2865 thiss!1379) (currentBit!2860 thiss!1379))))))

(declare-fun b!45747 () Bool)

(declare-fun e!30452 () Bool)

(assert (=> b!45747 (= e!30451 e!30452)))

(declare-fun res!38678 () Bool)

(assert (=> b!45747 (=> res!38678 e!30452)))

(assert (=> b!45747 (= res!38678 (= (size!1023 (buf!1372 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!45748 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2273 array!2273 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!45748 (= e!30452 (arrayBitRangesEq!0 (buf!1372 thiss!1379) (buf!1372 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1023 (buf!1372 thiss!1379)) (currentByte!2865 thiss!1379) (currentBit!2860 thiss!1379))))))

(assert (= (and d!13278 res!38676) b!45746))

(assert (= (and b!45746 res!38677) b!45747))

(assert (= (and b!45747 (not res!38678)) b!45748))

(assert (=> b!45746 m!69567))

(assert (=> b!45746 m!69567))

(assert (=> b!45748 m!69567))

(assert (=> b!45748 m!69567))

(declare-fun m!69807 () Bool)

(assert (=> b!45748 m!69807))

(assert (=> b!45585 d!13278))

(declare-fun d!13282 () Bool)

(assert (=> d!13282 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!70192 () Unit!3236)

(declare-fun choose!11 (BitStream!1790) Unit!3236)

(assert (=> d!13282 (= lt!70192 (choose!11 thiss!1379))))

(assert (=> d!13282 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!70192)))

(declare-fun bs!3516 () Bool)

(assert (= bs!3516 d!13282))

(assert (=> bs!3516 m!69563))

(declare-fun m!69811 () Bool)

(assert (=> bs!3516 m!69811))

(assert (=> b!45585 d!13282))

(declare-fun d!13286 () Bool)

(declare-fun e!30453 () Bool)

(assert (=> d!13286 e!30453))

(declare-fun res!38680 () Bool)

(assert (=> d!13286 (=> (not res!38680) (not e!30453))))

(declare-fun lt!70200 () (_ BitVec 64))

(declare-fun lt!70196 () (_ BitVec 64))

(declare-fun lt!70199 () (_ BitVec 64))

(assert (=> d!13286 (= res!38680 (= lt!70199 (bvsub lt!70196 lt!70200)))))

(assert (=> d!13286 (or (= (bvand lt!70196 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!70200 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!70196 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!70196 lt!70200) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13286 (= lt!70200 (remainingBits!0 ((_ sign_extend 32) (size!1023 (buf!1372 thiss!1379))) ((_ sign_extend 32) (currentByte!2865 thiss!1379)) ((_ sign_extend 32) (currentBit!2860 thiss!1379))))))

(declare-fun lt!70195 () (_ BitVec 64))

(declare-fun lt!70198 () (_ BitVec 64))

(assert (=> d!13286 (= lt!70196 (bvmul lt!70195 lt!70198))))

(assert (=> d!13286 (or (= lt!70195 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!70198 (bvsdiv (bvmul lt!70195 lt!70198) lt!70195)))))

(assert (=> d!13286 (= lt!70198 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13286 (= lt!70195 ((_ sign_extend 32) (size!1023 (buf!1372 thiss!1379))))))

(assert (=> d!13286 (= lt!70199 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2865 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2860 thiss!1379))))))

(assert (=> d!13286 (invariant!0 (currentBit!2860 thiss!1379) (currentByte!2865 thiss!1379) (size!1023 (buf!1372 thiss!1379)))))

(assert (=> d!13286 (= (bitIndex!0 (size!1023 (buf!1372 thiss!1379)) (currentByte!2865 thiss!1379) (currentBit!2860 thiss!1379)) lt!70199)))

(declare-fun b!45749 () Bool)

(declare-fun res!38679 () Bool)

(assert (=> b!45749 (=> (not res!38679) (not e!30453))))

(assert (=> b!45749 (= res!38679 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!70199))))

(declare-fun b!45750 () Bool)

(declare-fun lt!70197 () (_ BitVec 64))

(assert (=> b!45750 (= e!30453 (bvsle lt!70199 (bvmul lt!70197 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!45750 (or (= lt!70197 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!70197 #b0000000000000000000000000000000000000000000000000000000000001000) lt!70197)))))

(assert (=> b!45750 (= lt!70197 ((_ sign_extend 32) (size!1023 (buf!1372 thiss!1379))))))

(assert (= (and d!13286 res!38680) b!45749))

(assert (= (and b!45749 res!38679) b!45750))

(declare-fun m!69813 () Bool)

(assert (=> d!13286 m!69813))

(declare-fun m!69815 () Bool)

(assert (=> d!13286 m!69815))

(assert (=> b!45585 d!13286))

(declare-fun d!13288 () Bool)

(assert (=> d!13288 (validate_offset_bits!1 ((_ sign_extend 32) (size!1023 (buf!1372 (_2!2317 lt!69912)))) ((_ sign_extend 32) (currentByte!2865 (_2!2317 lt!69921))) ((_ sign_extend 32) (currentBit!2860 (_2!2317 lt!69921))) lt!69908)))

(declare-fun lt!70204 () Unit!3236)

(declare-fun choose!9 (BitStream!1790 array!2273 (_ BitVec 64) BitStream!1790) Unit!3236)

(assert (=> d!13288 (= lt!70204 (choose!9 (_2!2317 lt!69921) (buf!1372 (_2!2317 lt!69912)) lt!69908 (BitStream!1791 (buf!1372 (_2!2317 lt!69912)) (currentByte!2865 (_2!2317 lt!69921)) (currentBit!2860 (_2!2317 lt!69921)))))))

(assert (=> d!13288 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2317 lt!69921) (buf!1372 (_2!2317 lt!69912)) lt!69908) lt!70204)))

(declare-fun bs!3518 () Bool)

(assert (= bs!3518 d!13288))

(assert (=> bs!3518 m!69621))

(declare-fun m!69821 () Bool)

(assert (=> bs!3518 m!69821))

(assert (=> b!45596 d!13288))

(declare-fun b!45764 () Bool)

(declare-fun e!30460 () Unit!3236)

(declare-fun lt!70262 () Unit!3236)

(assert (=> b!45764 (= e!30460 lt!70262)))

(declare-fun lt!70258 () (_ BitVec 64))

(assert (=> b!45764 (= lt!70258 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!70253 () (_ BitVec 64))

(assert (=> b!45764 (= lt!70253 (bitIndex!0 (size!1023 (buf!1372 thiss!1379)) (currentByte!2865 thiss!1379) (currentBit!2860 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2273 array!2273 (_ BitVec 64) (_ BitVec 64)) Unit!3236)

(assert (=> b!45764 (= lt!70262 (arrayBitRangesEqSymmetric!0 (buf!1372 thiss!1379) (buf!1372 (_2!2317 lt!69912)) lt!70258 lt!70253))))

(assert (=> b!45764 (arrayBitRangesEq!0 (buf!1372 (_2!2317 lt!69912)) (buf!1372 thiss!1379) lt!70258 lt!70253)))

(declare-fun b!45765 () Bool)

(declare-fun Unit!3256 () Unit!3236)

(assert (=> b!45765 (= e!30460 Unit!3256)))

(declare-fun d!13294 () Bool)

(declare-fun e!30461 () Bool)

(assert (=> d!13294 e!30461))

(declare-fun res!38692 () Bool)

(assert (=> d!13294 (=> (not res!38692) (not e!30461))))

(declare-fun lt!70249 () tuple2!4450)

(assert (=> d!13294 (= res!38692 (isPrefixOf!0 (_1!2318 lt!70249) (_2!2318 lt!70249)))))

(declare-fun lt!70256 () BitStream!1790)

(assert (=> d!13294 (= lt!70249 (tuple2!4451 lt!70256 (_2!2317 lt!69912)))))

(declare-fun lt!70265 () Unit!3236)

(declare-fun lt!70250 () Unit!3236)

(assert (=> d!13294 (= lt!70265 lt!70250)))

(assert (=> d!13294 (isPrefixOf!0 lt!70256 (_2!2317 lt!69912))))

(assert (=> d!13294 (= lt!70250 (lemmaIsPrefixTransitive!0 lt!70256 (_2!2317 lt!69912) (_2!2317 lt!69912)))))

(declare-fun lt!70266 () Unit!3236)

(declare-fun lt!70264 () Unit!3236)

(assert (=> d!13294 (= lt!70266 lt!70264)))

(assert (=> d!13294 (isPrefixOf!0 lt!70256 (_2!2317 lt!69912))))

(assert (=> d!13294 (= lt!70264 (lemmaIsPrefixTransitive!0 lt!70256 thiss!1379 (_2!2317 lt!69912)))))

(declare-fun lt!70255 () Unit!3236)

(assert (=> d!13294 (= lt!70255 e!30460)))

(declare-fun c!3075 () Bool)

(assert (=> d!13294 (= c!3075 (not (= (size!1023 (buf!1372 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!70251 () Unit!3236)

(declare-fun lt!70257 () Unit!3236)

(assert (=> d!13294 (= lt!70251 lt!70257)))

(assert (=> d!13294 (isPrefixOf!0 (_2!2317 lt!69912) (_2!2317 lt!69912))))

(assert (=> d!13294 (= lt!70257 (lemmaIsPrefixRefl!0 (_2!2317 lt!69912)))))

(declare-fun lt!70248 () Unit!3236)

(declare-fun lt!70252 () Unit!3236)

(assert (=> d!13294 (= lt!70248 lt!70252)))

(assert (=> d!13294 (= lt!70252 (lemmaIsPrefixRefl!0 (_2!2317 lt!69912)))))

(declare-fun lt!70260 () Unit!3236)

(declare-fun lt!70267 () Unit!3236)

(assert (=> d!13294 (= lt!70260 lt!70267)))

(assert (=> d!13294 (isPrefixOf!0 lt!70256 lt!70256)))

(assert (=> d!13294 (= lt!70267 (lemmaIsPrefixRefl!0 lt!70256))))

(declare-fun lt!70254 () Unit!3236)

(declare-fun lt!70263 () Unit!3236)

(assert (=> d!13294 (= lt!70254 lt!70263)))

(assert (=> d!13294 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!13294 (= lt!70263 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!13294 (= lt!70256 (BitStream!1791 (buf!1372 (_2!2317 lt!69912)) (currentByte!2865 thiss!1379) (currentBit!2860 thiss!1379)))))

(assert (=> d!13294 (isPrefixOf!0 thiss!1379 (_2!2317 lt!69912))))

(assert (=> d!13294 (= (reader!0 thiss!1379 (_2!2317 lt!69912)) lt!70249)))

(declare-fun b!45766 () Bool)

(declare-fun res!38691 () Bool)

(assert (=> b!45766 (=> (not res!38691) (not e!30461))))

(assert (=> b!45766 (= res!38691 (isPrefixOf!0 (_1!2318 lt!70249) thiss!1379))))

(declare-fun b!45767 () Bool)

(declare-fun res!38690 () Bool)

(assert (=> b!45767 (=> (not res!38690) (not e!30461))))

(assert (=> b!45767 (= res!38690 (isPrefixOf!0 (_2!2318 lt!70249) (_2!2317 lt!69912)))))

(declare-fun b!45768 () Bool)

(declare-fun lt!70261 () (_ BitVec 64))

(declare-fun lt!70259 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1790 (_ BitVec 64)) BitStream!1790)

(assert (=> b!45768 (= e!30461 (= (_1!2318 lt!70249) (withMovedBitIndex!0 (_2!2318 lt!70249) (bvsub lt!70261 lt!70259))))))

(assert (=> b!45768 (or (= (bvand lt!70261 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!70259 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!70261 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!70261 lt!70259) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!45768 (= lt!70259 (bitIndex!0 (size!1023 (buf!1372 (_2!2317 lt!69912))) (currentByte!2865 (_2!2317 lt!69912)) (currentBit!2860 (_2!2317 lt!69912))))))

(assert (=> b!45768 (= lt!70261 (bitIndex!0 (size!1023 (buf!1372 thiss!1379)) (currentByte!2865 thiss!1379) (currentBit!2860 thiss!1379)))))

(assert (= (and d!13294 c!3075) b!45764))

(assert (= (and d!13294 (not c!3075)) b!45765))

(assert (= (and d!13294 res!38692) b!45766))

(assert (= (and b!45766 res!38691) b!45767))

(assert (= (and b!45767 res!38690) b!45768))

(declare-fun m!69825 () Bool)

(assert (=> d!13294 m!69825))

(assert (=> d!13294 m!69565))

(declare-fun m!69827 () Bool)

(assert (=> d!13294 m!69827))

(declare-fun m!69829 () Bool)

(assert (=> d!13294 m!69829))

(declare-fun m!69831 () Bool)

(assert (=> d!13294 m!69831))

(assert (=> d!13294 m!69599))

(declare-fun m!69833 () Bool)

(assert (=> d!13294 m!69833))

(declare-fun m!69835 () Bool)

(assert (=> d!13294 m!69835))

(assert (=> d!13294 m!69563))

(declare-fun m!69837 () Bool)

(assert (=> d!13294 m!69837))

(declare-fun m!69839 () Bool)

(assert (=> d!13294 m!69839))

(declare-fun m!69841 () Bool)

(assert (=> b!45766 m!69841))

(declare-fun m!69843 () Bool)

(assert (=> b!45768 m!69843))

(assert (=> b!45768 m!69585))

(assert (=> b!45768 m!69567))

(assert (=> b!45764 m!69567))

(declare-fun m!69845 () Bool)

(assert (=> b!45764 m!69845))

(declare-fun m!69847 () Bool)

(assert (=> b!45764 m!69847))

(declare-fun m!69849 () Bool)

(assert (=> b!45767 m!69849))

(assert (=> b!45596 d!13294))

(declare-fun d!13298 () Bool)

(declare-fun e!30467 () Bool)

(assert (=> d!13298 e!30467))

(declare-fun c!3080 () Bool)

(assert (=> d!13298 (= c!3080 (= lt!69908 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!70275 () List!536)

(declare-datatypes ((tuple2!4466 0))(
  ( (tuple2!4467 (_1!2326 List!536) (_2!2326 BitStream!1790)) )
))
(declare-fun e!30466 () tuple2!4466)

(assert (=> d!13298 (= lt!70275 (_1!2326 e!30466))))

(declare-fun c!3081 () Bool)

(assert (=> d!13298 (= c!3081 (= lt!69908 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13298 (bvsge lt!69908 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13298 (= (bitStreamReadBitsIntoList!0 (_2!2317 lt!69912) (_1!2318 lt!69911) lt!69908) lt!70275)))

(declare-fun b!45777 () Bool)

(assert (=> b!45777 (= e!30466 (tuple2!4467 Nil!533 (_1!2318 lt!69911)))))

(declare-fun b!45780 () Bool)

(assert (=> b!45780 (= e!30467 (> (length!231 lt!70275) 0))))

(declare-fun lt!70274 () (_ BitVec 64))

(declare-fun b!45778 () Bool)

(declare-datatypes ((tuple2!4468 0))(
  ( (tuple2!4469 (_1!2327 Bool) (_2!2327 BitStream!1790)) )
))
(declare-fun lt!70276 () tuple2!4468)

(assert (=> b!45778 (= e!30466 (tuple2!4467 (Cons!532 (_1!2327 lt!70276) (bitStreamReadBitsIntoList!0 (_2!2317 lt!69912) (_2!2327 lt!70276) (bvsub lt!69908 lt!70274))) (_2!2327 lt!70276)))))

(declare-fun readBit!0 (BitStream!1790) tuple2!4468)

(assert (=> b!45778 (= lt!70276 (readBit!0 (_1!2318 lt!69911)))))

(assert (=> b!45778 (= lt!70274 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!45779 () Bool)

(declare-fun isEmpty!133 (List!536) Bool)

(assert (=> b!45779 (= e!30467 (isEmpty!133 lt!70275))))

(assert (= (and d!13298 c!3081) b!45777))

(assert (= (and d!13298 (not c!3081)) b!45778))

(assert (= (and d!13298 c!3080) b!45779))

(assert (= (and d!13298 (not c!3080)) b!45780))

(declare-fun m!69851 () Bool)

(assert (=> b!45780 m!69851))

(declare-fun m!69853 () Bool)

(assert (=> b!45778 m!69853))

(declare-fun m!69855 () Bool)

(assert (=> b!45778 m!69855))

(declare-fun m!69857 () Bool)

(assert (=> b!45779 m!69857))

(assert (=> b!45596 d!13298))

(declare-fun d!13300 () Bool)

(declare-fun e!30469 () Bool)

(assert (=> d!13300 e!30469))

(declare-fun c!3082 () Bool)

(assert (=> d!13300 (= c!3082 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!70278 () List!536)

(declare-fun e!30468 () tuple2!4466)

(assert (=> d!13300 (= lt!70278 (_1!2326 e!30468))))

(declare-fun c!3083 () Bool)

(assert (=> d!13300 (= c!3083 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13300 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13300 (= (bitStreamReadBitsIntoList!0 (_2!2317 lt!69912) (_1!2318 lt!69918) (bvsub to!314 i!635)) lt!70278)))

(declare-fun b!45781 () Bool)

(assert (=> b!45781 (= e!30468 (tuple2!4467 Nil!533 (_1!2318 lt!69918)))))

(declare-fun b!45784 () Bool)

(assert (=> b!45784 (= e!30469 (> (length!231 lt!70278) 0))))

(declare-fun lt!70277 () (_ BitVec 64))

(declare-fun lt!70279 () tuple2!4468)

(declare-fun b!45782 () Bool)

(assert (=> b!45782 (= e!30468 (tuple2!4467 (Cons!532 (_1!2327 lt!70279) (bitStreamReadBitsIntoList!0 (_2!2317 lt!69912) (_2!2327 lt!70279) (bvsub (bvsub to!314 i!635) lt!70277))) (_2!2327 lt!70279)))))

(assert (=> b!45782 (= lt!70279 (readBit!0 (_1!2318 lt!69918)))))

(assert (=> b!45782 (= lt!70277 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!45783 () Bool)

(assert (=> b!45783 (= e!30469 (isEmpty!133 lt!70278))))

(assert (= (and d!13300 c!3083) b!45781))

(assert (= (and d!13300 (not c!3083)) b!45782))

(assert (= (and d!13300 c!3082) b!45783))

(assert (= (and d!13300 (not c!3082)) b!45784))

(declare-fun m!69859 () Bool)

(assert (=> b!45784 m!69859))

(declare-fun m!69861 () Bool)

(assert (=> b!45782 m!69861))

(declare-fun m!69863 () Bool)

(assert (=> b!45782 m!69863))

(declare-fun m!69865 () Bool)

(assert (=> b!45783 m!69865))

(assert (=> b!45596 d!13300))

(declare-fun b!45785 () Bool)

(declare-fun e!30470 () Unit!3236)

(declare-fun lt!70294 () Unit!3236)

(assert (=> b!45785 (= e!30470 lt!70294)))

(declare-fun lt!70290 () (_ BitVec 64))

(assert (=> b!45785 (= lt!70290 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!70285 () (_ BitVec 64))

(assert (=> b!45785 (= lt!70285 (bitIndex!0 (size!1023 (buf!1372 (_2!2317 lt!69921))) (currentByte!2865 (_2!2317 lt!69921)) (currentBit!2860 (_2!2317 lt!69921))))))

(assert (=> b!45785 (= lt!70294 (arrayBitRangesEqSymmetric!0 (buf!1372 (_2!2317 lt!69921)) (buf!1372 (_2!2317 lt!69912)) lt!70290 lt!70285))))

(assert (=> b!45785 (arrayBitRangesEq!0 (buf!1372 (_2!2317 lt!69912)) (buf!1372 (_2!2317 lt!69921)) lt!70290 lt!70285)))

(declare-fun b!45786 () Bool)

(declare-fun Unit!3258 () Unit!3236)

(assert (=> b!45786 (= e!30470 Unit!3258)))

(declare-fun d!13302 () Bool)

(declare-fun e!30471 () Bool)

(assert (=> d!13302 e!30471))

(declare-fun res!38695 () Bool)

(assert (=> d!13302 (=> (not res!38695) (not e!30471))))

(declare-fun lt!70281 () tuple2!4450)

(assert (=> d!13302 (= res!38695 (isPrefixOf!0 (_1!2318 lt!70281) (_2!2318 lt!70281)))))

(declare-fun lt!70288 () BitStream!1790)

(assert (=> d!13302 (= lt!70281 (tuple2!4451 lt!70288 (_2!2317 lt!69912)))))

(declare-fun lt!70297 () Unit!3236)

(declare-fun lt!70282 () Unit!3236)

(assert (=> d!13302 (= lt!70297 lt!70282)))

(assert (=> d!13302 (isPrefixOf!0 lt!70288 (_2!2317 lt!69912))))

(assert (=> d!13302 (= lt!70282 (lemmaIsPrefixTransitive!0 lt!70288 (_2!2317 lt!69912) (_2!2317 lt!69912)))))

(declare-fun lt!70298 () Unit!3236)

(declare-fun lt!70296 () Unit!3236)

(assert (=> d!13302 (= lt!70298 lt!70296)))

(assert (=> d!13302 (isPrefixOf!0 lt!70288 (_2!2317 lt!69912))))

(assert (=> d!13302 (= lt!70296 (lemmaIsPrefixTransitive!0 lt!70288 (_2!2317 lt!69921) (_2!2317 lt!69912)))))

(declare-fun lt!70287 () Unit!3236)

(assert (=> d!13302 (= lt!70287 e!30470)))

(declare-fun c!3084 () Bool)

(assert (=> d!13302 (= c!3084 (not (= (size!1023 (buf!1372 (_2!2317 lt!69921))) #b00000000000000000000000000000000)))))

(declare-fun lt!70283 () Unit!3236)

(declare-fun lt!70289 () Unit!3236)

(assert (=> d!13302 (= lt!70283 lt!70289)))

(assert (=> d!13302 (isPrefixOf!0 (_2!2317 lt!69912) (_2!2317 lt!69912))))

(assert (=> d!13302 (= lt!70289 (lemmaIsPrefixRefl!0 (_2!2317 lt!69912)))))

(declare-fun lt!70280 () Unit!3236)

(declare-fun lt!70284 () Unit!3236)

(assert (=> d!13302 (= lt!70280 lt!70284)))

(assert (=> d!13302 (= lt!70284 (lemmaIsPrefixRefl!0 (_2!2317 lt!69912)))))

(declare-fun lt!70292 () Unit!3236)

(declare-fun lt!70299 () Unit!3236)

(assert (=> d!13302 (= lt!70292 lt!70299)))

(assert (=> d!13302 (isPrefixOf!0 lt!70288 lt!70288)))

(assert (=> d!13302 (= lt!70299 (lemmaIsPrefixRefl!0 lt!70288))))

(declare-fun lt!70286 () Unit!3236)

(declare-fun lt!70295 () Unit!3236)

(assert (=> d!13302 (= lt!70286 lt!70295)))

(assert (=> d!13302 (isPrefixOf!0 (_2!2317 lt!69921) (_2!2317 lt!69921))))

(assert (=> d!13302 (= lt!70295 (lemmaIsPrefixRefl!0 (_2!2317 lt!69921)))))

(assert (=> d!13302 (= lt!70288 (BitStream!1791 (buf!1372 (_2!2317 lt!69912)) (currentByte!2865 (_2!2317 lt!69921)) (currentBit!2860 (_2!2317 lt!69921))))))

(assert (=> d!13302 (isPrefixOf!0 (_2!2317 lt!69921) (_2!2317 lt!69912))))

(assert (=> d!13302 (= (reader!0 (_2!2317 lt!69921) (_2!2317 lt!69912)) lt!70281)))

(declare-fun b!45787 () Bool)

(declare-fun res!38694 () Bool)

(assert (=> b!45787 (=> (not res!38694) (not e!30471))))

(assert (=> b!45787 (= res!38694 (isPrefixOf!0 (_1!2318 lt!70281) (_2!2317 lt!69921)))))

(declare-fun b!45788 () Bool)

(declare-fun res!38693 () Bool)

(assert (=> b!45788 (=> (not res!38693) (not e!30471))))

(assert (=> b!45788 (= res!38693 (isPrefixOf!0 (_2!2318 lt!70281) (_2!2317 lt!69912)))))

(declare-fun lt!70293 () (_ BitVec 64))

(declare-fun lt!70291 () (_ BitVec 64))

(declare-fun b!45789 () Bool)

(assert (=> b!45789 (= e!30471 (= (_1!2318 lt!70281) (withMovedBitIndex!0 (_2!2318 lt!70281) (bvsub lt!70293 lt!70291))))))

(assert (=> b!45789 (or (= (bvand lt!70293 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!70291 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!70293 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!70293 lt!70291) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!45789 (= lt!70291 (bitIndex!0 (size!1023 (buf!1372 (_2!2317 lt!69912))) (currentByte!2865 (_2!2317 lt!69912)) (currentBit!2860 (_2!2317 lt!69912))))))

(assert (=> b!45789 (= lt!70293 (bitIndex!0 (size!1023 (buf!1372 (_2!2317 lt!69921))) (currentByte!2865 (_2!2317 lt!69921)) (currentBit!2860 (_2!2317 lt!69921))))))

(assert (= (and d!13302 c!3084) b!45785))

(assert (= (and d!13302 (not c!3084)) b!45786))

(assert (= (and d!13302 res!38695) b!45787))

(assert (= (and b!45787 res!38694) b!45788))

(assert (= (and b!45788 res!38693) b!45789))

(declare-fun m!69867 () Bool)

(assert (=> d!13302 m!69867))

(declare-fun m!69869 () Bool)

(assert (=> d!13302 m!69869))

(declare-fun m!69871 () Bool)

(assert (=> d!13302 m!69871))

(declare-fun m!69873 () Bool)

(assert (=> d!13302 m!69873))

(assert (=> d!13302 m!69831))

(assert (=> d!13302 m!69593))

(assert (=> d!13302 m!69833))

(declare-fun m!69875 () Bool)

(assert (=> d!13302 m!69875))

(declare-fun m!69877 () Bool)

(assert (=> d!13302 m!69877))

(declare-fun m!69879 () Bool)

(assert (=> d!13302 m!69879))

(declare-fun m!69881 () Bool)

(assert (=> d!13302 m!69881))

(declare-fun m!69883 () Bool)

(assert (=> b!45787 m!69883))

(declare-fun m!69885 () Bool)

(assert (=> b!45789 m!69885))

(assert (=> b!45789 m!69585))

(assert (=> b!45789 m!69581))

(assert (=> b!45785 m!69581))

(declare-fun m!69887 () Bool)

(assert (=> b!45785 m!69887))

(declare-fun m!69889 () Bool)

(assert (=> b!45785 m!69889))

(declare-fun m!69891 () Bool)

(assert (=> b!45788 m!69891))

(assert (=> b!45596 d!13302))

(declare-fun d!13304 () Bool)

(assert (=> d!13304 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1023 (buf!1372 (_2!2317 lt!69912)))) ((_ sign_extend 32) (currentByte!2865 (_2!2317 lt!69921))) ((_ sign_extend 32) (currentBit!2860 (_2!2317 lt!69921))) lt!69908) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1023 (buf!1372 (_2!2317 lt!69912)))) ((_ sign_extend 32) (currentByte!2865 (_2!2317 lt!69921))) ((_ sign_extend 32) (currentBit!2860 (_2!2317 lt!69921)))) lt!69908))))

(declare-fun bs!3520 () Bool)

(assert (= bs!3520 d!13304))

(declare-fun m!69893 () Bool)

(assert (=> bs!3520 m!69893))

(assert (=> b!45596 d!13304))

(declare-fun d!13306 () Bool)

(assert (=> d!13306 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1023 (buf!1372 (_2!2317 lt!69912)))) ((_ sign_extend 32) (currentByte!2865 thiss!1379)) ((_ sign_extend 32) (currentBit!2860 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1023 (buf!1372 (_2!2317 lt!69912)))) ((_ sign_extend 32) (currentByte!2865 thiss!1379)) ((_ sign_extend 32) (currentBit!2860 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3521 () Bool)

(assert (= bs!3521 d!13306))

(declare-fun m!69895 () Bool)

(assert (=> bs!3521 m!69895))

(assert (=> b!45596 d!13306))

(declare-fun d!13308 () Bool)

(assert (=> d!13308 (validate_offset_bits!1 ((_ sign_extend 32) (size!1023 (buf!1372 (_2!2317 lt!69912)))) ((_ sign_extend 32) (currentByte!2865 thiss!1379)) ((_ sign_extend 32) (currentBit!2860 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!70300 () Unit!3236)

(assert (=> d!13308 (= lt!70300 (choose!9 thiss!1379 (buf!1372 (_2!2317 lt!69912)) (bvsub to!314 i!635) (BitStream!1791 (buf!1372 (_2!2317 lt!69912)) (currentByte!2865 thiss!1379) (currentBit!2860 thiss!1379))))))

(assert (=> d!13308 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1372 (_2!2317 lt!69912)) (bvsub to!314 i!635)) lt!70300)))

(declare-fun bs!3522 () Bool)

(assert (= bs!3522 d!13308))

(assert (=> bs!3522 m!69623))

(declare-fun m!69897 () Bool)

(assert (=> bs!3522 m!69897))

(assert (=> b!45596 d!13308))

(declare-fun d!13310 () Bool)

(assert (=> d!13310 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1023 (buf!1372 thiss!1379))) ((_ sign_extend 32) (currentByte!2865 thiss!1379)) ((_ sign_extend 32) (currentBit!2860 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1023 (buf!1372 thiss!1379))) ((_ sign_extend 32) (currentByte!2865 thiss!1379)) ((_ sign_extend 32) (currentBit!2860 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3523 () Bool)

(assert (= bs!3523 d!13310))

(assert (=> bs!3523 m!69813))

(assert (=> b!45584 d!13310))

(declare-fun d!13312 () Bool)

(assert (=> d!13312 (= (invariant!0 (currentBit!2860 (_2!2317 lt!69921)) (currentByte!2865 (_2!2317 lt!69921)) (size!1023 (buf!1372 (_2!2317 lt!69912)))) (and (bvsge (currentBit!2860 (_2!2317 lt!69921)) #b00000000000000000000000000000000) (bvslt (currentBit!2860 (_2!2317 lt!69921)) #b00000000000000000000000000001000) (bvsge (currentByte!2865 (_2!2317 lt!69921)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2865 (_2!2317 lt!69921)) (size!1023 (buf!1372 (_2!2317 lt!69912)))) (and (= (currentBit!2860 (_2!2317 lt!69921)) #b00000000000000000000000000000000) (= (currentByte!2865 (_2!2317 lt!69921)) (size!1023 (buf!1372 (_2!2317 lt!69912))))))))))

(assert (=> b!45587 d!13312))

(declare-fun d!13314 () Bool)

(assert (=> d!13314 (= (array_inv!948 srcBuffer!2) (bvsge (size!1023 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!9168 d!13314))

(declare-fun d!13316 () Bool)

(assert (=> d!13316 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2860 thiss!1379) (currentByte!2865 thiss!1379) (size!1023 (buf!1372 thiss!1379))))))

(declare-fun bs!3524 () Bool)

(assert (= bs!3524 d!13316))

(assert (=> bs!3524 m!69815))

(assert (=> start!9168 d!13316))

(declare-fun d!13318 () Bool)

(assert (=> d!13318 (= (invariant!0 (currentBit!2860 (_2!2317 lt!69921)) (currentByte!2865 (_2!2317 lt!69921)) (size!1023 (buf!1372 (_2!2317 lt!69921)))) (and (bvsge (currentBit!2860 (_2!2317 lt!69921)) #b00000000000000000000000000000000) (bvslt (currentBit!2860 (_2!2317 lt!69921)) #b00000000000000000000000000001000) (bvsge (currentByte!2865 (_2!2317 lt!69921)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2865 (_2!2317 lt!69921)) (size!1023 (buf!1372 (_2!2317 lt!69921)))) (and (= (currentBit!2860 (_2!2317 lt!69921)) #b00000000000000000000000000000000) (= (currentByte!2865 (_2!2317 lt!69921)) (size!1023 (buf!1372 (_2!2317 lt!69921))))))))))

(assert (=> b!45598 d!13318))

(declare-fun d!13320 () Bool)

(declare-fun res!38696 () Bool)

(declare-fun e!30472 () Bool)

(assert (=> d!13320 (=> (not res!38696) (not e!30472))))

(assert (=> d!13320 (= res!38696 (= (size!1023 (buf!1372 thiss!1379)) (size!1023 (buf!1372 (_2!2317 lt!69921)))))))

(assert (=> d!13320 (= (isPrefixOf!0 thiss!1379 (_2!2317 lt!69921)) e!30472)))

(declare-fun b!45790 () Bool)

(declare-fun res!38697 () Bool)

(assert (=> b!45790 (=> (not res!38697) (not e!30472))))

(assert (=> b!45790 (= res!38697 (bvsle (bitIndex!0 (size!1023 (buf!1372 thiss!1379)) (currentByte!2865 thiss!1379) (currentBit!2860 thiss!1379)) (bitIndex!0 (size!1023 (buf!1372 (_2!2317 lt!69921))) (currentByte!2865 (_2!2317 lt!69921)) (currentBit!2860 (_2!2317 lt!69921)))))))

(declare-fun b!45791 () Bool)

(declare-fun e!30473 () Bool)

(assert (=> b!45791 (= e!30472 e!30473)))

(declare-fun res!38698 () Bool)

(assert (=> b!45791 (=> res!38698 e!30473)))

(assert (=> b!45791 (= res!38698 (= (size!1023 (buf!1372 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!45792 () Bool)

(assert (=> b!45792 (= e!30473 (arrayBitRangesEq!0 (buf!1372 thiss!1379) (buf!1372 (_2!2317 lt!69921)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1023 (buf!1372 thiss!1379)) (currentByte!2865 thiss!1379) (currentBit!2860 thiss!1379))))))

(assert (= (and d!13320 res!38696) b!45790))

(assert (= (and b!45790 res!38697) b!45791))

(assert (= (and b!45791 (not res!38698)) b!45792))

(assert (=> b!45790 m!69567))

(assert (=> b!45790 m!69581))

(assert (=> b!45792 m!69567))

(assert (=> b!45792 m!69567))

(declare-fun m!69899 () Bool)

(assert (=> b!45792 m!69899))

(assert (=> b!45597 d!13320))

(declare-fun d!13322 () Bool)

(assert (=> d!13322 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1023 (buf!1372 (_2!2317 lt!69921)))) ((_ sign_extend 32) (currentByte!2865 (_2!2317 lt!69921))) ((_ sign_extend 32) (currentBit!2860 (_2!2317 lt!69921))) lt!69908) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1023 (buf!1372 (_2!2317 lt!69921)))) ((_ sign_extend 32) (currentByte!2865 (_2!2317 lt!69921))) ((_ sign_extend 32) (currentBit!2860 (_2!2317 lt!69921)))) lt!69908))))

(declare-fun bs!3525 () Bool)

(assert (= bs!3525 d!13322))

(declare-fun m!69901 () Bool)

(assert (=> bs!3525 m!69901))

(assert (=> b!45597 d!13322))

(declare-fun d!13324 () Bool)

(declare-fun e!30476 () Bool)

(assert (=> d!13324 e!30476))

(declare-fun res!38701 () Bool)

(assert (=> d!13324 (=> (not res!38701) (not e!30476))))

(assert (=> d!13324 (= res!38701 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!70303 () Unit!3236)

(declare-fun choose!27 (BitStream!1790 BitStream!1790 (_ BitVec 64) (_ BitVec 64)) Unit!3236)

(assert (=> d!13324 (= lt!70303 (choose!27 thiss!1379 (_2!2317 lt!69921) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!13324 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!13324 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2317 lt!69921) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!70303)))

(declare-fun b!45795 () Bool)

(assert (=> b!45795 (= e!30476 (validate_offset_bits!1 ((_ sign_extend 32) (size!1023 (buf!1372 (_2!2317 lt!69921)))) ((_ sign_extend 32) (currentByte!2865 (_2!2317 lt!69921))) ((_ sign_extend 32) (currentBit!2860 (_2!2317 lt!69921))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!13324 res!38701) b!45795))

(declare-fun m!69903 () Bool)

(assert (=> d!13324 m!69903))

(declare-fun m!69905 () Bool)

(assert (=> b!45795 m!69905))

(assert (=> b!45597 d!13324))

(declare-fun b!45813 () Bool)

(declare-fun e!30487 () Bool)

(declare-datatypes ((tuple2!4472 0))(
  ( (tuple2!4473 (_1!2329 BitStream!1790) (_2!2329 Bool)) )
))
(declare-fun lt!70335 () tuple2!4472)

(declare-fun lt!70334 () tuple2!4448)

(assert (=> b!45813 (= e!30487 (= (bitIndex!0 (size!1023 (buf!1372 (_1!2329 lt!70335))) (currentByte!2865 (_1!2329 lt!70335)) (currentBit!2860 (_1!2329 lt!70335))) (bitIndex!0 (size!1023 (buf!1372 (_2!2317 lt!70334))) (currentByte!2865 (_2!2317 lt!70334)) (currentBit!2860 (_2!2317 lt!70334)))))))

(declare-fun b!45814 () Bool)

(declare-fun e!30486 () Bool)

(assert (=> b!45814 (= e!30486 e!30487)))

(declare-fun res!38721 () Bool)

(assert (=> b!45814 (=> (not res!38721) (not e!30487))))

(declare-fun lt!70337 () Bool)

(assert (=> b!45814 (= res!38721 (and (= (_2!2329 lt!70335) lt!70337) (= (_1!2329 lt!70335) (_2!2317 lt!70334))))))

(declare-fun readBitPure!0 (BitStream!1790) tuple2!4472)

(declare-fun readerFrom!0 (BitStream!1790 (_ BitVec 32) (_ BitVec 32)) BitStream!1790)

(assert (=> b!45814 (= lt!70335 (readBitPure!0 (readerFrom!0 (_2!2317 lt!70334) (currentBit!2860 thiss!1379) (currentByte!2865 thiss!1379))))))

(declare-fun d!13326 () Bool)

(declare-fun e!30485 () Bool)

(assert (=> d!13326 e!30485))

(declare-fun res!38718 () Bool)

(assert (=> d!13326 (=> (not res!38718) (not e!30485))))

(declare-fun lt!70332 () tuple2!4448)

(assert (=> d!13326 (= res!38718 (= (size!1023 (buf!1372 (_2!2317 lt!70332))) (size!1023 (buf!1372 thiss!1379))))))

(declare-fun lt!70328 () (_ BitVec 8))

(declare-fun lt!70331 () array!2273)

(assert (=> d!13326 (= lt!70328 (select (arr!1540 lt!70331) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!13326 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1023 lt!70331)))))

(assert (=> d!13326 (= lt!70331 (array!2274 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!70330 () tuple2!4448)

(assert (=> d!13326 (= lt!70332 (tuple2!4449 (_1!2317 lt!70330) (_2!2317 lt!70330)))))

(assert (=> d!13326 (= lt!70330 lt!70334)))

(assert (=> d!13326 e!30486))

(declare-fun res!38725 () Bool)

(assert (=> d!13326 (=> (not res!38725) (not e!30486))))

(assert (=> d!13326 (= res!38725 (= (size!1023 (buf!1372 thiss!1379)) (size!1023 (buf!1372 (_2!2317 lt!70334)))))))

(declare-fun appendBit!0 (BitStream!1790 Bool) tuple2!4448)

(assert (=> d!13326 (= lt!70334 (appendBit!0 thiss!1379 lt!70337))))

(assert (=> d!13326 (= lt!70337 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1540 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!13326 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!13326 (= (appendBitFromByte!0 thiss!1379 (select (arr!1540 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!70332)))

(declare-fun b!45815 () Bool)

(declare-fun e!30488 () Bool)

(declare-fun lt!70333 () tuple2!4472)

(assert (=> b!45815 (= e!30488 (= (bitIndex!0 (size!1023 (buf!1372 (_1!2329 lt!70333))) (currentByte!2865 (_1!2329 lt!70333)) (currentBit!2860 (_1!2329 lt!70333))) (bitIndex!0 (size!1023 (buf!1372 (_2!2317 lt!70332))) (currentByte!2865 (_2!2317 lt!70332)) (currentBit!2860 (_2!2317 lt!70332)))))))

(declare-fun b!45816 () Bool)

(declare-fun res!38719 () Bool)

(assert (=> b!45816 (=> (not res!38719) (not e!30485))))

(declare-fun lt!70339 () (_ BitVec 64))

(declare-fun lt!70336 () (_ BitVec 64))

(assert (=> b!45816 (= res!38719 (= (bitIndex!0 (size!1023 (buf!1372 (_2!2317 lt!70332))) (currentByte!2865 (_2!2317 lt!70332)) (currentBit!2860 (_2!2317 lt!70332))) (bvadd lt!70336 lt!70339)))))

(assert (=> b!45816 (or (not (= (bvand lt!70336 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!70339 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!70336 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!70336 lt!70339) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!45816 (= lt!70339 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!45816 (= lt!70336 (bitIndex!0 (size!1023 (buf!1372 thiss!1379)) (currentByte!2865 thiss!1379) (currentBit!2860 thiss!1379)))))

(declare-fun b!45817 () Bool)

(declare-fun res!38724 () Bool)

(assert (=> b!45817 (=> (not res!38724) (not e!30486))))

(assert (=> b!45817 (= res!38724 (isPrefixOf!0 thiss!1379 (_2!2317 lt!70334)))))

(declare-fun b!45818 () Bool)

(declare-fun res!38723 () Bool)

(assert (=> b!45818 (=> (not res!38723) (not e!30485))))

(assert (=> b!45818 (= res!38723 (isPrefixOf!0 thiss!1379 (_2!2317 lt!70332)))))

(declare-fun b!45819 () Bool)

(assert (=> b!45819 (= e!30485 e!30488)))

(declare-fun res!38722 () Bool)

(assert (=> b!45819 (=> (not res!38722) (not e!30488))))

(assert (=> b!45819 (= res!38722 (and (= (_2!2329 lt!70333) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1540 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!70328)) #b00000000000000000000000000000000))) (= (_1!2329 lt!70333) (_2!2317 lt!70332))))))

(declare-datatypes ((tuple2!4474 0))(
  ( (tuple2!4475 (_1!2330 array!2273) (_2!2330 BitStream!1790)) )
))
(declare-fun lt!70329 () tuple2!4474)

(declare-fun lt!70338 () BitStream!1790)

(declare-fun readBits!0 (BitStream!1790 (_ BitVec 64)) tuple2!4474)

(assert (=> b!45819 (= lt!70329 (readBits!0 lt!70338 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!45819 (= lt!70333 (readBitPure!0 lt!70338))))

(assert (=> b!45819 (= lt!70338 (readerFrom!0 (_2!2317 lt!70332) (currentBit!2860 thiss!1379) (currentByte!2865 thiss!1379)))))

(declare-fun b!45820 () Bool)

(declare-fun res!38720 () Bool)

(assert (=> b!45820 (=> (not res!38720) (not e!30486))))

(assert (=> b!45820 (= res!38720 (= (bitIndex!0 (size!1023 (buf!1372 (_2!2317 lt!70334))) (currentByte!2865 (_2!2317 lt!70334)) (currentBit!2860 (_2!2317 lt!70334))) (bvadd (bitIndex!0 (size!1023 (buf!1372 thiss!1379)) (currentByte!2865 thiss!1379) (currentBit!2860 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!13326 res!38725) b!45820))

(assert (= (and b!45820 res!38720) b!45817))

(assert (= (and b!45817 res!38724) b!45814))

(assert (= (and b!45814 res!38721) b!45813))

(assert (= (and d!13326 res!38718) b!45816))

(assert (= (and b!45816 res!38719) b!45818))

(assert (= (and b!45818 res!38723) b!45819))

(assert (= (and b!45819 res!38722) b!45815))

(declare-fun m!69907 () Bool)

(assert (=> b!45816 m!69907))

(assert (=> b!45816 m!69567))

(declare-fun m!69909 () Bool)

(assert (=> b!45817 m!69909))

(declare-fun m!69911 () Bool)

(assert (=> b!45820 m!69911))

(assert (=> b!45820 m!69567))

(declare-fun m!69913 () Bool)

(assert (=> b!45814 m!69913))

(assert (=> b!45814 m!69913))

(declare-fun m!69915 () Bool)

(assert (=> b!45814 m!69915))

(declare-fun m!69917 () Bool)

(assert (=> d!13326 m!69917))

(declare-fun m!69919 () Bool)

(assert (=> d!13326 m!69919))

(declare-fun m!69921 () Bool)

(assert (=> d!13326 m!69921))

(declare-fun m!69923 () Bool)

(assert (=> b!45815 m!69923))

(assert (=> b!45815 m!69907))

(declare-fun m!69925 () Bool)

(assert (=> b!45819 m!69925))

(declare-fun m!69927 () Bool)

(assert (=> b!45819 m!69927))

(declare-fun m!69929 () Bool)

(assert (=> b!45819 m!69929))

(declare-fun m!69931 () Bool)

(assert (=> b!45818 m!69931))

(declare-fun m!69933 () Bool)

(assert (=> b!45813 m!69933))

(assert (=> b!45813 m!69911))

(assert (=> b!45597 d!13326))

(declare-fun d!13328 () Bool)

(assert (=> d!13328 (= (head!355 (byteArrayBitContentToList!0 (_2!2317 lt!69921) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!651 (byteArrayBitContentToList!0 (_2!2317 lt!69921) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!45591 d!13328))

(declare-fun d!13330 () Bool)

(declare-fun c!3087 () Bool)

(assert (=> d!13330 (= c!3087 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!30491 () List!536)

(assert (=> d!13330 (= (byteArrayBitContentToList!0 (_2!2317 lt!69921) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!30491)))

(declare-fun b!45825 () Bool)

(assert (=> b!45825 (= e!30491 Nil!533)))

(declare-fun b!45826 () Bool)

(assert (=> b!45826 (= e!30491 (Cons!532 (not (= (bvand ((_ sign_extend 24) (select (arr!1540 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2317 lt!69921) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!13330 c!3087) b!45825))

(assert (= (and d!13330 (not c!3087)) b!45826))

(assert (=> b!45826 m!69613))

(assert (=> b!45826 m!69921))

(declare-fun m!69935 () Bool)

(assert (=> b!45826 m!69935))

(assert (=> b!45591 d!13330))

(declare-fun d!13332 () Bool)

(assert (=> d!13332 (= (head!355 (bitStreamReadBitsIntoList!0 (_2!2317 lt!69921) (_1!2318 lt!69909) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!651 (bitStreamReadBitsIntoList!0 (_2!2317 lt!69921) (_1!2318 lt!69909) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!45591 d!13332))

(declare-fun d!13334 () Bool)

(declare-fun e!30493 () Bool)

(assert (=> d!13334 e!30493))

(declare-fun c!3088 () Bool)

(assert (=> d!13334 (= c!3088 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!70341 () List!536)

(declare-fun e!30492 () tuple2!4466)

(assert (=> d!13334 (= lt!70341 (_1!2326 e!30492))))

(declare-fun c!3089 () Bool)

(assert (=> d!13334 (= c!3089 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13334 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13334 (= (bitStreamReadBitsIntoList!0 (_2!2317 lt!69921) (_1!2318 lt!69909) #b0000000000000000000000000000000000000000000000000000000000000001) lt!70341)))

(declare-fun b!45827 () Bool)

(assert (=> b!45827 (= e!30492 (tuple2!4467 Nil!533 (_1!2318 lt!69909)))))

(declare-fun b!45830 () Bool)

(assert (=> b!45830 (= e!30493 (> (length!231 lt!70341) 0))))

(declare-fun lt!70342 () tuple2!4468)

(declare-fun b!45828 () Bool)

(declare-fun lt!70340 () (_ BitVec 64))

(assert (=> b!45828 (= e!30492 (tuple2!4467 (Cons!532 (_1!2327 lt!70342) (bitStreamReadBitsIntoList!0 (_2!2317 lt!69921) (_2!2327 lt!70342) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!70340))) (_2!2327 lt!70342)))))

(assert (=> b!45828 (= lt!70342 (readBit!0 (_1!2318 lt!69909)))))

(assert (=> b!45828 (= lt!70340 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!45829 () Bool)

(assert (=> b!45829 (= e!30493 (isEmpty!133 lt!70341))))

(assert (= (and d!13334 c!3089) b!45827))

(assert (= (and d!13334 (not c!3089)) b!45828))

(assert (= (and d!13334 c!3088) b!45829))

(assert (= (and d!13334 (not c!3088)) b!45830))

(declare-fun m!69937 () Bool)

(assert (=> b!45830 m!69937))

(declare-fun m!69939 () Bool)

(assert (=> b!45828 m!69939))

(declare-fun m!69941 () Bool)

(assert (=> b!45828 m!69941))

(declare-fun m!69943 () Bool)

(assert (=> b!45829 m!69943))

(assert (=> b!45591 d!13334))

(declare-fun d!13336 () Bool)

(declare-fun size!1026 (List!536) Int)

(assert (=> d!13336 (= (length!231 lt!69915) (size!1026 lt!69915))))

(declare-fun bs!3526 () Bool)

(assert (= bs!3526 d!13336))

(declare-fun m!69945 () Bool)

(assert (=> bs!3526 m!69945))

(assert (=> b!45590 d!13336))

(declare-fun d!13338 () Bool)

(assert (=> d!13338 (= (array_inv!948 (buf!1372 thiss!1379)) (bvsge (size!1023 (buf!1372 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!45589 d!13338))

(declare-fun d!13340 () Bool)

(assert (=> d!13340 (= (invariant!0 (currentBit!2860 (_2!2317 lt!69912)) (currentByte!2865 (_2!2317 lt!69912)) (size!1023 (buf!1372 (_2!2317 lt!69912)))) (and (bvsge (currentBit!2860 (_2!2317 lt!69912)) #b00000000000000000000000000000000) (bvslt (currentBit!2860 (_2!2317 lt!69912)) #b00000000000000000000000000001000) (bvsge (currentByte!2865 (_2!2317 lt!69912)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2865 (_2!2317 lt!69912)) (size!1023 (buf!1372 (_2!2317 lt!69912)))) (and (= (currentBit!2860 (_2!2317 lt!69912)) #b00000000000000000000000000000000) (= (currentByte!2865 (_2!2317 lt!69912)) (size!1023 (buf!1372 (_2!2317 lt!69912))))))))))

(assert (=> b!45594 d!13340))

(declare-fun d!13342 () Bool)

(declare-fun e!30494 () Bool)

(assert (=> d!13342 e!30494))

(declare-fun res!38727 () Bool)

(assert (=> d!13342 (=> (not res!38727) (not e!30494))))

(declare-fun lt!70344 () (_ BitVec 64))

(declare-fun lt!70347 () (_ BitVec 64))

(declare-fun lt!70348 () (_ BitVec 64))

(assert (=> d!13342 (= res!38727 (= lt!70347 (bvsub lt!70344 lt!70348)))))

(assert (=> d!13342 (or (= (bvand lt!70344 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!70348 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!70344 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!70344 lt!70348) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13342 (= lt!70348 (remainingBits!0 ((_ sign_extend 32) (size!1023 (buf!1372 (_2!2317 lt!69921)))) ((_ sign_extend 32) (currentByte!2865 (_2!2317 lt!69921))) ((_ sign_extend 32) (currentBit!2860 (_2!2317 lt!69921)))))))

(declare-fun lt!70343 () (_ BitVec 64))

(declare-fun lt!70346 () (_ BitVec 64))

(assert (=> d!13342 (= lt!70344 (bvmul lt!70343 lt!70346))))

(assert (=> d!13342 (or (= lt!70343 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!70346 (bvsdiv (bvmul lt!70343 lt!70346) lt!70343)))))

(assert (=> d!13342 (= lt!70346 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13342 (= lt!70343 ((_ sign_extend 32) (size!1023 (buf!1372 (_2!2317 lt!69921)))))))

(assert (=> d!13342 (= lt!70347 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2865 (_2!2317 lt!69921))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2860 (_2!2317 lt!69921)))))))

(assert (=> d!13342 (invariant!0 (currentBit!2860 (_2!2317 lt!69921)) (currentByte!2865 (_2!2317 lt!69921)) (size!1023 (buf!1372 (_2!2317 lt!69921))))))

(assert (=> d!13342 (= (bitIndex!0 (size!1023 (buf!1372 (_2!2317 lt!69921))) (currentByte!2865 (_2!2317 lt!69921)) (currentBit!2860 (_2!2317 lt!69921))) lt!70347)))

(declare-fun b!45831 () Bool)

(declare-fun res!38726 () Bool)

(assert (=> b!45831 (=> (not res!38726) (not e!30494))))

(assert (=> b!45831 (= res!38726 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!70347))))

(declare-fun b!45832 () Bool)

(declare-fun lt!70345 () (_ BitVec 64))

(assert (=> b!45832 (= e!30494 (bvsle lt!70347 (bvmul lt!70345 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!45832 (or (= lt!70345 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!70345 #b0000000000000000000000000000000000000000000000000000000000001000) lt!70345)))))

(assert (=> b!45832 (= lt!70345 ((_ sign_extend 32) (size!1023 (buf!1372 (_2!2317 lt!69921)))))))

(assert (= (and d!13342 res!38727) b!45831))

(assert (= (and b!45831 res!38726) b!45832))

(assert (=> d!13342 m!69901))

(assert (=> d!13342 m!69577))

(assert (=> b!45593 d!13342))

(declare-fun d!13344 () Bool)

(assert (=> d!13344 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1023 (buf!1372 (_2!2317 lt!69921)))) ((_ sign_extend 32) (currentByte!2865 thiss!1379)) ((_ sign_extend 32) (currentBit!2860 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1023 (buf!1372 (_2!2317 lt!69921)))) ((_ sign_extend 32) (currentByte!2865 thiss!1379)) ((_ sign_extend 32) (currentBit!2860 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3527 () Bool)

(assert (= bs!3527 d!13344))

(declare-fun m!69947 () Bool)

(assert (=> bs!3527 m!69947))

(assert (=> b!45592 d!13344))

(declare-fun b!45973 () Bool)

(declare-fun e!30558 () tuple2!4448)

(declare-fun Unit!3260 () Unit!3236)

(assert (=> b!45973 (= e!30558 (tuple2!4449 Unit!3260 (_2!2317 lt!69921)))))

(assert (=> b!45973 (= (size!1023 (buf!1372 (_2!2317 lt!69921))) (size!1023 (buf!1372 (_2!2317 lt!69921))))))

(declare-fun lt!70856 () Unit!3236)

(declare-fun Unit!3261 () Unit!3236)

(assert (=> b!45973 (= lt!70856 Unit!3261)))

(declare-fun call!553 () tuple2!4450)

(declare-fun checkByteArrayBitContent!0 (BitStream!1790 array!2273 array!2273 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!45973 (checkByteArrayBitContent!0 (_2!2317 lt!69921) srcBuffer!2 (_1!2330 (readBits!0 (_1!2318 call!553) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!45974 () Bool)

(declare-fun lt!70866 () tuple2!4450)

(declare-fun lt!70864 () tuple2!4448)

(declare-fun e!30560 () Bool)

(assert (=> b!45974 (= e!30560 (= (bitStreamReadBitsIntoList!0 (_2!2317 lt!70864) (_1!2318 lt!70866) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2317 lt!70864) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!45974 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!45974 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!70867 () Unit!3236)

(declare-fun lt!70847 () Unit!3236)

(assert (=> b!45974 (= lt!70867 lt!70847)))

(declare-fun lt!70852 () (_ BitVec 64))

(assert (=> b!45974 (validate_offset_bits!1 ((_ sign_extend 32) (size!1023 (buf!1372 (_2!2317 lt!70864)))) ((_ sign_extend 32) (currentByte!2865 (_2!2317 lt!69921))) ((_ sign_extend 32) (currentBit!2860 (_2!2317 lt!69921))) lt!70852)))

(assert (=> b!45974 (= lt!70847 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2317 lt!69921) (buf!1372 (_2!2317 lt!70864)) lt!70852))))

(declare-fun e!30559 () Bool)

(assert (=> b!45974 e!30559))

(declare-fun res!38830 () Bool)

(assert (=> b!45974 (=> (not res!38830) (not e!30559))))

(assert (=> b!45974 (= res!38830 (and (= (size!1023 (buf!1372 (_2!2317 lt!69921))) (size!1023 (buf!1372 (_2!2317 lt!70864)))) (bvsge lt!70852 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!45974 (= lt!70852 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!45974 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!45974 (= lt!70866 (reader!0 (_2!2317 lt!69921) (_2!2317 lt!70864)))))

(declare-fun d!13346 () Bool)

(assert (=> d!13346 e!30560))

(declare-fun res!38829 () Bool)

(assert (=> d!13346 (=> (not res!38829) (not e!30560))))

(declare-fun lt!70863 () (_ BitVec 64))

(assert (=> d!13346 (= res!38829 (= (bitIndex!0 (size!1023 (buf!1372 (_2!2317 lt!70864))) (currentByte!2865 (_2!2317 lt!70864)) (currentBit!2860 (_2!2317 lt!70864))) (bvsub lt!70863 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!13346 (or (= (bvand lt!70863 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!70863 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!70863 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!70869 () (_ BitVec 64))

(assert (=> d!13346 (= lt!70863 (bvadd lt!70869 to!314))))

(assert (=> d!13346 (or (not (= (bvand lt!70869 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!70869 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!70869 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13346 (= lt!70869 (bitIndex!0 (size!1023 (buf!1372 (_2!2317 lt!69921))) (currentByte!2865 (_2!2317 lt!69921)) (currentBit!2860 (_2!2317 lt!69921))))))

(assert (=> d!13346 (= lt!70864 e!30558)))

(declare-fun c!3110 () Bool)

(assert (=> d!13346 (= c!3110 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!70861 () Unit!3236)

(declare-fun lt!70848 () Unit!3236)

(assert (=> d!13346 (= lt!70861 lt!70848)))

(assert (=> d!13346 (isPrefixOf!0 (_2!2317 lt!69921) (_2!2317 lt!69921))))

(assert (=> d!13346 (= lt!70848 (lemmaIsPrefixRefl!0 (_2!2317 lt!69921)))))

(declare-fun lt!70838 () (_ BitVec 64))

(assert (=> d!13346 (= lt!70838 (bitIndex!0 (size!1023 (buf!1372 (_2!2317 lt!69921))) (currentByte!2865 (_2!2317 lt!69921)) (currentBit!2860 (_2!2317 lt!69921))))))

(assert (=> d!13346 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13346 (= (appendBitsMSBFirstLoop!0 (_2!2317 lt!69921) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!70864)))

(declare-fun b!45975 () Bool)

(declare-fun res!38828 () Bool)

(assert (=> b!45975 (=> (not res!38828) (not e!30560))))

(assert (=> b!45975 (= res!38828 (= (size!1023 (buf!1372 (_2!2317 lt!70864))) (size!1023 (buf!1372 (_2!2317 lt!69921)))))))

(declare-fun b!45976 () Bool)

(declare-fun res!38831 () Bool)

(assert (=> b!45976 (=> (not res!38831) (not e!30560))))

(assert (=> b!45976 (= res!38831 (invariant!0 (currentBit!2860 (_2!2317 lt!70864)) (currentByte!2865 (_2!2317 lt!70864)) (size!1023 (buf!1372 (_2!2317 lt!70864)))))))

(declare-fun b!45977 () Bool)

(declare-fun res!38827 () Bool)

(assert (=> b!45977 (=> (not res!38827) (not e!30560))))

(assert (=> b!45977 (= res!38827 (isPrefixOf!0 (_2!2317 lt!69921) (_2!2317 lt!70864)))))

(declare-fun bm!550 () Bool)

(declare-fun lt!70842 () tuple2!4448)

(declare-fun lt!70868 () tuple2!4448)

(assert (=> bm!550 (= call!553 (reader!0 (ite c!3110 (_2!2317 lt!70868) (_2!2317 lt!69921)) (ite c!3110 (_2!2317 lt!70842) (_2!2317 lt!69921))))))

(declare-fun b!45978 () Bool)

(declare-fun Unit!3262 () Unit!3236)

(assert (=> b!45978 (= e!30558 (tuple2!4449 Unit!3262 (_2!2317 lt!70842)))))

(assert (=> b!45978 (= lt!70868 (appendBitFromByte!0 (_2!2317 lt!69921) (select (arr!1540 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!70836 () (_ BitVec 64))

(assert (=> b!45978 (= lt!70836 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!70872 () (_ BitVec 64))

(assert (=> b!45978 (= lt!70872 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!70840 () Unit!3236)

(assert (=> b!45978 (= lt!70840 (validateOffsetBitsIneqLemma!0 (_2!2317 lt!69921) (_2!2317 lt!70868) lt!70836 lt!70872))))

(assert (=> b!45978 (validate_offset_bits!1 ((_ sign_extend 32) (size!1023 (buf!1372 (_2!2317 lt!70868)))) ((_ sign_extend 32) (currentByte!2865 (_2!2317 lt!70868))) ((_ sign_extend 32) (currentBit!2860 (_2!2317 lt!70868))) (bvsub lt!70836 lt!70872))))

(declare-fun lt!70859 () Unit!3236)

(assert (=> b!45978 (= lt!70859 lt!70840)))

(declare-fun lt!70837 () tuple2!4450)

(assert (=> b!45978 (= lt!70837 (reader!0 (_2!2317 lt!69921) (_2!2317 lt!70868)))))

(declare-fun lt!70841 () (_ BitVec 64))

(assert (=> b!45978 (= lt!70841 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!70877 () Unit!3236)

(assert (=> b!45978 (= lt!70877 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2317 lt!69921) (buf!1372 (_2!2317 lt!70868)) lt!70841))))

(assert (=> b!45978 (validate_offset_bits!1 ((_ sign_extend 32) (size!1023 (buf!1372 (_2!2317 lt!70868)))) ((_ sign_extend 32) (currentByte!2865 (_2!2317 lt!69921))) ((_ sign_extend 32) (currentBit!2860 (_2!2317 lt!69921))) lt!70841)))

(declare-fun lt!70853 () Unit!3236)

(assert (=> b!45978 (= lt!70853 lt!70877)))

(assert (=> b!45978 (= (head!355 (byteArrayBitContentToList!0 (_2!2317 lt!70868) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!355 (bitStreamReadBitsIntoList!0 (_2!2317 lt!70868) (_1!2318 lt!70837) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!70844 () Unit!3236)

(declare-fun Unit!3263 () Unit!3236)

(assert (=> b!45978 (= lt!70844 Unit!3263)))

(assert (=> b!45978 (= lt!70842 (appendBitsMSBFirstLoop!0 (_2!2317 lt!70868) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!70871 () Unit!3236)

(assert (=> b!45978 (= lt!70871 (lemmaIsPrefixTransitive!0 (_2!2317 lt!69921) (_2!2317 lt!70868) (_2!2317 lt!70842)))))

(assert (=> b!45978 (isPrefixOf!0 (_2!2317 lt!69921) (_2!2317 lt!70842))))

(declare-fun lt!70857 () Unit!3236)

(assert (=> b!45978 (= lt!70857 lt!70871)))

(assert (=> b!45978 (= (size!1023 (buf!1372 (_2!2317 lt!70842))) (size!1023 (buf!1372 (_2!2317 lt!69921))))))

(declare-fun lt!70879 () Unit!3236)

(declare-fun Unit!3264 () Unit!3236)

(assert (=> b!45978 (= lt!70879 Unit!3264)))

(assert (=> b!45978 (= (bitIndex!0 (size!1023 (buf!1372 (_2!2317 lt!70842))) (currentByte!2865 (_2!2317 lt!70842)) (currentBit!2860 (_2!2317 lt!70842))) (bvsub (bvadd (bitIndex!0 (size!1023 (buf!1372 (_2!2317 lt!69921))) (currentByte!2865 (_2!2317 lt!69921)) (currentBit!2860 (_2!2317 lt!69921))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!70878 () Unit!3236)

(declare-fun Unit!3265 () Unit!3236)

(assert (=> b!45978 (= lt!70878 Unit!3265)))

(assert (=> b!45978 (= (bitIndex!0 (size!1023 (buf!1372 (_2!2317 lt!70842))) (currentByte!2865 (_2!2317 lt!70842)) (currentBit!2860 (_2!2317 lt!70842))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1023 (buf!1372 (_2!2317 lt!70868))) (currentByte!2865 (_2!2317 lt!70868)) (currentBit!2860 (_2!2317 lt!70868))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!70849 () Unit!3236)

(declare-fun Unit!3266 () Unit!3236)

(assert (=> b!45978 (= lt!70849 Unit!3266)))

(declare-fun lt!70850 () tuple2!4450)

(assert (=> b!45978 (= lt!70850 (reader!0 (_2!2317 lt!69921) (_2!2317 lt!70842)))))

(declare-fun lt!70876 () (_ BitVec 64))

(assert (=> b!45978 (= lt!70876 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!70873 () Unit!3236)

(assert (=> b!45978 (= lt!70873 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2317 lt!69921) (buf!1372 (_2!2317 lt!70842)) lt!70876))))

(assert (=> b!45978 (validate_offset_bits!1 ((_ sign_extend 32) (size!1023 (buf!1372 (_2!2317 lt!70842)))) ((_ sign_extend 32) (currentByte!2865 (_2!2317 lt!69921))) ((_ sign_extend 32) (currentBit!2860 (_2!2317 lt!69921))) lt!70876)))

(declare-fun lt!70874 () Unit!3236)

(assert (=> b!45978 (= lt!70874 lt!70873)))

(declare-fun lt!70854 () tuple2!4450)

(assert (=> b!45978 (= lt!70854 call!553)))

(declare-fun lt!70855 () (_ BitVec 64))

(assert (=> b!45978 (= lt!70855 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!70875 () Unit!3236)

(assert (=> b!45978 (= lt!70875 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2317 lt!70868) (buf!1372 (_2!2317 lt!70842)) lt!70855))))

(assert (=> b!45978 (validate_offset_bits!1 ((_ sign_extend 32) (size!1023 (buf!1372 (_2!2317 lt!70842)))) ((_ sign_extend 32) (currentByte!2865 (_2!2317 lt!70868))) ((_ sign_extend 32) (currentBit!2860 (_2!2317 lt!70868))) lt!70855)))

(declare-fun lt!70843 () Unit!3236)

(assert (=> b!45978 (= lt!70843 lt!70875)))

(declare-fun lt!70858 () List!536)

(assert (=> b!45978 (= lt!70858 (byteArrayBitContentToList!0 (_2!2317 lt!70842) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!70839 () List!536)

(assert (=> b!45978 (= lt!70839 (byteArrayBitContentToList!0 (_2!2317 lt!70842) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!70845 () List!536)

(assert (=> b!45978 (= lt!70845 (bitStreamReadBitsIntoList!0 (_2!2317 lt!70842) (_1!2318 lt!70850) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!70870 () List!536)

(assert (=> b!45978 (= lt!70870 (bitStreamReadBitsIntoList!0 (_2!2317 lt!70842) (_1!2318 lt!70854) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!70846 () (_ BitVec 64))

(assert (=> b!45978 (= lt!70846 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!70860 () Unit!3236)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1790 BitStream!1790 BitStream!1790 BitStream!1790 (_ BitVec 64) List!536) Unit!3236)

(assert (=> b!45978 (= lt!70860 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2317 lt!70842) (_2!2317 lt!70842) (_1!2318 lt!70850) (_1!2318 lt!70854) lt!70846 lt!70845))))

(declare-fun tail!222 (List!536) List!536)

(assert (=> b!45978 (= (bitStreamReadBitsIntoList!0 (_2!2317 lt!70842) (_1!2318 lt!70854) (bvsub lt!70846 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!222 lt!70845))))

(declare-fun lt!70851 () Unit!3236)

(assert (=> b!45978 (= lt!70851 lt!70860)))

(declare-fun lt!70865 () Unit!3236)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2273 array!2273 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3236)

(assert (=> b!45978 (= lt!70865 (arrayBitRangesEqImpliesEq!0 (buf!1372 (_2!2317 lt!70868)) (buf!1372 (_2!2317 lt!70842)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!70838 (bitIndex!0 (size!1023 (buf!1372 (_2!2317 lt!70868))) (currentByte!2865 (_2!2317 lt!70868)) (currentBit!2860 (_2!2317 lt!70868)))))))

(declare-fun bitAt!0 (array!2273 (_ BitVec 64)) Bool)

(assert (=> b!45978 (= (bitAt!0 (buf!1372 (_2!2317 lt!70868)) lt!70838) (bitAt!0 (buf!1372 (_2!2317 lt!70842)) lt!70838))))

(declare-fun lt!70862 () Unit!3236)

(assert (=> b!45978 (= lt!70862 lt!70865)))

(declare-fun b!45979 () Bool)

(declare-fun res!38832 () Bool)

(assert (=> b!45979 (=> (not res!38832) (not e!30560))))

(assert (=> b!45979 (= res!38832 (= (size!1023 (buf!1372 (_2!2317 lt!69921))) (size!1023 (buf!1372 (_2!2317 lt!70864)))))))

(declare-fun b!45980 () Bool)

(assert (=> b!45980 (= e!30559 (validate_offset_bits!1 ((_ sign_extend 32) (size!1023 (buf!1372 (_2!2317 lt!69921)))) ((_ sign_extend 32) (currentByte!2865 (_2!2317 lt!69921))) ((_ sign_extend 32) (currentBit!2860 (_2!2317 lt!69921))) lt!70852))))

(assert (= (and d!13346 c!3110) b!45978))

(assert (= (and d!13346 (not c!3110)) b!45973))

(assert (= (or b!45978 b!45973) bm!550))

(assert (= (and d!13346 res!38829) b!45976))

(assert (= (and b!45976 res!38831) b!45979))

(assert (= (and b!45979 res!38832) b!45977))

(assert (= (and b!45977 res!38827) b!45975))

(assert (= (and b!45975 res!38828) b!45974))

(assert (= (and b!45974 res!38830) b!45980))

(declare-fun m!70277 () Bool)

(assert (=> b!45978 m!70277))

(declare-fun m!70279 () Bool)

(assert (=> b!45978 m!70279))

(declare-fun m!70281 () Bool)

(assert (=> b!45978 m!70281))

(declare-fun m!70283 () Bool)

(assert (=> b!45978 m!70283))

(declare-fun m!70285 () Bool)

(assert (=> b!45978 m!70285))

(declare-fun m!70287 () Bool)

(assert (=> b!45978 m!70287))

(declare-fun m!70289 () Bool)

(assert (=> b!45978 m!70289))

(declare-fun m!70291 () Bool)

(assert (=> b!45978 m!70291))

(declare-fun m!70293 () Bool)

(assert (=> b!45978 m!70293))

(declare-fun m!70295 () Bool)

(assert (=> b!45978 m!70295))

(declare-fun m!70297 () Bool)

(assert (=> b!45978 m!70297))

(declare-fun m!70299 () Bool)

(assert (=> b!45978 m!70299))

(declare-fun m!70301 () Bool)

(assert (=> b!45978 m!70301))

(assert (=> b!45978 m!70289))

(declare-fun m!70303 () Bool)

(assert (=> b!45978 m!70303))

(declare-fun m!70305 () Bool)

(assert (=> b!45978 m!70305))

(declare-fun m!70307 () Bool)

(assert (=> b!45978 m!70307))

(declare-fun m!70309 () Bool)

(assert (=> b!45978 m!70309))

(declare-fun m!70311 () Bool)

(assert (=> b!45978 m!70311))

(declare-fun m!70313 () Bool)

(assert (=> b!45978 m!70313))

(declare-fun m!70315 () Bool)

(assert (=> b!45978 m!70315))

(assert (=> b!45978 m!69581))

(declare-fun m!70317 () Bool)

(assert (=> b!45978 m!70317))

(declare-fun m!70319 () Bool)

(assert (=> b!45978 m!70319))

(declare-fun m!70321 () Bool)

(assert (=> b!45978 m!70321))

(assert (=> b!45978 m!70317))

(declare-fun m!70323 () Bool)

(assert (=> b!45978 m!70323))

(declare-fun m!70325 () Bool)

(assert (=> b!45978 m!70325))

(declare-fun m!70327 () Bool)

(assert (=> b!45978 m!70327))

(declare-fun m!70329 () Bool)

(assert (=> b!45978 m!70329))

(declare-fun m!70331 () Bool)

(assert (=> b!45978 m!70331))

(declare-fun m!70333 () Bool)

(assert (=> b!45978 m!70333))

(assert (=> b!45978 m!70285))

(declare-fun m!70335 () Bool)

(assert (=> b!45978 m!70335))

(assert (=> b!45978 m!70313))

(declare-fun m!70337 () Bool)

(assert (=> b!45978 m!70337))

(declare-fun m!70339 () Bool)

(assert (=> bm!550 m!70339))

(declare-fun m!70341 () Bool)

(assert (=> b!45980 m!70341))

(declare-fun m!70343 () Bool)

(assert (=> b!45974 m!70343))

(declare-fun m!70345 () Bool)

(assert (=> b!45974 m!70345))

(declare-fun m!70347 () Bool)

(assert (=> b!45974 m!70347))

(declare-fun m!70349 () Bool)

(assert (=> b!45974 m!70349))

(declare-fun m!70351 () Bool)

(assert (=> b!45974 m!70351))

(declare-fun m!70353 () Bool)

(assert (=> b!45976 m!70353))

(declare-fun m!70355 () Bool)

(assert (=> d!13346 m!70355))

(assert (=> d!13346 m!69581))

(assert (=> d!13346 m!69877))

(assert (=> d!13346 m!69869))

(declare-fun m!70357 () Bool)

(assert (=> b!45973 m!70357))

(declare-fun m!70359 () Bool)

(assert (=> b!45973 m!70359))

(declare-fun m!70361 () Bool)

(assert (=> b!45977 m!70361))

(assert (=> b!45592 d!13346))

(declare-fun d!13418 () Bool)

(declare-fun res!38833 () Bool)

(declare-fun e!30561 () Bool)

(assert (=> d!13418 (=> (not res!38833) (not e!30561))))

(assert (=> d!13418 (= res!38833 (= (size!1023 (buf!1372 (_2!2317 lt!69921))) (size!1023 (buf!1372 (_2!2317 lt!69912)))))))

(assert (=> d!13418 (= (isPrefixOf!0 (_2!2317 lt!69921) (_2!2317 lt!69912)) e!30561)))

(declare-fun b!45981 () Bool)

(declare-fun res!38834 () Bool)

(assert (=> b!45981 (=> (not res!38834) (not e!30561))))

(assert (=> b!45981 (= res!38834 (bvsle (bitIndex!0 (size!1023 (buf!1372 (_2!2317 lt!69921))) (currentByte!2865 (_2!2317 lt!69921)) (currentBit!2860 (_2!2317 lt!69921))) (bitIndex!0 (size!1023 (buf!1372 (_2!2317 lt!69912))) (currentByte!2865 (_2!2317 lt!69912)) (currentBit!2860 (_2!2317 lt!69912)))))))

(declare-fun b!45982 () Bool)

(declare-fun e!30562 () Bool)

(assert (=> b!45982 (= e!30561 e!30562)))

(declare-fun res!38835 () Bool)

(assert (=> b!45982 (=> res!38835 e!30562)))

(assert (=> b!45982 (= res!38835 (= (size!1023 (buf!1372 (_2!2317 lt!69921))) #b00000000000000000000000000000000))))

(declare-fun b!45983 () Bool)

(assert (=> b!45983 (= e!30562 (arrayBitRangesEq!0 (buf!1372 (_2!2317 lt!69921)) (buf!1372 (_2!2317 lt!69912)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1023 (buf!1372 (_2!2317 lt!69921))) (currentByte!2865 (_2!2317 lt!69921)) (currentBit!2860 (_2!2317 lt!69921)))))))

(assert (= (and d!13418 res!38833) b!45981))

(assert (= (and b!45981 res!38834) b!45982))

(assert (= (and b!45982 (not res!38835)) b!45983))

(assert (=> b!45981 m!69581))

(assert (=> b!45981 m!69585))

(assert (=> b!45983 m!69581))

(assert (=> b!45983 m!69581))

(declare-fun m!70363 () Bool)

(assert (=> b!45983 m!70363))

(assert (=> b!45592 d!13418))

(declare-fun d!13420 () Bool)

(declare-fun res!38836 () Bool)

(declare-fun e!30563 () Bool)

(assert (=> d!13420 (=> (not res!38836) (not e!30563))))

(assert (=> d!13420 (= res!38836 (= (size!1023 (buf!1372 thiss!1379)) (size!1023 (buf!1372 (_2!2317 lt!69912)))))))

(assert (=> d!13420 (= (isPrefixOf!0 thiss!1379 (_2!2317 lt!69912)) e!30563)))

