; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12336 () Bool)

(assert start!12336)

(declare-fun b!62917 () Bool)

(declare-fun e!41738 () Bool)

(declare-fun e!41740 () Bool)

(assert (=> b!62917 (= e!41738 e!41740)))

(declare-fun res!52309 () Bool)

(assert (=> b!62917 (=> res!52309 e!41740)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!62917 (= res!52309 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!2797 0))(
  ( (array!2798 (arr!1844 (Array (_ BitVec 32) (_ BitVec 8))) (size!1280 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2224 0))(
  ( (BitStream!2225 (buf!1661 array!2797) (currentByte!3303 (_ BitVec 32)) (currentBit!3298 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!5666 0))(
  ( (tuple2!5667 (_1!2944 BitStream!2224) (_2!2944 BitStream!2224)) )
))
(declare-fun lt!99026 () tuple2!5666)

(declare-fun lt!99024 () (_ BitVec 64))

(declare-datatypes ((Unit!4277 0))(
  ( (Unit!4278) )
))
(declare-datatypes ((tuple2!5668 0))(
  ( (tuple2!5669 (_1!2945 Unit!4277) (_2!2945 BitStream!2224)) )
))
(declare-fun lt!99018 () tuple2!5668)

(declare-datatypes ((List!687 0))(
  ( (Nil!684) (Cons!683 (h!802 Bool) (t!1437 List!687)) )
))
(declare-fun lt!99014 () List!687)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2224 BitStream!2224 (_ BitVec 64)) List!687)

(assert (=> b!62917 (= lt!99014 (bitStreamReadBitsIntoList!0 (_2!2945 lt!99018) (_1!2944 lt!99026) lt!99024))))

(declare-fun lt!99023 () tuple2!5666)

(declare-fun lt!99028 () List!687)

(assert (=> b!62917 (= lt!99028 (bitStreamReadBitsIntoList!0 (_2!2945 lt!99018) (_1!2944 lt!99023) (bvsub to!314 i!635)))))

(declare-fun lt!99017 () tuple2!5668)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!62917 (validate_offset_bits!1 ((_ sign_extend 32) (size!1280 (buf!1661 (_2!2945 lt!99018)))) ((_ sign_extend 32) (currentByte!3303 (_2!2945 lt!99017))) ((_ sign_extend 32) (currentBit!3298 (_2!2945 lt!99017))) lt!99024)))

(declare-fun lt!99020 () Unit!4277)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2224 array!2797 (_ BitVec 64)) Unit!4277)

(assert (=> b!62917 (= lt!99020 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2945 lt!99017) (buf!1661 (_2!2945 lt!99018)) lt!99024))))

(declare-fun reader!0 (BitStream!2224 BitStream!2224) tuple2!5666)

(assert (=> b!62917 (= lt!99026 (reader!0 (_2!2945 lt!99017) (_2!2945 lt!99018)))))

(declare-fun thiss!1379 () BitStream!2224)

(assert (=> b!62917 (validate_offset_bits!1 ((_ sign_extend 32) (size!1280 (buf!1661 (_2!2945 lt!99018)))) ((_ sign_extend 32) (currentByte!3303 thiss!1379)) ((_ sign_extend 32) (currentBit!3298 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!99027 () Unit!4277)

(assert (=> b!62917 (= lt!99027 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1661 (_2!2945 lt!99018)) (bvsub to!314 i!635)))))

(assert (=> b!62917 (= lt!99023 (reader!0 thiss!1379 (_2!2945 lt!99018)))))

(declare-fun b!62918 () Bool)

(declare-fun e!41735 () Bool)

(declare-fun array_inv!1171 (array!2797) Bool)

(assert (=> b!62918 (= e!41735 (array_inv!1171 (buf!1661 thiss!1379)))))

(declare-fun b!62919 () Bool)

(declare-fun res!52320 () Bool)

(declare-fun e!41736 () Bool)

(assert (=> b!62919 (=> res!52320 e!41736)))

(assert (=> b!62919 (= res!52320 (not (= (size!1280 (buf!1661 thiss!1379)) (size!1280 (buf!1661 (_2!2945 lt!99018))))))))

(declare-fun b!62920 () Bool)

(declare-fun res!52312 () Bool)

(assert (=> b!62920 (=> res!52312 e!41740)))

(declare-fun isPrefixOf!0 (BitStream!2224 BitStream!2224) Bool)

(assert (=> b!62920 (= res!52312 (not (isPrefixOf!0 (_1!2944 lt!99023) (_1!2944 lt!99026))))))

(declare-fun b!62921 () Bool)

(declare-fun res!52322 () Bool)

(assert (=> b!62921 (=> res!52322 e!41738)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!62921 (= res!52322 (not (invariant!0 (currentBit!3298 (_2!2945 lt!99017)) (currentByte!3303 (_2!2945 lt!99017)) (size!1280 (buf!1661 (_2!2945 lt!99017))))))))

(declare-fun res!52316 () Bool)

(declare-fun e!41733 () Bool)

(assert (=> start!12336 (=> (not res!52316) (not e!41733))))

(declare-fun srcBuffer!2 () array!2797)

(assert (=> start!12336 (= res!52316 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1280 srcBuffer!2))))))))

(assert (=> start!12336 e!41733))

(assert (=> start!12336 true))

(assert (=> start!12336 (array_inv!1171 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2224) Bool)

(assert (=> start!12336 (and (inv!12 thiss!1379) e!41735)))

(declare-fun b!62922 () Bool)

(declare-fun res!52323 () Bool)

(assert (=> b!62922 (=> res!52323 e!41740)))

(declare-fun length!315 (List!687) Int)

(assert (=> b!62922 (= res!52323 (<= (length!315 lt!99028) 0))))

(declare-fun b!62923 () Bool)

(declare-fun e!41730 () Bool)

(assert (=> b!62923 (= e!41730 e!41736)))

(declare-fun res!52313 () Bool)

(assert (=> b!62923 (=> res!52313 e!41736)))

(declare-fun lt!99025 () (_ BitVec 64))

(declare-fun lt!99021 () (_ BitVec 64))

(assert (=> b!62923 (= res!52313 (not (= lt!99021 (bvsub (bvadd lt!99025 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!62923 (= lt!99021 (bitIndex!0 (size!1280 (buf!1661 (_2!2945 lt!99018))) (currentByte!3303 (_2!2945 lt!99018)) (currentBit!3298 (_2!2945 lt!99018))))))

(declare-fun b!62924 () Bool)

(declare-fun res!52324 () Bool)

(assert (=> b!62924 (=> res!52324 e!41738)))

(assert (=> b!62924 (= res!52324 (not (invariant!0 (currentBit!3298 (_2!2945 lt!99017)) (currentByte!3303 (_2!2945 lt!99017)) (size!1280 (buf!1661 (_2!2945 lt!99018))))))))

(declare-fun b!62925 () Bool)

(declare-fun res!52325 () Bool)

(assert (=> b!62925 (=> res!52325 e!41740)))

(assert (=> b!62925 (= res!52325 (not (isPrefixOf!0 (_1!2944 lt!99026) (_2!2945 lt!99018))))))

(declare-fun b!62926 () Bool)

(declare-fun res!52319 () Bool)

(assert (=> b!62926 (=> res!52319 e!41736)))

(assert (=> b!62926 (= res!52319 (not (invariant!0 (currentBit!3298 (_2!2945 lt!99018)) (currentByte!3303 (_2!2945 lt!99018)) (size!1280 (buf!1661 (_2!2945 lt!99018))))))))

(declare-fun b!62927 () Bool)

(assert (=> b!62927 (= e!41736 e!41738)))

(declare-fun res!52310 () Bool)

(assert (=> b!62927 (=> res!52310 e!41738)))

(assert (=> b!62927 (= res!52310 (not (= (size!1280 (buf!1661 (_2!2945 lt!99017))) (size!1280 (buf!1661 (_2!2945 lt!99018))))))))

(declare-fun e!41734 () Bool)

(assert (=> b!62927 e!41734))

(declare-fun res!52317 () Bool)

(assert (=> b!62927 (=> (not res!52317) (not e!41734))))

(assert (=> b!62927 (= res!52317 (= (size!1280 (buf!1661 (_2!2945 lt!99018))) (size!1280 (buf!1661 thiss!1379))))))

(declare-fun b!62928 () Bool)

(declare-fun res!52326 () Bool)

(assert (=> b!62928 (=> (not res!52326) (not e!41733))))

(assert (=> b!62928 (= res!52326 (validate_offset_bits!1 ((_ sign_extend 32) (size!1280 (buf!1661 thiss!1379))) ((_ sign_extend 32) (currentByte!3303 thiss!1379)) ((_ sign_extend 32) (currentBit!3298 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!62929 () Bool)

(declare-fun e!41737 () Bool)

(declare-fun e!41731 () Bool)

(assert (=> b!62929 (= e!41737 e!41731)))

(declare-fun res!52315 () Bool)

(assert (=> b!62929 (=> res!52315 e!41731)))

(assert (=> b!62929 (= res!52315 (not (isPrefixOf!0 thiss!1379 (_2!2945 lt!99017))))))

(assert (=> b!62929 (validate_offset_bits!1 ((_ sign_extend 32) (size!1280 (buf!1661 (_2!2945 lt!99017)))) ((_ sign_extend 32) (currentByte!3303 (_2!2945 lt!99017))) ((_ sign_extend 32) (currentBit!3298 (_2!2945 lt!99017))) lt!99024)))

(assert (=> b!62929 (= lt!99024 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!99016 () Unit!4277)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2224 BitStream!2224 (_ BitVec 64) (_ BitVec 64)) Unit!4277)

(assert (=> b!62929 (= lt!99016 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2945 lt!99017) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2224 (_ BitVec 8) (_ BitVec 32)) tuple2!5668)

(assert (=> b!62929 (= lt!99017 (appendBitFromByte!0 thiss!1379 (select (arr!1844 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!62930 () Bool)

(assert (=> b!62930 (= e!41734 (= lt!99021 (bvsub (bvsub (bvadd (bitIndex!0 (size!1280 (buf!1661 (_2!2945 lt!99017))) (currentByte!3303 (_2!2945 lt!99017)) (currentBit!3298 (_2!2945 lt!99017))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!41732 () Bool)

(declare-fun lt!99019 () tuple2!5666)

(declare-fun b!62931 () Bool)

(declare-fun head!506 (List!687) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2224 array!2797 (_ BitVec 64) (_ BitVec 64)) List!687)

(assert (=> b!62931 (= e!41732 (= (head!506 (byteArrayBitContentToList!0 (_2!2945 lt!99017) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!506 (bitStreamReadBitsIntoList!0 (_2!2945 lt!99017) (_1!2944 lt!99019) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!62932 () Bool)

(declare-fun res!52318 () Bool)

(assert (=> b!62932 (=> res!52318 e!41740)))

(assert (=> b!62932 (= res!52318 (not (isPrefixOf!0 (_1!2944 lt!99023) (_2!2945 lt!99018))))))

(declare-fun b!62933 () Bool)

(assert (=> b!62933 (= e!41733 (not e!41737))))

(declare-fun res!52314 () Bool)

(assert (=> b!62933 (=> res!52314 e!41737)))

(assert (=> b!62933 (= res!52314 (bvsge i!635 to!314))))

(assert (=> b!62933 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!99013 () Unit!4277)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2224) Unit!4277)

(assert (=> b!62933 (= lt!99013 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!62933 (= lt!99025 (bitIndex!0 (size!1280 (buf!1661 thiss!1379)) (currentByte!3303 thiss!1379) (currentBit!3298 thiss!1379)))))

(declare-fun b!62934 () Bool)

(assert (=> b!62934 (= e!41731 e!41730)))

(declare-fun res!52321 () Bool)

(assert (=> b!62934 (=> res!52321 e!41730)))

(assert (=> b!62934 (= res!52321 (not (isPrefixOf!0 (_2!2945 lt!99017) (_2!2945 lt!99018))))))

(assert (=> b!62934 (isPrefixOf!0 thiss!1379 (_2!2945 lt!99018))))

(declare-fun lt!99015 () Unit!4277)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2224 BitStream!2224 BitStream!2224) Unit!4277)

(assert (=> b!62934 (= lt!99015 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2945 lt!99017) (_2!2945 lt!99018)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2224 array!2797 (_ BitVec 64) (_ BitVec 64)) tuple2!5668)

(assert (=> b!62934 (= lt!99018 (appendBitsMSBFirstLoop!0 (_2!2945 lt!99017) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!62934 e!41732))

(declare-fun res!52311 () Bool)

(assert (=> b!62934 (=> (not res!52311) (not e!41732))))

(assert (=> b!62934 (= res!52311 (validate_offset_bits!1 ((_ sign_extend 32) (size!1280 (buf!1661 (_2!2945 lt!99017)))) ((_ sign_extend 32) (currentByte!3303 thiss!1379)) ((_ sign_extend 32) (currentBit!3298 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!99022 () Unit!4277)

(assert (=> b!62934 (= lt!99022 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1661 (_2!2945 lt!99017)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!62934 (= lt!99019 (reader!0 thiss!1379 (_2!2945 lt!99017)))))

(declare-fun b!62935 () Bool)

(assert (=> b!62935 (= e!41740 (or (not (= (buf!1661 (_1!2944 lt!99023)) (buf!1661 (_1!2944 lt!99026)))) (= (buf!1661 (_1!2944 lt!99023)) (buf!1661 (_2!2945 lt!99018)))))))

(assert (= (and start!12336 res!52316) b!62928))

(assert (= (and b!62928 res!52326) b!62933))

(assert (= (and b!62933 (not res!52314)) b!62929))

(assert (= (and b!62929 (not res!52315)) b!62934))

(assert (= (and b!62934 res!52311) b!62931))

(assert (= (and b!62934 (not res!52321)) b!62923))

(assert (= (and b!62923 (not res!52313)) b!62926))

(assert (= (and b!62926 (not res!52319)) b!62919))

(assert (= (and b!62919 (not res!52320)) b!62927))

(assert (= (and b!62927 res!52317) b!62930))

(assert (= (and b!62927 (not res!52310)) b!62921))

(assert (= (and b!62921 (not res!52322)) b!62924))

(assert (= (and b!62924 (not res!52324)) b!62917))

(assert (= (and b!62917 (not res!52309)) b!62922))

(assert (= (and b!62922 (not res!52323)) b!62932))

(assert (= (and b!62932 (not res!52318)) b!62925))

(assert (= (and b!62925 (not res!52325)) b!62920))

(assert (= (and b!62920 (not res!52312)) b!62935))

(assert (= start!12336 b!62918))

(declare-fun m!99601 () Bool)

(assert (=> start!12336 m!99601))

(declare-fun m!99603 () Bool)

(assert (=> start!12336 m!99603))

(declare-fun m!99605 () Bool)

(assert (=> b!62931 m!99605))

(assert (=> b!62931 m!99605))

(declare-fun m!99607 () Bool)

(assert (=> b!62931 m!99607))

(declare-fun m!99609 () Bool)

(assert (=> b!62931 m!99609))

(assert (=> b!62931 m!99609))

(declare-fun m!99611 () Bool)

(assert (=> b!62931 m!99611))

(declare-fun m!99613 () Bool)

(assert (=> b!62928 m!99613))

(declare-fun m!99615 () Bool)

(assert (=> b!62933 m!99615))

(declare-fun m!99617 () Bool)

(assert (=> b!62933 m!99617))

(declare-fun m!99619 () Bool)

(assert (=> b!62933 m!99619))

(declare-fun m!99621 () Bool)

(assert (=> b!62920 m!99621))

(declare-fun m!99623 () Bool)

(assert (=> b!62929 m!99623))

(declare-fun m!99625 () Bool)

(assert (=> b!62929 m!99625))

(declare-fun m!99627 () Bool)

(assert (=> b!62929 m!99627))

(declare-fun m!99629 () Bool)

(assert (=> b!62929 m!99629))

(assert (=> b!62929 m!99625))

(declare-fun m!99631 () Bool)

(assert (=> b!62929 m!99631))

(declare-fun m!99633 () Bool)

(assert (=> b!62925 m!99633))

(declare-fun m!99635 () Bool)

(assert (=> b!62926 m!99635))

(declare-fun m!99637 () Bool)

(assert (=> b!62923 m!99637))

(declare-fun m!99639 () Bool)

(assert (=> b!62934 m!99639))

(declare-fun m!99641 () Bool)

(assert (=> b!62934 m!99641))

(declare-fun m!99643 () Bool)

(assert (=> b!62934 m!99643))

(declare-fun m!99645 () Bool)

(assert (=> b!62934 m!99645))

(declare-fun m!99647 () Bool)

(assert (=> b!62934 m!99647))

(declare-fun m!99649 () Bool)

(assert (=> b!62934 m!99649))

(declare-fun m!99651 () Bool)

(assert (=> b!62934 m!99651))

(declare-fun m!99653 () Bool)

(assert (=> b!62930 m!99653))

(declare-fun m!99655 () Bool)

(assert (=> b!62921 m!99655))

(declare-fun m!99657 () Bool)

(assert (=> b!62918 m!99657))

(declare-fun m!99659 () Bool)

(assert (=> b!62917 m!99659))

(declare-fun m!99661 () Bool)

(assert (=> b!62917 m!99661))

(declare-fun m!99663 () Bool)

(assert (=> b!62917 m!99663))

(declare-fun m!99665 () Bool)

(assert (=> b!62917 m!99665))

(declare-fun m!99667 () Bool)

(assert (=> b!62917 m!99667))

(declare-fun m!99669 () Bool)

(assert (=> b!62917 m!99669))

(declare-fun m!99671 () Bool)

(assert (=> b!62917 m!99671))

(declare-fun m!99673 () Bool)

(assert (=> b!62917 m!99673))

(declare-fun m!99675 () Bool)

(assert (=> b!62924 m!99675))

(declare-fun m!99677 () Bool)

(assert (=> b!62922 m!99677))

(declare-fun m!99679 () Bool)

(assert (=> b!62932 m!99679))

(push 1)

(assert (not b!62920))

(assert (not b!62932))

(assert (not b!62929))

(assert (not b!62930))

(assert (not b!62923))

(assert (not b!62921))

(assert (not b!62925))

(assert (not b!62931))

(assert (not b!62934))

(assert (not b!62928))

(assert (not b!62922))

(assert (not start!12336))

(assert (not b!62924))

(assert (not b!62917))

(assert (not b!62918))

(assert (not b!62933))

(assert (not b!62926))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!19596 () Bool)

(declare-fun size!1284 (List!687) Int)

(assert (=> d!19596 (= (length!315 lt!99028) (size!1284 lt!99028))))

(declare-fun bs!4846 () Bool)

(assert (= bs!4846 d!19596))

(declare-fun m!100017 () Bool)

(assert (=> bs!4846 m!100017))

(assert (=> b!62922 d!19596))

(declare-fun d!19598 () Bool)

(declare-fun res!52520 () Bool)

(declare-fun e!41879 () Bool)

(assert (=> d!19598 (=> (not res!52520) (not e!41879))))

(assert (=> d!19598 (= res!52520 (= (size!1280 (buf!1661 (_1!2944 lt!99023))) (size!1280 (buf!1661 (_2!2945 lt!99018)))))))

(assert (=> d!19598 (= (isPrefixOf!0 (_1!2944 lt!99023) (_2!2945 lt!99018)) e!41879)))

(declare-fun b!63172 () Bool)

(declare-fun res!52521 () Bool)

(assert (=> b!63172 (=> (not res!52521) (not e!41879))))

(assert (=> b!63172 (= res!52521 (bvsle (bitIndex!0 (size!1280 (buf!1661 (_1!2944 lt!99023))) (currentByte!3303 (_1!2944 lt!99023)) (currentBit!3298 (_1!2944 lt!99023))) (bitIndex!0 (size!1280 (buf!1661 (_2!2945 lt!99018))) (currentByte!3303 (_2!2945 lt!99018)) (currentBit!3298 (_2!2945 lt!99018)))))))

(declare-fun b!63173 () Bool)

(declare-fun e!41880 () Bool)

(assert (=> b!63173 (= e!41879 e!41880)))

(declare-fun res!52522 () Bool)

(assert (=> b!63173 (=> res!52522 e!41880)))

(assert (=> b!63173 (= res!52522 (= (size!1280 (buf!1661 (_1!2944 lt!99023))) #b00000000000000000000000000000000))))

(declare-fun b!63174 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2797 array!2797 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!63174 (= e!41880 (arrayBitRangesEq!0 (buf!1661 (_1!2944 lt!99023)) (buf!1661 (_2!2945 lt!99018)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1280 (buf!1661 (_1!2944 lt!99023))) (currentByte!3303 (_1!2944 lt!99023)) (currentBit!3298 (_1!2944 lt!99023)))))))

(assert (= (and d!19598 res!52520) b!63172))

(assert (= (and b!63172 res!52521) b!63173))

(assert (= (and b!63173 (not res!52522)) b!63174))

(declare-fun m!100019 () Bool)

(assert (=> b!63172 m!100019))

(assert (=> b!63172 m!99637))

(assert (=> b!63174 m!100019))

(assert (=> b!63174 m!100019))

(declare-fun m!100021 () Bool)

(assert (=> b!63174 m!100021))

(assert (=> b!62932 d!19598))

(declare-fun d!19600 () Bool)

(assert (=> d!19600 (= (array_inv!1171 srcBuffer!2) (bvsge (size!1280 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!12336 d!19600))

(declare-fun d!19602 () Bool)

(assert (=> d!19602 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3298 thiss!1379) (currentByte!3303 thiss!1379) (size!1280 (buf!1661 thiss!1379))))))

(declare-fun bs!4847 () Bool)

(assert (= bs!4847 d!19602))

(declare-fun m!100023 () Bool)

(assert (=> bs!4847 m!100023))

(assert (=> start!12336 d!19602))

(declare-fun d!19604 () Bool)

(assert (=> d!19604 (= (invariant!0 (currentBit!3298 (_2!2945 lt!99017)) (currentByte!3303 (_2!2945 lt!99017)) (size!1280 (buf!1661 (_2!2945 lt!99017)))) (and (bvsge (currentBit!3298 (_2!2945 lt!99017)) #b00000000000000000000000000000000) (bvslt (currentBit!3298 (_2!2945 lt!99017)) #b00000000000000000000000000001000) (bvsge (currentByte!3303 (_2!2945 lt!99017)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3303 (_2!2945 lt!99017)) (size!1280 (buf!1661 (_2!2945 lt!99017)))) (and (= (currentBit!3298 (_2!2945 lt!99017)) #b00000000000000000000000000000000) (= (currentByte!3303 (_2!2945 lt!99017)) (size!1280 (buf!1661 (_2!2945 lt!99017))))))))))

(assert (=> b!62921 d!19604))

(declare-fun d!19606 () Bool)

(assert (=> d!19606 (= (head!506 (byteArrayBitContentToList!0 (_2!2945 lt!99017) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!802 (byteArrayBitContentToList!0 (_2!2945 lt!99017) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!62931 d!19606))

(declare-fun d!19608 () Bool)

(declare-fun c!4500 () Bool)

(assert (=> d!19608 (= c!4500 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!41883 () List!687)

(assert (=> d!19608 (= (byteArrayBitContentToList!0 (_2!2945 lt!99017) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!41883)))

(declare-fun b!63179 () Bool)

(assert (=> b!63179 (= e!41883 Nil!684)))

(declare-fun b!63180 () Bool)

(assert (=> b!63180 (= e!41883 (Cons!683 (not (= (bvand ((_ sign_extend 24) (select (arr!1844 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2945 lt!99017) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!19608 c!4500) b!63179))

(assert (= (and d!19608 (not c!4500)) b!63180))

(assert (=> b!63180 m!99625))

(declare-fun m!100025 () Bool)

(assert (=> b!63180 m!100025))

(declare-fun m!100027 () Bool)

(assert (=> b!63180 m!100027))

(assert (=> b!62931 d!19608))

(declare-fun d!19610 () Bool)

(assert (=> d!19610 (= (head!506 (bitStreamReadBitsIntoList!0 (_2!2945 lt!99017) (_1!2944 lt!99019) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!802 (bitStreamReadBitsIntoList!0 (_2!2945 lt!99017) (_1!2944 lt!99019) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!62931 d!19610))

(declare-fun b!63191 () Bool)

(declare-fun e!41888 () Bool)

(declare-fun lt!99327 () List!687)

(declare-fun isEmpty!193 (List!687) Bool)

(assert (=> b!63191 (= e!41888 (isEmpty!193 lt!99327))))

(declare-fun b!63189 () Bool)

(declare-datatypes ((tuple2!5686 0))(
  ( (tuple2!5687 (_1!2954 List!687) (_2!2954 BitStream!2224)) )
))
(declare-fun e!41889 () tuple2!5686)

(assert (=> b!63189 (= e!41889 (tuple2!5687 Nil!684 (_1!2944 lt!99019)))))

(declare-fun b!63192 () Bool)

(assert (=> b!63192 (= e!41888 (> (length!315 lt!99327) 0))))

(declare-fun d!19612 () Bool)

(assert (=> d!19612 e!41888))

(declare-fun c!4505 () Bool)

(assert (=> d!19612 (= c!4505 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19612 (= lt!99327 (_1!2954 e!41889))))

(declare-fun c!4506 () Bool)

(assert (=> d!19612 (= c!4506 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19612 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19612 (= (bitStreamReadBitsIntoList!0 (_2!2945 lt!99017) (_1!2944 lt!99019) #b0000000000000000000000000000000000000000000000000000000000000001) lt!99327)))

(declare-datatypes ((tuple2!5688 0))(
  ( (tuple2!5689 (_1!2955 Bool) (_2!2955 BitStream!2224)) )
))
(declare-fun lt!99328 () tuple2!5688)

(declare-fun b!63190 () Bool)

(declare-fun lt!99326 () (_ BitVec 64))

(assert (=> b!63190 (= e!41889 (tuple2!5687 (Cons!683 (_1!2955 lt!99328) (bitStreamReadBitsIntoList!0 (_2!2945 lt!99017) (_2!2955 lt!99328) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!99326))) (_2!2955 lt!99328)))))

(declare-fun readBit!0 (BitStream!2224) tuple2!5688)

(assert (=> b!63190 (= lt!99328 (readBit!0 (_1!2944 lt!99019)))))

(assert (=> b!63190 (= lt!99326 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!19612 c!4506) b!63189))

(assert (= (and d!19612 (not c!4506)) b!63190))

(assert (= (and d!19612 c!4505) b!63191))

(assert (= (and d!19612 (not c!4505)) b!63192))

(declare-fun m!100029 () Bool)

(assert (=> b!63191 m!100029))

(declare-fun m!100031 () Bool)

(assert (=> b!63192 m!100031))

(declare-fun m!100033 () Bool)

(assert (=> b!63190 m!100033))

(declare-fun m!100035 () Bool)

(assert (=> b!63190 m!100035))

(assert (=> b!62931 d!19612))

(declare-fun d!19614 () Bool)

(declare-fun res!52523 () Bool)

(declare-fun e!41890 () Bool)

(assert (=> d!19614 (=> (not res!52523) (not e!41890))))

(assert (=> d!19614 (= res!52523 (= (size!1280 (buf!1661 (_1!2944 lt!99023))) (size!1280 (buf!1661 (_1!2944 lt!99026)))))))

(assert (=> d!19614 (= (isPrefixOf!0 (_1!2944 lt!99023) (_1!2944 lt!99026)) e!41890)))

(declare-fun b!63193 () Bool)

(declare-fun res!52524 () Bool)

(assert (=> b!63193 (=> (not res!52524) (not e!41890))))

(assert (=> b!63193 (= res!52524 (bvsle (bitIndex!0 (size!1280 (buf!1661 (_1!2944 lt!99023))) (currentByte!3303 (_1!2944 lt!99023)) (currentBit!3298 (_1!2944 lt!99023))) (bitIndex!0 (size!1280 (buf!1661 (_1!2944 lt!99026))) (currentByte!3303 (_1!2944 lt!99026)) (currentBit!3298 (_1!2944 lt!99026)))))))

(declare-fun b!63194 () Bool)

(declare-fun e!41891 () Bool)

(assert (=> b!63194 (= e!41890 e!41891)))

(declare-fun res!52525 () Bool)

(assert (=> b!63194 (=> res!52525 e!41891)))

(assert (=> b!63194 (= res!52525 (= (size!1280 (buf!1661 (_1!2944 lt!99023))) #b00000000000000000000000000000000))))

(declare-fun b!63195 () Bool)

(assert (=> b!63195 (= e!41891 (arrayBitRangesEq!0 (buf!1661 (_1!2944 lt!99023)) (buf!1661 (_1!2944 lt!99026)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1280 (buf!1661 (_1!2944 lt!99023))) (currentByte!3303 (_1!2944 lt!99023)) (currentBit!3298 (_1!2944 lt!99023)))))))

(assert (= (and d!19614 res!52523) b!63193))

(assert (= (and b!63193 res!52524) b!63194))

(assert (= (and b!63194 (not res!52525)) b!63195))

(assert (=> b!63193 m!100019))

(declare-fun m!100037 () Bool)

(assert (=> b!63193 m!100037))

(assert (=> b!63195 m!100019))

(assert (=> b!63195 m!100019))

(declare-fun m!100039 () Bool)

(assert (=> b!63195 m!100039))

(assert (=> b!62920 d!19614))

(declare-fun d!19616 () Bool)

(assert (=> d!19616 (= (invariant!0 (currentBit!3298 (_2!2945 lt!99017)) (currentByte!3303 (_2!2945 lt!99017)) (size!1280 (buf!1661 (_2!2945 lt!99018)))) (and (bvsge (currentBit!3298 (_2!2945 lt!99017)) #b00000000000000000000000000000000) (bvslt (currentBit!3298 (_2!2945 lt!99017)) #b00000000000000000000000000001000) (bvsge (currentByte!3303 (_2!2945 lt!99017)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3303 (_2!2945 lt!99017)) (size!1280 (buf!1661 (_2!2945 lt!99018)))) (and (= (currentBit!3298 (_2!2945 lt!99017)) #b00000000000000000000000000000000) (= (currentByte!3303 (_2!2945 lt!99017)) (size!1280 (buf!1661 (_2!2945 lt!99018))))))))))

(assert (=> b!62924 d!19616))

(declare-fun d!19618 () Bool)

(assert (=> d!19618 (validate_offset_bits!1 ((_ sign_extend 32) (size!1280 (buf!1661 (_2!2945 lt!99017)))) ((_ sign_extend 32) (currentByte!3303 thiss!1379)) ((_ sign_extend 32) (currentBit!3298 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!99331 () Unit!4277)

(declare-fun choose!9 (BitStream!2224 array!2797 (_ BitVec 64) BitStream!2224) Unit!4277)

(assert (=> d!19618 (= lt!99331 (choose!9 thiss!1379 (buf!1661 (_2!2945 lt!99017)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2225 (buf!1661 (_2!2945 lt!99017)) (currentByte!3303 thiss!1379) (currentBit!3298 thiss!1379))))))

(assert (=> d!19618 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1661 (_2!2945 lt!99017)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!99331)))

(declare-fun bs!4848 () Bool)

(assert (= bs!4848 d!19618))

(assert (=> bs!4848 m!99639))

(declare-fun m!100041 () Bool)

(assert (=> bs!4848 m!100041))

(assert (=> b!62934 d!19618))

(declare-fun d!19620 () Bool)

(declare-fun res!52526 () Bool)

(declare-fun e!41892 () Bool)

(assert (=> d!19620 (=> (not res!52526) (not e!41892))))

(assert (=> d!19620 (= res!52526 (= (size!1280 (buf!1661 thiss!1379)) (size!1280 (buf!1661 (_2!2945 lt!99018)))))))

(assert (=> d!19620 (= (isPrefixOf!0 thiss!1379 (_2!2945 lt!99018)) e!41892)))

(declare-fun b!63196 () Bool)

(declare-fun res!52527 () Bool)

(assert (=> b!63196 (=> (not res!52527) (not e!41892))))

(assert (=> b!63196 (= res!52527 (bvsle (bitIndex!0 (size!1280 (buf!1661 thiss!1379)) (currentByte!3303 thiss!1379) (currentBit!3298 thiss!1379)) (bitIndex!0 (size!1280 (buf!1661 (_2!2945 lt!99018))) (currentByte!3303 (_2!2945 lt!99018)) (currentBit!3298 (_2!2945 lt!99018)))))))

(declare-fun b!63197 () Bool)

(declare-fun e!41893 () Bool)

(assert (=> b!63197 (= e!41892 e!41893)))

(declare-fun res!52528 () Bool)

(assert (=> b!63197 (=> res!52528 e!41893)))

(assert (=> b!63197 (= res!52528 (= (size!1280 (buf!1661 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!63198 () Bool)

(assert (=> b!63198 (= e!41893 (arrayBitRangesEq!0 (buf!1661 thiss!1379) (buf!1661 (_2!2945 lt!99018)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1280 (buf!1661 thiss!1379)) (currentByte!3303 thiss!1379) (currentBit!3298 thiss!1379))))))

(assert (= (and d!19620 res!52526) b!63196))

(assert (= (and b!63196 res!52527) b!63197))

(assert (= (and b!63197 (not res!52528)) b!63198))

(assert (=> b!63196 m!99619))

(assert (=> b!63196 m!99637))

(assert (=> b!63198 m!99619))

(assert (=> b!63198 m!99619))

(declare-fun m!100043 () Bool)

(assert (=> b!63198 m!100043))

(assert (=> b!62934 d!19620))

(declare-fun b!63272 () Bool)

(declare-fun e!41926 () tuple2!5668)

(declare-fun lt!99652 () tuple2!5668)

(declare-fun Unit!4293 () Unit!4277)

(assert (=> b!63272 (= e!41926 (tuple2!5669 Unit!4293 (_2!2945 lt!99652)))))

(declare-fun lt!99637 () tuple2!5668)

(assert (=> b!63272 (= lt!99637 (appendBitFromByte!0 (_2!2945 lt!99017) (select (arr!1844 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!99666 () (_ BitVec 64))

(assert (=> b!63272 (= lt!99666 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!99668 () (_ BitVec 64))

(assert (=> b!63272 (= lt!99668 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!99658 () Unit!4277)

(assert (=> b!63272 (= lt!99658 (validateOffsetBitsIneqLemma!0 (_2!2945 lt!99017) (_2!2945 lt!99637) lt!99666 lt!99668))))

(assert (=> b!63272 (validate_offset_bits!1 ((_ sign_extend 32) (size!1280 (buf!1661 (_2!2945 lt!99637)))) ((_ sign_extend 32) (currentByte!3303 (_2!2945 lt!99637))) ((_ sign_extend 32) (currentBit!3298 (_2!2945 lt!99637))) (bvsub lt!99666 lt!99668))))

(declare-fun lt!99670 () Unit!4277)

(assert (=> b!63272 (= lt!99670 lt!99658)))

(declare-fun lt!99651 () tuple2!5666)

(assert (=> b!63272 (= lt!99651 (reader!0 (_2!2945 lt!99017) (_2!2945 lt!99637)))))

(declare-fun lt!99636 () (_ BitVec 64))

(assert (=> b!63272 (= lt!99636 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!99667 () Unit!4277)

(assert (=> b!63272 (= lt!99667 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2945 lt!99017) (buf!1661 (_2!2945 lt!99637)) lt!99636))))

(assert (=> b!63272 (validate_offset_bits!1 ((_ sign_extend 32) (size!1280 (buf!1661 (_2!2945 lt!99637)))) ((_ sign_extend 32) (currentByte!3303 (_2!2945 lt!99017))) ((_ sign_extend 32) (currentBit!3298 (_2!2945 lt!99017))) lt!99636)))

(declare-fun lt!99660 () Unit!4277)

(assert (=> b!63272 (= lt!99660 lt!99667)))

(assert (=> b!63272 (= (head!506 (byteArrayBitContentToList!0 (_2!2945 lt!99637) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!506 (bitStreamReadBitsIntoList!0 (_2!2945 lt!99637) (_1!2944 lt!99651) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!99653 () Unit!4277)

(declare-fun Unit!4294 () Unit!4277)

(assert (=> b!63272 (= lt!99653 Unit!4294)))

(assert (=> b!63272 (= lt!99652 (appendBitsMSBFirstLoop!0 (_2!2945 lt!99637) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!99657 () Unit!4277)

(assert (=> b!63272 (= lt!99657 (lemmaIsPrefixTransitive!0 (_2!2945 lt!99017) (_2!2945 lt!99637) (_2!2945 lt!99652)))))

(assert (=> b!63272 (isPrefixOf!0 (_2!2945 lt!99017) (_2!2945 lt!99652))))

(declare-fun lt!99643 () Unit!4277)

(assert (=> b!63272 (= lt!99643 lt!99657)))

(assert (=> b!63272 (= (size!1280 (buf!1661 (_2!2945 lt!99652))) (size!1280 (buf!1661 (_2!2945 lt!99017))))))

(declare-fun lt!99633 () Unit!4277)

(declare-fun Unit!4295 () Unit!4277)

(assert (=> b!63272 (= lt!99633 Unit!4295)))

(assert (=> b!63272 (= (bitIndex!0 (size!1280 (buf!1661 (_2!2945 lt!99652))) (currentByte!3303 (_2!2945 lt!99652)) (currentBit!3298 (_2!2945 lt!99652))) (bvsub (bvadd (bitIndex!0 (size!1280 (buf!1661 (_2!2945 lt!99017))) (currentByte!3303 (_2!2945 lt!99017)) (currentBit!3298 (_2!2945 lt!99017))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!99635 () Unit!4277)

(declare-fun Unit!4296 () Unit!4277)

(assert (=> b!63272 (= lt!99635 Unit!4296)))

(assert (=> b!63272 (= (bitIndex!0 (size!1280 (buf!1661 (_2!2945 lt!99652))) (currentByte!3303 (_2!2945 lt!99652)) (currentBit!3298 (_2!2945 lt!99652))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1280 (buf!1661 (_2!2945 lt!99637))) (currentByte!3303 (_2!2945 lt!99637)) (currentBit!3298 (_2!2945 lt!99637))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!99638 () Unit!4277)

(declare-fun Unit!4297 () Unit!4277)

(assert (=> b!63272 (= lt!99638 Unit!4297)))

(declare-fun lt!99646 () tuple2!5666)

(assert (=> b!63272 (= lt!99646 (reader!0 (_2!2945 lt!99017) (_2!2945 lt!99652)))))

(declare-fun lt!99649 () (_ BitVec 64))

(assert (=> b!63272 (= lt!99649 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!99661 () Unit!4277)

(assert (=> b!63272 (= lt!99661 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2945 lt!99017) (buf!1661 (_2!2945 lt!99652)) lt!99649))))

(assert (=> b!63272 (validate_offset_bits!1 ((_ sign_extend 32) (size!1280 (buf!1661 (_2!2945 lt!99652)))) ((_ sign_extend 32) (currentByte!3303 (_2!2945 lt!99017))) ((_ sign_extend 32) (currentBit!3298 (_2!2945 lt!99017))) lt!99649)))

(declare-fun lt!99656 () Unit!4277)

(assert (=> b!63272 (= lt!99656 lt!99661)))

(declare-fun lt!99631 () tuple2!5666)

(declare-fun call!805 () tuple2!5666)

(assert (=> b!63272 (= lt!99631 call!805)))

(declare-fun lt!99672 () (_ BitVec 64))

(assert (=> b!63272 (= lt!99672 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!99641 () Unit!4277)

(assert (=> b!63272 (= lt!99641 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2945 lt!99637) (buf!1661 (_2!2945 lt!99652)) lt!99672))))

(assert (=> b!63272 (validate_offset_bits!1 ((_ sign_extend 32) (size!1280 (buf!1661 (_2!2945 lt!99652)))) ((_ sign_extend 32) (currentByte!3303 (_2!2945 lt!99637))) ((_ sign_extend 32) (currentBit!3298 (_2!2945 lt!99637))) lt!99672)))

(declare-fun lt!99654 () Unit!4277)

(assert (=> b!63272 (= lt!99654 lt!99641)))

(declare-fun lt!99673 () List!687)

(assert (=> b!63272 (= lt!99673 (byteArrayBitContentToList!0 (_2!2945 lt!99652) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!99645 () List!687)

(assert (=> b!63272 (= lt!99645 (byteArrayBitContentToList!0 (_2!2945 lt!99652) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!99662 () List!687)

(assert (=> b!63272 (= lt!99662 (bitStreamReadBitsIntoList!0 (_2!2945 lt!99652) (_1!2944 lt!99646) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!99630 () List!687)

(assert (=> b!63272 (= lt!99630 (bitStreamReadBitsIntoList!0 (_2!2945 lt!99652) (_1!2944 lt!99631) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!99671 () (_ BitVec 64))

(assert (=> b!63272 (= lt!99671 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!99639 () Unit!4277)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2224 BitStream!2224 BitStream!2224 BitStream!2224 (_ BitVec 64) List!687) Unit!4277)

(assert (=> b!63272 (= lt!99639 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2945 lt!99652) (_2!2945 lt!99652) (_1!2944 lt!99646) (_1!2944 lt!99631) lt!99671 lt!99662))))

(declare-fun tail!295 (List!687) List!687)

(assert (=> b!63272 (= (bitStreamReadBitsIntoList!0 (_2!2945 lt!99652) (_1!2944 lt!99631) (bvsub lt!99671 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!295 lt!99662))))

(declare-fun lt!99640 () Unit!4277)

(assert (=> b!63272 (= lt!99640 lt!99639)))

(declare-fun lt!99634 () (_ BitVec 64))

(declare-fun lt!99655 () Unit!4277)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2797 array!2797 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4277)

(assert (=> b!63272 (= lt!99655 (arrayBitRangesEqImpliesEq!0 (buf!1661 (_2!2945 lt!99637)) (buf!1661 (_2!2945 lt!99652)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!99634 (bitIndex!0 (size!1280 (buf!1661 (_2!2945 lt!99637))) (currentByte!3303 (_2!2945 lt!99637)) (currentBit!3298 (_2!2945 lt!99637)))))))

(declare-fun bitAt!0 (array!2797 (_ BitVec 64)) Bool)

(assert (=> b!63272 (= (bitAt!0 (buf!1661 (_2!2945 lt!99637)) lt!99634) (bitAt!0 (buf!1661 (_2!2945 lt!99652)) lt!99634))))

(declare-fun lt!99632 () Unit!4277)

(assert (=> b!63272 (= lt!99632 lt!99655)))

(declare-fun b!63273 () Bool)

(declare-fun e!41928 () Bool)

(declare-fun lt!99664 () (_ BitVec 64))

(assert (=> b!63273 (= e!41928 (validate_offset_bits!1 ((_ sign_extend 32) (size!1280 (buf!1661 (_2!2945 lt!99017)))) ((_ sign_extend 32) (currentByte!3303 (_2!2945 lt!99017))) ((_ sign_extend 32) (currentBit!3298 (_2!2945 lt!99017))) lt!99664))))

(declare-fun b!63274 () Bool)

(declare-fun res!52586 () Bool)

(declare-fun e!41927 () Bool)

(assert (=> b!63274 (=> (not res!52586) (not e!41927))))

(declare-fun lt!99665 () tuple2!5668)

(assert (=> b!63274 (= res!52586 (isPrefixOf!0 (_2!2945 lt!99017) (_2!2945 lt!99665)))))

(declare-fun b!63275 () Bool)

(declare-fun res!52591 () Bool)

(assert (=> b!63275 (=> (not res!52591) (not e!41927))))

(assert (=> b!63275 (= res!52591 (= (size!1280 (buf!1661 (_2!2945 lt!99017))) (size!1280 (buf!1661 (_2!2945 lt!99665)))))))

(declare-fun b!63277 () Bool)

(declare-fun res!52590 () Bool)

(assert (=> b!63277 (=> (not res!52590) (not e!41927))))

(assert (=> b!63277 (= res!52590 (= (size!1280 (buf!1661 (_2!2945 lt!99665))) (size!1280 (buf!1661 (_2!2945 lt!99017)))))))

(declare-fun b!63278 () Bool)

(declare-fun res!52587 () Bool)

(assert (=> b!63278 (=> (not res!52587) (not e!41927))))

(assert (=> b!63278 (= res!52587 (invariant!0 (currentBit!3298 (_2!2945 lt!99665)) (currentByte!3303 (_2!2945 lt!99665)) (size!1280 (buf!1661 (_2!2945 lt!99665)))))))

(declare-fun lt!99659 () tuple2!5666)

(declare-fun b!63276 () Bool)

(assert (=> b!63276 (= e!41927 (= (bitStreamReadBitsIntoList!0 (_2!2945 lt!99665) (_1!2944 lt!99659) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2945 lt!99665) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!63276 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63276 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!99650 () Unit!4277)

(declare-fun lt!99669 () Unit!4277)

(assert (=> b!63276 (= lt!99650 lt!99669)))

(assert (=> b!63276 (validate_offset_bits!1 ((_ sign_extend 32) (size!1280 (buf!1661 (_2!2945 lt!99665)))) ((_ sign_extend 32) (currentByte!3303 (_2!2945 lt!99017))) ((_ sign_extend 32) (currentBit!3298 (_2!2945 lt!99017))) lt!99664)))

(assert (=> b!63276 (= lt!99669 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2945 lt!99017) (buf!1661 (_2!2945 lt!99665)) lt!99664))))

(assert (=> b!63276 e!41928))

(declare-fun res!52589 () Bool)

(assert (=> b!63276 (=> (not res!52589) (not e!41928))))

(assert (=> b!63276 (= res!52589 (and (= (size!1280 (buf!1661 (_2!2945 lt!99017))) (size!1280 (buf!1661 (_2!2945 lt!99665)))) (bvsge lt!99664 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63276 (= lt!99664 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!63276 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63276 (= lt!99659 (reader!0 (_2!2945 lt!99017) (_2!2945 lt!99665)))))

(declare-fun d!19622 () Bool)

(assert (=> d!19622 e!41927))

(declare-fun res!52588 () Bool)

(assert (=> d!19622 (=> (not res!52588) (not e!41927))))

(declare-fun lt!99648 () (_ BitVec 64))

(assert (=> d!19622 (= res!52588 (= (bitIndex!0 (size!1280 (buf!1661 (_2!2945 lt!99665))) (currentByte!3303 (_2!2945 lt!99665)) (currentBit!3298 (_2!2945 lt!99665))) (bvsub lt!99648 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!19622 (or (= (bvand lt!99648 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!99648 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!99648 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!99647 () (_ BitVec 64))

(assert (=> d!19622 (= lt!99648 (bvadd lt!99647 to!314))))

(assert (=> d!19622 (or (not (= (bvand lt!99647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!99647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!99647 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19622 (= lt!99647 (bitIndex!0 (size!1280 (buf!1661 (_2!2945 lt!99017))) (currentByte!3303 (_2!2945 lt!99017)) (currentBit!3298 (_2!2945 lt!99017))))))

(assert (=> d!19622 (= lt!99665 e!41926)))

(declare-fun c!4515 () Bool)

(assert (=> d!19622 (= c!4515 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!99644 () Unit!4277)

(declare-fun lt!99642 () Unit!4277)

(assert (=> d!19622 (= lt!99644 lt!99642)))

(assert (=> d!19622 (isPrefixOf!0 (_2!2945 lt!99017) (_2!2945 lt!99017))))

(assert (=> d!19622 (= lt!99642 (lemmaIsPrefixRefl!0 (_2!2945 lt!99017)))))

(assert (=> d!19622 (= lt!99634 (bitIndex!0 (size!1280 (buf!1661 (_2!2945 lt!99017))) (currentByte!3303 (_2!2945 lt!99017)) (currentBit!3298 (_2!2945 lt!99017))))))

(assert (=> d!19622 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19622 (= (appendBitsMSBFirstLoop!0 (_2!2945 lt!99017) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!99665)))

(declare-fun b!63279 () Bool)

(declare-fun Unit!4298 () Unit!4277)

(assert (=> b!63279 (= e!41926 (tuple2!5669 Unit!4298 (_2!2945 lt!99017)))))

(assert (=> b!63279 (= (size!1280 (buf!1661 (_2!2945 lt!99017))) (size!1280 (buf!1661 (_2!2945 lt!99017))))))

(declare-fun lt!99663 () Unit!4277)

(declare-fun Unit!4299 () Unit!4277)

(assert (=> b!63279 (= lt!99663 Unit!4299)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2224 array!2797 array!2797 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5690 0))(
  ( (tuple2!5691 (_1!2956 array!2797) (_2!2956 BitStream!2224)) )
))
(declare-fun readBits!0 (BitStream!2224 (_ BitVec 64)) tuple2!5690)

(assert (=> b!63279 (checkByteArrayBitContent!0 (_2!2945 lt!99017) srcBuffer!2 (_1!2956 (readBits!0 (_1!2944 call!805) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun bm!802 () Bool)

(assert (=> bm!802 (= call!805 (reader!0 (ite c!4515 (_2!2945 lt!99637) (_2!2945 lt!99017)) (ite c!4515 (_2!2945 lt!99652) (_2!2945 lt!99017))))))

(assert (= (and d!19622 c!4515) b!63272))

(assert (= (and d!19622 (not c!4515)) b!63279))

(assert (= (or b!63272 b!63279) bm!802))

(assert (= (and d!19622 res!52588) b!63278))

(assert (= (and b!63278 res!52587) b!63275))

(assert (= (and b!63275 res!52591) b!63274))

(assert (= (and b!63274 res!52586) b!63277))

(assert (= (and b!63277 res!52590) b!63276))

(assert (= (and b!63276 res!52589) b!63273))

(declare-fun m!100171 () Bool)

(assert (=> b!63278 m!100171))

(declare-fun m!100173 () Bool)

(assert (=> d!19622 m!100173))

(assert (=> d!19622 m!99653))

(declare-fun m!100175 () Bool)

(assert (=> d!19622 m!100175))

(declare-fun m!100177 () Bool)

(assert (=> d!19622 m!100177))

(declare-fun m!100179 () Bool)

(assert (=> b!63272 m!100179))

(declare-fun m!100181 () Bool)

(assert (=> b!63272 m!100181))

(declare-fun m!100183 () Bool)

(assert (=> b!63272 m!100183))

(declare-fun m!100185 () Bool)

(assert (=> b!63272 m!100185))

(declare-fun m!100187 () Bool)

(assert (=> b!63272 m!100187))

(declare-fun m!100189 () Bool)

(assert (=> b!63272 m!100189))

(declare-fun m!100191 () Bool)

(assert (=> b!63272 m!100191))

(declare-fun m!100193 () Bool)

(assert (=> b!63272 m!100193))

(assert (=> b!63272 m!99653))

(declare-fun m!100195 () Bool)

(assert (=> b!63272 m!100195))

(declare-fun m!100197 () Bool)

(assert (=> b!63272 m!100197))

(declare-fun m!100199 () Bool)

(assert (=> b!63272 m!100199))

(declare-fun m!100201 () Bool)

(assert (=> b!63272 m!100201))

(declare-fun m!100203 () Bool)

(assert (=> b!63272 m!100203))

(assert (=> b!63272 m!100201))

(declare-fun m!100205 () Bool)

(assert (=> b!63272 m!100205))

(declare-fun m!100207 () Bool)

(assert (=> b!63272 m!100207))

(declare-fun m!100209 () Bool)

(assert (=> b!63272 m!100209))

(assert (=> b!63272 m!100185))

(declare-fun m!100211 () Bool)

(assert (=> b!63272 m!100211))

(declare-fun m!100213 () Bool)

(assert (=> b!63272 m!100213))

(declare-fun m!100215 () Bool)

(assert (=> b!63272 m!100215))

(declare-fun m!100217 () Bool)

(assert (=> b!63272 m!100217))

(declare-fun m!100219 () Bool)

(assert (=> b!63272 m!100219))

(assert (=> b!63272 m!100213))

(declare-fun m!100221 () Bool)

(assert (=> b!63272 m!100221))

(declare-fun m!100223 () Bool)

(assert (=> b!63272 m!100223))

(declare-fun m!100225 () Bool)

(assert (=> b!63272 m!100225))

(declare-fun m!100227 () Bool)

(assert (=> b!63272 m!100227))

(declare-fun m!100229 () Bool)

(assert (=> b!63272 m!100229))

(declare-fun m!100231 () Bool)

(assert (=> b!63272 m!100231))

(declare-fun m!100233 () Bool)

(assert (=> b!63272 m!100233))

(assert (=> b!63272 m!100223))

(declare-fun m!100235 () Bool)

(assert (=> b!63272 m!100235))

(declare-fun m!100237 () Bool)

(assert (=> b!63272 m!100237))

(declare-fun m!100239 () Bool)

(assert (=> b!63272 m!100239))

(declare-fun m!100241 () Bool)

(assert (=> b!63274 m!100241))

(declare-fun m!100243 () Bool)

(assert (=> b!63276 m!100243))

(declare-fun m!100245 () Bool)

(assert (=> b!63276 m!100245))

(declare-fun m!100247 () Bool)

(assert (=> b!63276 m!100247))

(declare-fun m!100249 () Bool)

(assert (=> b!63276 m!100249))

(declare-fun m!100251 () Bool)

(assert (=> b!63276 m!100251))

(declare-fun m!100253 () Bool)

(assert (=> b!63273 m!100253))

(declare-fun m!100255 () Bool)

(assert (=> b!63279 m!100255))

(declare-fun m!100257 () Bool)

(assert (=> b!63279 m!100257))

(declare-fun m!100259 () Bool)

(assert (=> bm!802 m!100259))

(assert (=> b!62934 d!19622))

(declare-fun d!19642 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!19642 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1280 (buf!1661 (_2!2945 lt!99017)))) ((_ sign_extend 32) (currentByte!3303 thiss!1379)) ((_ sign_extend 32) (currentBit!3298 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1280 (buf!1661 (_2!2945 lt!99017)))) ((_ sign_extend 32) (currentByte!3303 thiss!1379)) ((_ sign_extend 32) (currentBit!3298 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4851 () Bool)

(assert (= bs!4851 d!19642))

(declare-fun m!100261 () Bool)

(assert (=> bs!4851 m!100261))

(assert (=> b!62934 d!19642))

(declare-fun b!63290 () Bool)

(declare-fun e!41933 () Unit!4277)

(declare-fun Unit!4300 () Unit!4277)

(assert (=> b!63290 (= e!41933 Unit!4300)))

(declare-fun d!19644 () Bool)

(declare-fun e!41934 () Bool)

(assert (=> d!19644 e!41934))

(declare-fun res!52600 () Bool)

(assert (=> d!19644 (=> (not res!52600) (not e!41934))))

(declare-fun lt!99727 () tuple2!5666)

(assert (=> d!19644 (= res!52600 (isPrefixOf!0 (_1!2944 lt!99727) (_2!2944 lt!99727)))))

(declare-fun lt!99720 () BitStream!2224)

(assert (=> d!19644 (= lt!99727 (tuple2!5667 lt!99720 (_2!2945 lt!99017)))))

(declare-fun lt!99719 () Unit!4277)

(declare-fun lt!99715 () Unit!4277)

(assert (=> d!19644 (= lt!99719 lt!99715)))

(assert (=> d!19644 (isPrefixOf!0 lt!99720 (_2!2945 lt!99017))))

(assert (=> d!19644 (= lt!99715 (lemmaIsPrefixTransitive!0 lt!99720 (_2!2945 lt!99017) (_2!2945 lt!99017)))))

(declare-fun lt!99732 () Unit!4277)

(declare-fun lt!99716 () Unit!4277)

(assert (=> d!19644 (= lt!99732 lt!99716)))

(assert (=> d!19644 (isPrefixOf!0 lt!99720 (_2!2945 lt!99017))))

(assert (=> d!19644 (= lt!99716 (lemmaIsPrefixTransitive!0 lt!99720 thiss!1379 (_2!2945 lt!99017)))))

(declare-fun lt!99730 () Unit!4277)

(assert (=> d!19644 (= lt!99730 e!41933)))

(declare-fun c!4518 () Bool)

(assert (=> d!19644 (= c!4518 (not (= (size!1280 (buf!1661 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!99724 () Unit!4277)

(declare-fun lt!99726 () Unit!4277)

(assert (=> d!19644 (= lt!99724 lt!99726)))

(assert (=> d!19644 (isPrefixOf!0 (_2!2945 lt!99017) (_2!2945 lt!99017))))

(assert (=> d!19644 (= lt!99726 (lemmaIsPrefixRefl!0 (_2!2945 lt!99017)))))

(declare-fun lt!99731 () Unit!4277)

(declare-fun lt!99725 () Unit!4277)

(assert (=> d!19644 (= lt!99731 lt!99725)))

(assert (=> d!19644 (= lt!99725 (lemmaIsPrefixRefl!0 (_2!2945 lt!99017)))))

(declare-fun lt!99714 () Unit!4277)

(declare-fun lt!99717 () Unit!4277)

(assert (=> d!19644 (= lt!99714 lt!99717)))

(assert (=> d!19644 (isPrefixOf!0 lt!99720 lt!99720)))

(assert (=> d!19644 (= lt!99717 (lemmaIsPrefixRefl!0 lt!99720))))

(declare-fun lt!99733 () Unit!4277)

(declare-fun lt!99728 () Unit!4277)

(assert (=> d!19644 (= lt!99733 lt!99728)))

(assert (=> d!19644 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!19644 (= lt!99728 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!19644 (= lt!99720 (BitStream!2225 (buf!1661 (_2!2945 lt!99017)) (currentByte!3303 thiss!1379) (currentBit!3298 thiss!1379)))))

(assert (=> d!19644 (isPrefixOf!0 thiss!1379 (_2!2945 lt!99017))))

(assert (=> d!19644 (= (reader!0 thiss!1379 (_2!2945 lt!99017)) lt!99727)))

(declare-fun b!63291 () Bool)

(declare-fun res!52599 () Bool)

(assert (=> b!63291 (=> (not res!52599) (not e!41934))))

(assert (=> b!63291 (= res!52599 (isPrefixOf!0 (_2!2944 lt!99727) (_2!2945 lt!99017)))))

(declare-fun b!63292 () Bool)

(declare-fun lt!99722 () (_ BitVec 64))

(declare-fun lt!99723 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2224 (_ BitVec 64)) BitStream!2224)

(assert (=> b!63292 (= e!41934 (= (_1!2944 lt!99727) (withMovedBitIndex!0 (_2!2944 lt!99727) (bvsub lt!99723 lt!99722))))))

(assert (=> b!63292 (or (= (bvand lt!99723 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!99722 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!99723 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!99723 lt!99722) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63292 (= lt!99722 (bitIndex!0 (size!1280 (buf!1661 (_2!2945 lt!99017))) (currentByte!3303 (_2!2945 lt!99017)) (currentBit!3298 (_2!2945 lt!99017))))))

(assert (=> b!63292 (= lt!99723 (bitIndex!0 (size!1280 (buf!1661 thiss!1379)) (currentByte!3303 thiss!1379) (currentBit!3298 thiss!1379)))))

(declare-fun b!63293 () Bool)

(declare-fun lt!99718 () Unit!4277)

(assert (=> b!63293 (= e!41933 lt!99718)))

(declare-fun lt!99721 () (_ BitVec 64))

(assert (=> b!63293 (= lt!99721 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!99729 () (_ BitVec 64))

(assert (=> b!63293 (= lt!99729 (bitIndex!0 (size!1280 (buf!1661 thiss!1379)) (currentByte!3303 thiss!1379) (currentBit!3298 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2797 array!2797 (_ BitVec 64) (_ BitVec 64)) Unit!4277)

(assert (=> b!63293 (= lt!99718 (arrayBitRangesEqSymmetric!0 (buf!1661 thiss!1379) (buf!1661 (_2!2945 lt!99017)) lt!99721 lt!99729))))

(assert (=> b!63293 (arrayBitRangesEq!0 (buf!1661 (_2!2945 lt!99017)) (buf!1661 thiss!1379) lt!99721 lt!99729)))

(declare-fun b!63294 () Bool)

(declare-fun res!52598 () Bool)

(assert (=> b!63294 (=> (not res!52598) (not e!41934))))

(assert (=> b!63294 (= res!52598 (isPrefixOf!0 (_1!2944 lt!99727) thiss!1379))))

(assert (= (and d!19644 c!4518) b!63293))

(assert (= (and d!19644 (not c!4518)) b!63290))

(assert (= (and d!19644 res!52600) b!63294))

(assert (= (and b!63294 res!52598) b!63291))

(assert (= (and b!63291 res!52599) b!63292))

(declare-fun m!100263 () Bool)

(assert (=> d!19644 m!100263))

(declare-fun m!100265 () Bool)

(assert (=> d!19644 m!100265))

(assert (=> d!19644 m!99617))

(assert (=> d!19644 m!100177))

(declare-fun m!100267 () Bool)

(assert (=> d!19644 m!100267))

(declare-fun m!100269 () Bool)

(assert (=> d!19644 m!100269))

(declare-fun m!100271 () Bool)

(assert (=> d!19644 m!100271))

(declare-fun m!100273 () Bool)

(assert (=> d!19644 m!100273))

(assert (=> d!19644 m!99629))

(assert (=> d!19644 m!100175))

(assert (=> d!19644 m!99615))

(declare-fun m!100275 () Bool)

(assert (=> b!63294 m!100275))

(assert (=> b!63293 m!99619))

(declare-fun m!100277 () Bool)

(assert (=> b!63293 m!100277))

(declare-fun m!100279 () Bool)

(assert (=> b!63293 m!100279))

(declare-fun m!100281 () Bool)

(assert (=> b!63292 m!100281))

(assert (=> b!63292 m!99653))

(assert (=> b!63292 m!99619))

(declare-fun m!100283 () Bool)

(assert (=> b!63291 m!100283))

(assert (=> b!62934 d!19644))

(declare-fun d!19646 () Bool)

(assert (=> d!19646 (isPrefixOf!0 thiss!1379 (_2!2945 lt!99018))))

(declare-fun lt!99736 () Unit!4277)

(declare-fun choose!30 (BitStream!2224 BitStream!2224 BitStream!2224) Unit!4277)

(assert (=> d!19646 (= lt!99736 (choose!30 thiss!1379 (_2!2945 lt!99017) (_2!2945 lt!99018)))))

(assert (=> d!19646 (isPrefixOf!0 thiss!1379 (_2!2945 lt!99017))))

(assert (=> d!19646 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2945 lt!99017) (_2!2945 lt!99018)) lt!99736)))

(declare-fun bs!4852 () Bool)

(assert (= bs!4852 d!19646))

(assert (=> bs!4852 m!99643))

(declare-fun m!100285 () Bool)

(assert (=> bs!4852 m!100285))

(assert (=> bs!4852 m!99629))

(assert (=> b!62934 d!19646))

(declare-fun d!19648 () Bool)

(declare-fun res!52601 () Bool)

(declare-fun e!41935 () Bool)

(assert (=> d!19648 (=> (not res!52601) (not e!41935))))

(assert (=> d!19648 (= res!52601 (= (size!1280 (buf!1661 (_2!2945 lt!99017))) (size!1280 (buf!1661 (_2!2945 lt!99018)))))))

(assert (=> d!19648 (= (isPrefixOf!0 (_2!2945 lt!99017) (_2!2945 lt!99018)) e!41935)))

(declare-fun b!63295 () Bool)

(declare-fun res!52602 () Bool)

(assert (=> b!63295 (=> (not res!52602) (not e!41935))))

(assert (=> b!63295 (= res!52602 (bvsle (bitIndex!0 (size!1280 (buf!1661 (_2!2945 lt!99017))) (currentByte!3303 (_2!2945 lt!99017)) (currentBit!3298 (_2!2945 lt!99017))) (bitIndex!0 (size!1280 (buf!1661 (_2!2945 lt!99018))) (currentByte!3303 (_2!2945 lt!99018)) (currentBit!3298 (_2!2945 lt!99018)))))))

(declare-fun b!63296 () Bool)

(declare-fun e!41936 () Bool)

(assert (=> b!63296 (= e!41935 e!41936)))

(declare-fun res!52603 () Bool)

(assert (=> b!63296 (=> res!52603 e!41936)))

(assert (=> b!63296 (= res!52603 (= (size!1280 (buf!1661 (_2!2945 lt!99017))) #b00000000000000000000000000000000))))

(declare-fun b!63297 () Bool)

(assert (=> b!63297 (= e!41936 (arrayBitRangesEq!0 (buf!1661 (_2!2945 lt!99017)) (buf!1661 (_2!2945 lt!99018)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1280 (buf!1661 (_2!2945 lt!99017))) (currentByte!3303 (_2!2945 lt!99017)) (currentBit!3298 (_2!2945 lt!99017)))))))

(assert (= (and d!19648 res!52601) b!63295))

(assert (= (and b!63295 res!52602) b!63296))

(assert (= (and b!63296 (not res!52603)) b!63297))

(assert (=> b!63295 m!99653))

(assert (=> b!63295 m!99637))

(assert (=> b!63297 m!99653))

(assert (=> b!63297 m!99653))

(declare-fun m!100287 () Bool)

(assert (=> b!63297 m!100287))

(assert (=> b!62934 d!19648))

(declare-fun d!19650 () Bool)

(declare-fun e!41939 () Bool)

(assert (=> d!19650 e!41939))

(declare-fun res!52608 () Bool)

(assert (=> d!19650 (=> (not res!52608) (not e!41939))))

(declare-fun lt!99749 () (_ BitVec 64))

(declare-fun lt!99752 () (_ BitVec 64))

(declare-fun lt!99750 () (_ BitVec 64))

(assert (=> d!19650 (= res!52608 (= lt!99752 (bvsub lt!99749 lt!99750)))))

(assert (=> d!19650 (or (= (bvand lt!99749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!99750 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!99749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!99749 lt!99750) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19650 (= lt!99750 (remainingBits!0 ((_ sign_extend 32) (size!1280 (buf!1661 (_2!2945 lt!99018)))) ((_ sign_extend 32) (currentByte!3303 (_2!2945 lt!99018))) ((_ sign_extend 32) (currentBit!3298 (_2!2945 lt!99018)))))))

(declare-fun lt!99753 () (_ BitVec 64))

(declare-fun lt!99751 () (_ BitVec 64))

(assert (=> d!19650 (= lt!99749 (bvmul lt!99753 lt!99751))))

(assert (=> d!19650 (or (= lt!99753 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!99751 (bvsdiv (bvmul lt!99753 lt!99751) lt!99753)))))

(assert (=> d!19650 (= lt!99751 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19650 (= lt!99753 ((_ sign_extend 32) (size!1280 (buf!1661 (_2!2945 lt!99018)))))))

(assert (=> d!19650 (= lt!99752 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3303 (_2!2945 lt!99018))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3298 (_2!2945 lt!99018)))))))

(assert (=> d!19650 (invariant!0 (currentBit!3298 (_2!2945 lt!99018)) (currentByte!3303 (_2!2945 lt!99018)) (size!1280 (buf!1661 (_2!2945 lt!99018))))))

(assert (=> d!19650 (= (bitIndex!0 (size!1280 (buf!1661 (_2!2945 lt!99018))) (currentByte!3303 (_2!2945 lt!99018)) (currentBit!3298 (_2!2945 lt!99018))) lt!99752)))

(declare-fun b!63302 () Bool)

(declare-fun res!52609 () Bool)

(assert (=> b!63302 (=> (not res!52609) (not e!41939))))

(assert (=> b!63302 (= res!52609 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!99752))))

(declare-fun b!63303 () Bool)

(declare-fun lt!99754 () (_ BitVec 64))

(assert (=> b!63303 (= e!41939 (bvsle lt!99752 (bvmul lt!99754 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!63303 (or (= lt!99754 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!99754 #b0000000000000000000000000000000000000000000000000000000000001000) lt!99754)))))

(assert (=> b!63303 (= lt!99754 ((_ sign_extend 32) (size!1280 (buf!1661 (_2!2945 lt!99018)))))))

(assert (= (and d!19650 res!52608) b!63302))

(assert (= (and b!63302 res!52609) b!63303))

(declare-fun m!100289 () Bool)

(assert (=> d!19650 m!100289))

(assert (=> d!19650 m!99635))

(assert (=> b!62923 d!19650))

(declare-fun d!19652 () Bool)

(declare-fun res!52610 () Bool)

(declare-fun e!41940 () Bool)

(assert (=> d!19652 (=> (not res!52610) (not e!41940))))

(assert (=> d!19652 (= res!52610 (= (size!1280 (buf!1661 thiss!1379)) (size!1280 (buf!1661 thiss!1379))))))

(assert (=> d!19652 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!41940)))

(declare-fun b!63304 () Bool)

(declare-fun res!52611 () Bool)

(assert (=> b!63304 (=> (not res!52611) (not e!41940))))

(assert (=> b!63304 (= res!52611 (bvsle (bitIndex!0 (size!1280 (buf!1661 thiss!1379)) (currentByte!3303 thiss!1379) (currentBit!3298 thiss!1379)) (bitIndex!0 (size!1280 (buf!1661 thiss!1379)) (currentByte!3303 thiss!1379) (currentBit!3298 thiss!1379))))))

(declare-fun b!63305 () Bool)

(declare-fun e!41941 () Bool)

(assert (=> b!63305 (= e!41940 e!41941)))

(declare-fun res!52612 () Bool)

(assert (=> b!63305 (=> res!52612 e!41941)))

(assert (=> b!63305 (= res!52612 (= (size!1280 (buf!1661 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!63306 () Bool)

(assert (=> b!63306 (= e!41941 (arrayBitRangesEq!0 (buf!1661 thiss!1379) (buf!1661 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1280 (buf!1661 thiss!1379)) (currentByte!3303 thiss!1379) (currentBit!3298 thiss!1379))))))

(assert (= (and d!19652 res!52610) b!63304))

(assert (= (and b!63304 res!52611) b!63305))

(assert (= (and b!63305 (not res!52612)) b!63306))

(assert (=> b!63304 m!99619))

(assert (=> b!63304 m!99619))

(assert (=> b!63306 m!99619))

(assert (=> b!63306 m!99619))

(declare-fun m!100291 () Bool)

(assert (=> b!63306 m!100291))

(assert (=> b!62933 d!19652))

(declare-fun d!19654 () Bool)

(assert (=> d!19654 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!99757 () Unit!4277)

(declare-fun choose!11 (BitStream!2224) Unit!4277)

(assert (=> d!19654 (= lt!99757 (choose!11 thiss!1379))))

(assert (=> d!19654 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!99757)))

(declare-fun bs!4854 () Bool)

(assert (= bs!4854 d!19654))

(assert (=> bs!4854 m!99615))

(declare-fun m!100293 () Bool)

(assert (=> bs!4854 m!100293))

(assert (=> b!62933 d!19654))

(declare-fun d!19656 () Bool)

(declare-fun e!41942 () Bool)

(assert (=> d!19656 e!41942))

(declare-fun res!52613 () Bool)

(assert (=> d!19656 (=> (not res!52613) (not e!41942))))

(declare-fun lt!99759 () (_ BitVec 64))

(declare-fun lt!99761 () (_ BitVec 64))

(declare-fun lt!99758 () (_ BitVec 64))

(assert (=> d!19656 (= res!52613 (= lt!99761 (bvsub lt!99758 lt!99759)))))

(assert (=> d!19656 (or (= (bvand lt!99758 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!99759 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!99758 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!99758 lt!99759) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19656 (= lt!99759 (remainingBits!0 ((_ sign_extend 32) (size!1280 (buf!1661 thiss!1379))) ((_ sign_extend 32) (currentByte!3303 thiss!1379)) ((_ sign_extend 32) (currentBit!3298 thiss!1379))))))

(declare-fun lt!99762 () (_ BitVec 64))

(declare-fun lt!99760 () (_ BitVec 64))

(assert (=> d!19656 (= lt!99758 (bvmul lt!99762 lt!99760))))

(assert (=> d!19656 (or (= lt!99762 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!99760 (bvsdiv (bvmul lt!99762 lt!99760) lt!99762)))))

(assert (=> d!19656 (= lt!99760 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19656 (= lt!99762 ((_ sign_extend 32) (size!1280 (buf!1661 thiss!1379))))))

(assert (=> d!19656 (= lt!99761 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3303 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3298 thiss!1379))))))

(assert (=> d!19656 (invariant!0 (currentBit!3298 thiss!1379) (currentByte!3303 thiss!1379) (size!1280 (buf!1661 thiss!1379)))))

(assert (=> d!19656 (= (bitIndex!0 (size!1280 (buf!1661 thiss!1379)) (currentByte!3303 thiss!1379) (currentBit!3298 thiss!1379)) lt!99761)))

(declare-fun b!63307 () Bool)

(declare-fun res!52614 () Bool)

(assert (=> b!63307 (=> (not res!52614) (not e!41942))))

(assert (=> b!63307 (= res!52614 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!99761))))

(declare-fun b!63308 () Bool)

(declare-fun lt!99763 () (_ BitVec 64))

(assert (=> b!63308 (= e!41942 (bvsle lt!99761 (bvmul lt!99763 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!63308 (or (= lt!99763 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!99763 #b0000000000000000000000000000000000000000000000000000000000001000) lt!99763)))))

(assert (=> b!63308 (= lt!99763 ((_ sign_extend 32) (size!1280 (buf!1661 thiss!1379))))))

(assert (= (and d!19656 res!52613) b!63307))

(assert (= (and b!63307 res!52614) b!63308))

(declare-fun m!100295 () Bool)

(assert (=> d!19656 m!100295))

(assert (=> d!19656 m!100023))

(assert (=> b!62933 d!19656))

(declare-fun d!19658 () Bool)

(assert (=> d!19658 (= (invariant!0 (currentBit!3298 (_2!2945 lt!99018)) (currentByte!3303 (_2!2945 lt!99018)) (size!1280 (buf!1661 (_2!2945 lt!99018)))) (and (bvsge (currentBit!3298 (_2!2945 lt!99018)) #b00000000000000000000000000000000) (bvslt (currentBit!3298 (_2!2945 lt!99018)) #b00000000000000000000000000001000) (bvsge (currentByte!3303 (_2!2945 lt!99018)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3303 (_2!2945 lt!99018)) (size!1280 (buf!1661 (_2!2945 lt!99018)))) (and (= (currentBit!3298 (_2!2945 lt!99018)) #b00000000000000000000000000000000) (= (currentByte!3303 (_2!2945 lt!99018)) (size!1280 (buf!1661 (_2!2945 lt!99018))))))))))

(assert (=> b!62926 d!19658))

(declare-fun d!19660 () Bool)

(declare-fun res!52615 () Bool)

(declare-fun e!41943 () Bool)

(assert (=> d!19660 (=> (not res!52615) (not e!41943))))

(assert (=> d!19660 (= res!52615 (= (size!1280 (buf!1661 (_1!2944 lt!99026))) (size!1280 (buf!1661 (_2!2945 lt!99018)))))))

(assert (=> d!19660 (= (isPrefixOf!0 (_1!2944 lt!99026) (_2!2945 lt!99018)) e!41943)))

(declare-fun b!63309 () Bool)

(declare-fun res!52616 () Bool)

(assert (=> b!63309 (=> (not res!52616) (not e!41943))))

(assert (=> b!63309 (= res!52616 (bvsle (bitIndex!0 (size!1280 (buf!1661 (_1!2944 lt!99026))) (currentByte!3303 (_1!2944 lt!99026)) (currentBit!3298 (_1!2944 lt!99026))) (bitIndex!0 (size!1280 (buf!1661 (_2!2945 lt!99018))) (currentByte!3303 (_2!2945 lt!99018)) (currentBit!3298 (_2!2945 lt!99018)))))))

(declare-fun b!63310 () Bool)

(declare-fun e!41944 () Bool)

(assert (=> b!63310 (= e!41943 e!41944)))

(declare-fun res!52617 () Bool)

(assert (=> b!63310 (=> res!52617 e!41944)))

(assert (=> b!63310 (= res!52617 (= (size!1280 (buf!1661 (_1!2944 lt!99026))) #b00000000000000000000000000000000))))

(declare-fun b!63311 () Bool)

(assert (=> b!63311 (= e!41944 (arrayBitRangesEq!0 (buf!1661 (_1!2944 lt!99026)) (buf!1661 (_2!2945 lt!99018)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1280 (buf!1661 (_1!2944 lt!99026))) (currentByte!3303 (_1!2944 lt!99026)) (currentBit!3298 (_1!2944 lt!99026)))))))

(assert (= (and d!19660 res!52615) b!63309))

(assert (= (and b!63309 res!52616) b!63310))

(assert (= (and b!63310 (not res!52617)) b!63311))

(assert (=> b!63309 m!100037))

(assert (=> b!63309 m!99637))

(assert (=> b!63311 m!100037))

(assert (=> b!63311 m!100037))

(declare-fun m!100297 () Bool)

(assert (=> b!63311 m!100297))

(assert (=> b!62925 d!19660))

(declare-fun d!19662 () Bool)

(declare-fun e!41945 () Bool)

(assert (=> d!19662 e!41945))

(declare-fun res!52618 () Bool)

(assert (=> d!19662 (=> (not res!52618) (not e!41945))))

(declare-fun lt!99764 () (_ BitVec 64))

(declare-fun lt!99767 () (_ BitVec 64))

(declare-fun lt!99765 () (_ BitVec 64))

(assert (=> d!19662 (= res!52618 (= lt!99767 (bvsub lt!99764 lt!99765)))))

(assert (=> d!19662 (or (= (bvand lt!99764 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!99765 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!99764 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!99764 lt!99765) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19662 (= lt!99765 (remainingBits!0 ((_ sign_extend 32) (size!1280 (buf!1661 (_2!2945 lt!99017)))) ((_ sign_extend 32) (currentByte!3303 (_2!2945 lt!99017))) ((_ sign_extend 32) (currentBit!3298 (_2!2945 lt!99017)))))))

(declare-fun lt!99768 () (_ BitVec 64))

(declare-fun lt!99766 () (_ BitVec 64))

(assert (=> d!19662 (= lt!99764 (bvmul lt!99768 lt!99766))))

(assert (=> d!19662 (or (= lt!99768 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!99766 (bvsdiv (bvmul lt!99768 lt!99766) lt!99768)))))

(assert (=> d!19662 (= lt!99766 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19662 (= lt!99768 ((_ sign_extend 32) (size!1280 (buf!1661 (_2!2945 lt!99017)))))))

(assert (=> d!19662 (= lt!99767 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3303 (_2!2945 lt!99017))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3298 (_2!2945 lt!99017)))))))

(assert (=> d!19662 (invariant!0 (currentBit!3298 (_2!2945 lt!99017)) (currentByte!3303 (_2!2945 lt!99017)) (size!1280 (buf!1661 (_2!2945 lt!99017))))))

(assert (=> d!19662 (= (bitIndex!0 (size!1280 (buf!1661 (_2!2945 lt!99017))) (currentByte!3303 (_2!2945 lt!99017)) (currentBit!3298 (_2!2945 lt!99017))) lt!99767)))

(declare-fun b!63312 () Bool)

(declare-fun res!52619 () Bool)

(assert (=> b!63312 (=> (not res!52619) (not e!41945))))

(assert (=> b!63312 (= res!52619 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!99767))))

(declare-fun b!63313 () Bool)

(declare-fun lt!99769 () (_ BitVec 64))

(assert (=> b!63313 (= e!41945 (bvsle lt!99767 (bvmul lt!99769 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!63313 (or (= lt!99769 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!99769 #b0000000000000000000000000000000000000000000000000000000000001000) lt!99769)))))

(assert (=> b!63313 (= lt!99769 ((_ sign_extend 32) (size!1280 (buf!1661 (_2!2945 lt!99017)))))))

(assert (= (and d!19662 res!52618) b!63312))

(assert (= (and b!63312 res!52619) b!63313))

(declare-fun m!100299 () Bool)

(assert (=> d!19662 m!100299))

(assert (=> d!19662 m!99655))

(assert (=> b!62930 d!19662))

(declare-fun d!19664 () Bool)

(declare-fun res!52620 () Bool)

(declare-fun e!41946 () Bool)

(assert (=> d!19664 (=> (not res!52620) (not e!41946))))

(assert (=> d!19664 (= res!52620 (= (size!1280 (buf!1661 thiss!1379)) (size!1280 (buf!1661 (_2!2945 lt!99017)))))))

(assert (=> d!19664 (= (isPrefixOf!0 thiss!1379 (_2!2945 lt!99017)) e!41946)))

(declare-fun b!63314 () Bool)

(declare-fun res!52621 () Bool)

(assert (=> b!63314 (=> (not res!52621) (not e!41946))))

(assert (=> b!63314 (= res!52621 (bvsle (bitIndex!0 (size!1280 (buf!1661 thiss!1379)) (currentByte!3303 thiss!1379) (currentBit!3298 thiss!1379)) (bitIndex!0 (size!1280 (buf!1661 (_2!2945 lt!99017))) (currentByte!3303 (_2!2945 lt!99017)) (currentBit!3298 (_2!2945 lt!99017)))))))

(declare-fun b!63315 () Bool)

(declare-fun e!41947 () Bool)

(assert (=> b!63315 (= e!41946 e!41947)))

(declare-fun res!52622 () Bool)

(assert (=> b!63315 (=> res!52622 e!41947)))

(assert (=> b!63315 (= res!52622 (= (size!1280 (buf!1661 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!63316 () Bool)

(assert (=> b!63316 (= e!41947 (arrayBitRangesEq!0 (buf!1661 thiss!1379) (buf!1661 (_2!2945 lt!99017)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1280 (buf!1661 thiss!1379)) (currentByte!3303 thiss!1379) (currentBit!3298 thiss!1379))))))

(assert (= (and d!19664 res!52620) b!63314))

(assert (= (and b!63314 res!52621) b!63315))

(assert (= (and b!63315 (not res!52622)) b!63316))

(assert (=> b!63314 m!99619))

(assert (=> b!63314 m!99653))

(assert (=> b!63316 m!99619))

(assert (=> b!63316 m!99619))

(declare-fun m!100301 () Bool)

(assert (=> b!63316 m!100301))

(assert (=> b!62929 d!19664))

(declare-fun d!19666 () Bool)

(assert (=> d!19666 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1280 (buf!1661 (_2!2945 lt!99017)))) ((_ sign_extend 32) (currentByte!3303 (_2!2945 lt!99017))) ((_ sign_extend 32) (currentBit!3298 (_2!2945 lt!99017))) lt!99024) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1280 (buf!1661 (_2!2945 lt!99017)))) ((_ sign_extend 32) (currentByte!3303 (_2!2945 lt!99017))) ((_ sign_extend 32) (currentBit!3298 (_2!2945 lt!99017)))) lt!99024))))

(declare-fun bs!4855 () Bool)

(assert (= bs!4855 d!19666))

(assert (=> bs!4855 m!100299))

(assert (=> b!62929 d!19666))

(declare-fun d!19668 () Bool)

(declare-fun e!41950 () Bool)

(assert (=> d!19668 e!41950))

(declare-fun res!52625 () Bool)

(assert (=> d!19668 (=> (not res!52625) (not e!41950))))

(assert (=> d!19668 (= res!52625 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!99772 () Unit!4277)

(declare-fun choose!27 (BitStream!2224 BitStream!2224 (_ BitVec 64) (_ BitVec 64)) Unit!4277)

(assert (=> d!19668 (= lt!99772 (choose!27 thiss!1379 (_2!2945 lt!99017) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!19668 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!19668 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2945 lt!99017) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!99772)))

(declare-fun b!63319 () Bool)

(assert (=> b!63319 (= e!41950 (validate_offset_bits!1 ((_ sign_extend 32) (size!1280 (buf!1661 (_2!2945 lt!99017)))) ((_ sign_extend 32) (currentByte!3303 (_2!2945 lt!99017))) ((_ sign_extend 32) (currentBit!3298 (_2!2945 lt!99017))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!19668 res!52625) b!63319))

(declare-fun m!100303 () Bool)

(assert (=> d!19668 m!100303))

(declare-fun m!100305 () Bool)

(assert (=> b!63319 m!100305))

(assert (=> b!62929 d!19668))

(declare-fun b!63337 () Bool)

(declare-fun e!41961 () Bool)

(declare-fun e!41962 () Bool)

(assert (=> b!63337 (= e!41961 e!41962)))

(declare-fun res!52645 () Bool)

(assert (=> b!63337 (=> (not res!52645) (not e!41962))))

(declare-fun lt!99797 () tuple2!5668)

(declare-fun lt!99800 () Bool)

(declare-datatypes ((tuple2!5692 0))(
  ( (tuple2!5693 (_1!2957 BitStream!2224) (_2!2957 Bool)) )
))
(declare-fun lt!99798 () tuple2!5692)

(assert (=> b!63337 (= res!52645 (and (= (_2!2957 lt!99798) lt!99800) (= (_1!2957 lt!99798) (_2!2945 lt!99797))))))

(declare-fun readBitPure!0 (BitStream!2224) tuple2!5692)

(declare-fun readerFrom!0 (BitStream!2224 (_ BitVec 32) (_ BitVec 32)) BitStream!2224)

(assert (=> b!63337 (= lt!99798 (readBitPure!0 (readerFrom!0 (_2!2945 lt!99797) (currentBit!3298 thiss!1379) (currentByte!3303 thiss!1379))))))

(declare-fun b!63338 () Bool)

(declare-fun res!52647 () Bool)

(declare-fun e!41960 () Bool)

(assert (=> b!63338 (=> (not res!52647) (not e!41960))))

(declare-fun lt!99799 () tuple2!5668)

(assert (=> b!63338 (= res!52647 (isPrefixOf!0 thiss!1379 (_2!2945 lt!99799)))))

(declare-fun b!63339 () Bool)

(declare-fun res!52644 () Bool)

(assert (=> b!63339 (=> (not res!52644) (not e!41961))))

(assert (=> b!63339 (= res!52644 (= (bitIndex!0 (size!1280 (buf!1661 (_2!2945 lt!99797))) (currentByte!3303 (_2!2945 lt!99797)) (currentBit!3298 (_2!2945 lt!99797))) (bvadd (bitIndex!0 (size!1280 (buf!1661 thiss!1379)) (currentByte!3303 thiss!1379) (currentBit!3298 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!63340 () Bool)

(declare-fun res!52643 () Bool)

(assert (=> b!63340 (=> (not res!52643) (not e!41960))))

(declare-fun lt!99804 () (_ BitVec 64))

(declare-fun lt!99806 () (_ BitVec 64))

(assert (=> b!63340 (= res!52643 (= (bitIndex!0 (size!1280 (buf!1661 (_2!2945 lt!99799))) (currentByte!3303 (_2!2945 lt!99799)) (currentBit!3298 (_2!2945 lt!99799))) (bvadd lt!99806 lt!99804)))))

(assert (=> b!63340 (or (not (= (bvand lt!99806 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!99804 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!99806 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!99806 lt!99804) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63340 (= lt!99804 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!63340 (= lt!99806 (bitIndex!0 (size!1280 (buf!1661 thiss!1379)) (currentByte!3303 thiss!1379) (currentBit!3298 thiss!1379)))))

(declare-fun d!19670 () Bool)

(assert (=> d!19670 e!41960))

(declare-fun res!52648 () Bool)

(assert (=> d!19670 (=> (not res!52648) (not e!41960))))

(assert (=> d!19670 (= res!52648 (= (size!1280 (buf!1661 (_2!2945 lt!99799))) (size!1280 (buf!1661 thiss!1379))))))

(declare-fun lt!99805 () (_ BitVec 8))

(declare-fun lt!99801 () array!2797)

(assert (=> d!19670 (= lt!99805 (select (arr!1844 lt!99801) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!19670 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1280 lt!99801)))))

(assert (=> d!19670 (= lt!99801 (array!2798 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!99807 () tuple2!5668)

(assert (=> d!19670 (= lt!99799 (tuple2!5669 (_1!2945 lt!99807) (_2!2945 lt!99807)))))

(assert (=> d!19670 (= lt!99807 lt!99797)))

(assert (=> d!19670 e!41961))

(declare-fun res!52649 () Bool)

(assert (=> d!19670 (=> (not res!52649) (not e!41961))))

(assert (=> d!19670 (= res!52649 (= (size!1280 (buf!1661 thiss!1379)) (size!1280 (buf!1661 (_2!2945 lt!99797)))))))

(declare-fun appendBit!0 (BitStream!2224 Bool) tuple2!5668)

(assert (=> d!19670 (= lt!99797 (appendBit!0 thiss!1379 lt!99800))))

(assert (=> d!19670 (= lt!99800 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1844 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!19670 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!19670 (= (appendBitFromByte!0 thiss!1379 (select (arr!1844 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!99799)))

(declare-fun b!63341 () Bool)

(declare-fun res!52642 () Bool)

(assert (=> b!63341 (=> (not res!52642) (not e!41961))))

(assert (=> b!63341 (= res!52642 (isPrefixOf!0 thiss!1379 (_2!2945 lt!99797)))))

(declare-fun b!63342 () Bool)

(declare-fun e!41959 () Bool)

(assert (=> b!63342 (= e!41960 e!41959)))

(declare-fun res!52646 () Bool)

(assert (=> b!63342 (=> (not res!52646) (not e!41959))))

(declare-fun lt!99802 () tuple2!5692)

(assert (=> b!63342 (= res!52646 (and (= (_2!2957 lt!99802) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1844 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!99805)) #b00000000000000000000000000000000))) (= (_1!2957 lt!99802) (_2!2945 lt!99799))))))

(declare-fun lt!99808 () tuple2!5690)

(declare-fun lt!99803 () BitStream!2224)

(assert (=> b!63342 (= lt!99808 (readBits!0 lt!99803 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!63342 (= lt!99802 (readBitPure!0 lt!99803))))

(assert (=> b!63342 (= lt!99803 (readerFrom!0 (_2!2945 lt!99799) (currentBit!3298 thiss!1379) (currentByte!3303 thiss!1379)))))

(declare-fun b!63343 () Bool)

(assert (=> b!63343 (= e!41959 (= (bitIndex!0 (size!1280 (buf!1661 (_1!2957 lt!99802))) (currentByte!3303 (_1!2957 lt!99802)) (currentBit!3298 (_1!2957 lt!99802))) (bitIndex!0 (size!1280 (buf!1661 (_2!2945 lt!99799))) (currentByte!3303 (_2!2945 lt!99799)) (currentBit!3298 (_2!2945 lt!99799)))))))

(declare-fun b!63344 () Bool)

(assert (=> b!63344 (= e!41962 (= (bitIndex!0 (size!1280 (buf!1661 (_1!2957 lt!99798))) (currentByte!3303 (_1!2957 lt!99798)) (currentBit!3298 (_1!2957 lt!99798))) (bitIndex!0 (size!1280 (buf!1661 (_2!2945 lt!99797))) (currentByte!3303 (_2!2945 lt!99797)) (currentBit!3298 (_2!2945 lt!99797)))))))

(assert (= (and d!19670 res!52649) b!63339))

(assert (= (and b!63339 res!52644) b!63341))

(assert (= (and b!63341 res!52642) b!63337))

(assert (= (and b!63337 res!52645) b!63344))

(assert (= (and d!19670 res!52648) b!63340))

(assert (= (and b!63340 res!52643) b!63338))

(assert (= (and b!63338 res!52647) b!63342))

(assert (= (and b!63342 res!52646) b!63343))

(declare-fun m!100307 () Bool)

(assert (=> b!63339 m!100307))

(assert (=> b!63339 m!99619))

(declare-fun m!100309 () Bool)

(assert (=> b!63337 m!100309))

(assert (=> b!63337 m!100309))

(declare-fun m!100311 () Bool)

(assert (=> b!63337 m!100311))

(declare-fun m!100313 () Bool)

(assert (=> d!19670 m!100313))

(declare-fun m!100315 () Bool)

(assert (=> d!19670 m!100315))

(assert (=> d!19670 m!100025))

(declare-fun m!100317 () Bool)

(assert (=> b!63338 m!100317))

(declare-fun m!100319 () Bool)

(assert (=> b!63341 m!100319))

(declare-fun m!100321 () Bool)

(assert (=> b!63342 m!100321))

(declare-fun m!100323 () Bool)

(assert (=> b!63342 m!100323))

(declare-fun m!100325 () Bool)

(assert (=> b!63342 m!100325))

(declare-fun m!100327 () Bool)

(assert (=> b!63344 m!100327))

(assert (=> b!63344 m!100307))

(declare-fun m!100329 () Bool)

(assert (=> b!63340 m!100329))

(assert (=> b!63340 m!99619))

(declare-fun m!100331 () Bool)

(assert (=> b!63343 m!100331))

(assert (=> b!63343 m!100329))

(assert (=> b!62929 d!19670))

(declare-fun d!19672 () Bool)

(assert (=> d!19672 (= (array_inv!1171 (buf!1661 thiss!1379)) (bvsge (size!1280 (buf!1661 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!62918 d!19672))

(declare-fun d!19674 () Bool)

(assert (=> d!19674 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1280 (buf!1661 thiss!1379))) ((_ sign_extend 32) (currentByte!3303 thiss!1379)) ((_ sign_extend 32) (currentBit!3298 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1280 (buf!1661 thiss!1379))) ((_ sign_extend 32) (currentByte!3303 thiss!1379)) ((_ sign_extend 32) (currentBit!3298 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4856 () Bool)

(assert (= bs!4856 d!19674))

(assert (=> bs!4856 m!100295))

(assert (=> b!62928 d!19674))

(declare-fun b!63347 () Bool)

(declare-fun e!41963 () Bool)

(declare-fun lt!99810 () List!687)

(assert (=> b!63347 (= e!41963 (isEmpty!193 lt!99810))))

(declare-fun b!63345 () Bool)

(declare-fun e!41964 () tuple2!5686)

(assert (=> b!63345 (= e!41964 (tuple2!5687 Nil!684 (_1!2944 lt!99026)))))

(declare-fun b!63348 () Bool)

(assert (=> b!63348 (= e!41963 (> (length!315 lt!99810) 0))))

(declare-fun d!19676 () Bool)

(assert (=> d!19676 e!41963))

(declare-fun c!4519 () Bool)

(assert (=> d!19676 (= c!4519 (= lt!99024 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19676 (= lt!99810 (_1!2954 e!41964))))

(declare-fun c!4520 () Bool)

(assert (=> d!19676 (= c!4520 (= lt!99024 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19676 (bvsge lt!99024 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19676 (= (bitStreamReadBitsIntoList!0 (_2!2945 lt!99018) (_1!2944 lt!99026) lt!99024) lt!99810)))

(declare-fun lt!99811 () tuple2!5688)

(declare-fun lt!99809 () (_ BitVec 64))

(declare-fun b!63346 () Bool)

(assert (=> b!63346 (= e!41964 (tuple2!5687 (Cons!683 (_1!2955 lt!99811) (bitStreamReadBitsIntoList!0 (_2!2945 lt!99018) (_2!2955 lt!99811) (bvsub lt!99024 lt!99809))) (_2!2955 lt!99811)))))

(assert (=> b!63346 (= lt!99811 (readBit!0 (_1!2944 lt!99026)))))

(assert (=> b!63346 (= lt!99809 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!19676 c!4520) b!63345))

(assert (= (and d!19676 (not c!4520)) b!63346))

(assert (= (and d!19676 c!4519) b!63347))

(assert (= (and d!19676 (not c!4519)) b!63348))

(declare-fun m!100333 () Bool)

(assert (=> b!63347 m!100333))

(declare-fun m!100335 () Bool)

(assert (=> b!63348 m!100335))

(declare-fun m!100337 () Bool)

(assert (=> b!63346 m!100337))

(declare-fun m!100339 () Bool)

(assert (=> b!63346 m!100339))

(assert (=> b!62917 d!19676))

(declare-fun b!63351 () Bool)

(declare-fun e!41965 () Bool)

(declare-fun lt!99813 () List!687)

(assert (=> b!63351 (= e!41965 (isEmpty!193 lt!99813))))

(declare-fun b!63349 () Bool)

(declare-fun e!41966 () tuple2!5686)

(assert (=> b!63349 (= e!41966 (tuple2!5687 Nil!684 (_1!2944 lt!99023)))))

(declare-fun b!63352 () Bool)

(assert (=> b!63352 (= e!41965 (> (length!315 lt!99813) 0))))

(declare-fun d!19678 () Bool)

(assert (=> d!19678 e!41965))

(declare-fun c!4521 () Bool)

(assert (=> d!19678 (= c!4521 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19678 (= lt!99813 (_1!2954 e!41966))))

(declare-fun c!4522 () Bool)

(assert (=> d!19678 (= c!4522 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19678 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19678 (= (bitStreamReadBitsIntoList!0 (_2!2945 lt!99018) (_1!2944 lt!99023) (bvsub to!314 i!635)) lt!99813)))

(declare-fun b!63350 () Bool)

(declare-fun lt!99814 () tuple2!5688)

(declare-fun lt!99812 () (_ BitVec 64))

(assert (=> b!63350 (= e!41966 (tuple2!5687 (Cons!683 (_1!2955 lt!99814) (bitStreamReadBitsIntoList!0 (_2!2945 lt!99018) (_2!2955 lt!99814) (bvsub (bvsub to!314 i!635) lt!99812))) (_2!2955 lt!99814)))))

(assert (=> b!63350 (= lt!99814 (readBit!0 (_1!2944 lt!99023)))))

(assert (=> b!63350 (= lt!99812 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!19678 c!4522) b!63349))

(assert (= (and d!19678 (not c!4522)) b!63350))

(assert (= (and d!19678 c!4521) b!63351))

(assert (= (and d!19678 (not c!4521)) b!63352))

(declare-fun m!100341 () Bool)

(assert (=> b!63351 m!100341))

(declare-fun m!100343 () Bool)

(assert (=> b!63352 m!100343))

(declare-fun m!100345 () Bool)

(assert (=> b!63350 m!100345))

(declare-fun m!100347 () Bool)

(assert (=> b!63350 m!100347))

(assert (=> b!62917 d!19678))

(declare-fun d!19680 () Bool)

(assert (=> d!19680 (validate_offset_bits!1 ((_ sign_extend 32) (size!1280 (buf!1661 (_2!2945 lt!99018)))) ((_ sign_extend 32) (currentByte!3303 (_2!2945 lt!99017))) ((_ sign_extend 32) (currentBit!3298 (_2!2945 lt!99017))) lt!99024)))

(declare-fun lt!99815 () Unit!4277)

(assert (=> d!19680 (= lt!99815 (choose!9 (_2!2945 lt!99017) (buf!1661 (_2!2945 lt!99018)) lt!99024 (BitStream!2225 (buf!1661 (_2!2945 lt!99018)) (currentByte!3303 (_2!2945 lt!99017)) (currentBit!3298 (_2!2945 lt!99017)))))))

(assert (=> d!19680 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2945 lt!99017) (buf!1661 (_2!2945 lt!99018)) lt!99024) lt!99815)))

(declare-fun bs!4857 () Bool)

(assert (= bs!4857 d!19680))

(assert (=> bs!4857 m!99665))

(declare-fun m!100349 () Bool)

(assert (=> bs!4857 m!100349))

(assert (=> b!62917 d!19680))

(declare-fun d!19682 () Bool)

(assert (=> d!19682 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1280 (buf!1661 (_2!2945 lt!99018)))) ((_ sign_extend 32) (currentByte!3303 (_2!2945 lt!99017))) ((_ sign_extend 32) (currentBit!3298 (_2!2945 lt!99017))) lt!99024) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1280 (buf!1661 (_2!2945 lt!99018)))) ((_ sign_extend 32) (currentByte!3303 (_2!2945 lt!99017))) ((_ sign_extend 32) (currentBit!3298 (_2!2945 lt!99017)))) lt!99024))))

(declare-fun bs!4858 () Bool)

(assert (= bs!4858 d!19682))

(declare-fun m!100351 () Bool)

(assert (=> bs!4858 m!100351))

(assert (=> b!62917 d!19682))

(declare-fun b!63353 () Bool)

(declare-fun e!41967 () Unit!4277)

(declare-fun Unit!4301 () Unit!4277)

(assert (=> b!63353 (= e!41967 Unit!4301)))

(declare-fun d!19684 () Bool)

(declare-fun e!41968 () Bool)

(assert (=> d!19684 e!41968))

(declare-fun res!52652 () Bool)

(assert (=> d!19684 (=> (not res!52652) (not e!41968))))

(declare-fun lt!99829 () tuple2!5666)

(assert (=> d!19684 (= res!52652 (isPrefixOf!0 (_1!2944 lt!99829) (_2!2944 lt!99829)))))

(declare-fun lt!99822 () BitStream!2224)

(assert (=> d!19684 (= lt!99829 (tuple2!5667 lt!99822 (_2!2945 lt!99018)))))

(declare-fun lt!99821 () Unit!4277)

(declare-fun lt!99817 () Unit!4277)

(assert (=> d!19684 (= lt!99821 lt!99817)))

(assert (=> d!19684 (isPrefixOf!0 lt!99822 (_2!2945 lt!99018))))

(assert (=> d!19684 (= lt!99817 (lemmaIsPrefixTransitive!0 lt!99822 (_2!2945 lt!99018) (_2!2945 lt!99018)))))

(declare-fun lt!99834 () Unit!4277)

(declare-fun lt!99818 () Unit!4277)

(assert (=> d!19684 (= lt!99834 lt!99818)))

(assert (=> d!19684 (isPrefixOf!0 lt!99822 (_2!2945 lt!99018))))

(assert (=> d!19684 (= lt!99818 (lemmaIsPrefixTransitive!0 lt!99822 (_2!2945 lt!99017) (_2!2945 lt!99018)))))

(declare-fun lt!99832 () Unit!4277)

(assert (=> d!19684 (= lt!99832 e!41967)))

(declare-fun c!4523 () Bool)

(assert (=> d!19684 (= c!4523 (not (= (size!1280 (buf!1661 (_2!2945 lt!99017))) #b00000000000000000000000000000000)))))

(declare-fun lt!99826 () Unit!4277)

(declare-fun lt!99828 () Unit!4277)

(assert (=> d!19684 (= lt!99826 lt!99828)))

(assert (=> d!19684 (isPrefixOf!0 (_2!2945 lt!99018) (_2!2945 lt!99018))))

(assert (=> d!19684 (= lt!99828 (lemmaIsPrefixRefl!0 (_2!2945 lt!99018)))))

(declare-fun lt!99833 () Unit!4277)

(declare-fun lt!99827 () Unit!4277)

(assert (=> d!19684 (= lt!99833 lt!99827)))

(assert (=> d!19684 (= lt!99827 (lemmaIsPrefixRefl!0 (_2!2945 lt!99018)))))

(declare-fun lt!99816 () Unit!4277)

(declare-fun lt!99819 () Unit!4277)

(assert (=> d!19684 (= lt!99816 lt!99819)))

(assert (=> d!19684 (isPrefixOf!0 lt!99822 lt!99822)))

(assert (=> d!19684 (= lt!99819 (lemmaIsPrefixRefl!0 lt!99822))))

(declare-fun lt!99835 () Unit!4277)

(declare-fun lt!99830 () Unit!4277)

(assert (=> d!19684 (= lt!99835 lt!99830)))

(assert (=> d!19684 (isPrefixOf!0 (_2!2945 lt!99017) (_2!2945 lt!99017))))

(assert (=> d!19684 (= lt!99830 (lemmaIsPrefixRefl!0 (_2!2945 lt!99017)))))

(assert (=> d!19684 (= lt!99822 (BitStream!2225 (buf!1661 (_2!2945 lt!99018)) (currentByte!3303 (_2!2945 lt!99017)) (currentBit!3298 (_2!2945 lt!99017))))))

(assert (=> d!19684 (isPrefixOf!0 (_2!2945 lt!99017) (_2!2945 lt!99018))))

(assert (=> d!19684 (= (reader!0 (_2!2945 lt!99017) (_2!2945 lt!99018)) lt!99829)))

(declare-fun b!63354 () Bool)

(declare-fun res!52651 () Bool)

(assert (=> b!63354 (=> (not res!52651) (not e!41968))))

(assert (=> b!63354 (= res!52651 (isPrefixOf!0 (_2!2944 lt!99829) (_2!2945 lt!99018)))))

(declare-fun lt!99824 () (_ BitVec 64))

(declare-fun lt!99825 () (_ BitVec 64))

(declare-fun b!63355 () Bool)

(assert (=> b!63355 (= e!41968 (= (_1!2944 lt!99829) (withMovedBitIndex!0 (_2!2944 lt!99829) (bvsub lt!99825 lt!99824))))))

(assert (=> b!63355 (or (= (bvand lt!99825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!99824 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!99825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!99825 lt!99824) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63355 (= lt!99824 (bitIndex!0 (size!1280 (buf!1661 (_2!2945 lt!99018))) (currentByte!3303 (_2!2945 lt!99018)) (currentBit!3298 (_2!2945 lt!99018))))))

(assert (=> b!63355 (= lt!99825 (bitIndex!0 (size!1280 (buf!1661 (_2!2945 lt!99017))) (currentByte!3303 (_2!2945 lt!99017)) (currentBit!3298 (_2!2945 lt!99017))))))

(declare-fun b!63356 () Bool)

(declare-fun lt!99820 () Unit!4277)

(assert (=> b!63356 (= e!41967 lt!99820)))

(declare-fun lt!99823 () (_ BitVec 64))

(assert (=> b!63356 (= lt!99823 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!99831 () (_ BitVec 64))

(assert (=> b!63356 (= lt!99831 (bitIndex!0 (size!1280 (buf!1661 (_2!2945 lt!99017))) (currentByte!3303 (_2!2945 lt!99017)) (currentBit!3298 (_2!2945 lt!99017))))))

(assert (=> b!63356 (= lt!99820 (arrayBitRangesEqSymmetric!0 (buf!1661 (_2!2945 lt!99017)) (buf!1661 (_2!2945 lt!99018)) lt!99823 lt!99831))))

(assert (=> b!63356 (arrayBitRangesEq!0 (buf!1661 (_2!2945 lt!99018)) (buf!1661 (_2!2945 lt!99017)) lt!99823 lt!99831)))

(declare-fun b!63357 () Bool)

(declare-fun res!52650 () Bool)

(assert (=> b!63357 (=> (not res!52650) (not e!41968))))

(assert (=> b!63357 (= res!52650 (isPrefixOf!0 (_1!2944 lt!99829) (_2!2945 lt!99017)))))

(assert (= (and d!19684 c!4523) b!63356))

(assert (= (and d!19684 (not c!4523)) b!63353))

(assert (= (and d!19684 res!52652) b!63357))

(assert (= (and b!63357 res!52650) b!63354))

(assert (= (and b!63354 res!52651) b!63355))

(declare-fun m!100353 () Bool)

(assert (=> d!19684 m!100353))

(declare-fun m!100355 () Bool)

(assert (=> d!19684 m!100355))

(assert (=> d!19684 m!100177))

(declare-fun m!100357 () Bool)

(assert (=> d!19684 m!100357))

(declare-fun m!100359 () Bool)

(assert (=> d!19684 m!100359))

(declare-fun m!100361 () Bool)

(assert (=> d!19684 m!100361))

(declare-fun m!100363 () Bool)

(assert (=> d!19684 m!100363))

(declare-fun m!100365 () Bool)

(assert (=> d!19684 m!100365))

(assert (=> d!19684 m!99647))

(declare-fun m!100367 () Bool)

(assert (=> d!19684 m!100367))

(assert (=> d!19684 m!100175))

(declare-fun m!100369 () Bool)

(assert (=> b!63357 m!100369))

(assert (=> b!63356 m!99653))

(declare-fun m!100371 () Bool)

(assert (=> b!63356 m!100371))

(declare-fun m!100373 () Bool)

(assert (=> b!63356 m!100373))

(declare-fun m!100375 () Bool)

(assert (=> b!63355 m!100375))

(assert (=> b!63355 m!99637))

(assert (=> b!63355 m!99653))

(declare-fun m!100377 () Bool)

(assert (=> b!63354 m!100377))

(assert (=> b!62917 d!19684))

(declare-fun d!19686 () Bool)

(assert (=> d!19686 (validate_offset_bits!1 ((_ sign_extend 32) (size!1280 (buf!1661 (_2!2945 lt!99018)))) ((_ sign_extend 32) (currentByte!3303 thiss!1379)) ((_ sign_extend 32) (currentBit!3298 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!99836 () Unit!4277)

(assert (=> d!19686 (= lt!99836 (choose!9 thiss!1379 (buf!1661 (_2!2945 lt!99018)) (bvsub to!314 i!635) (BitStream!2225 (buf!1661 (_2!2945 lt!99018)) (currentByte!3303 thiss!1379) (currentBit!3298 thiss!1379))))))

(assert (=> d!19686 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1661 (_2!2945 lt!99018)) (bvsub to!314 i!635)) lt!99836)))

(declare-fun bs!4859 () Bool)

(assert (= bs!4859 d!19686))

(assert (=> bs!4859 m!99667))

(declare-fun m!100379 () Bool)

(assert (=> bs!4859 m!100379))

(assert (=> b!62917 d!19686))

(declare-fun d!19688 () Bool)

(assert (=> d!19688 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1280 (buf!1661 (_2!2945 lt!99018)))) ((_ sign_extend 32) (currentByte!3303 thiss!1379)) ((_ sign_extend 32) (currentBit!3298 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1280 (buf!1661 (_2!2945 lt!99018)))) ((_ sign_extend 32) (currentByte!3303 thiss!1379)) ((_ sign_extend 32) (currentBit!3298 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4860 () Bool)

(assert (= bs!4860 d!19688))

(declare-fun m!100381 () Bool)

(assert (=> bs!4860 m!100381))

(assert (=> b!62917 d!19688))

(declare-fun b!63358 () Bool)

(declare-fun e!41969 () Unit!4277)

(declare-fun Unit!4302 () Unit!4277)

(assert (=> b!63358 (= e!41969 Unit!4302)))

(declare-fun d!19690 () Bool)

(declare-fun e!41970 () Bool)

(assert (=> d!19690 e!41970))

(declare-fun res!52655 () Bool)

(assert (=> d!19690 (=> (not res!52655) (not e!41970))))

(declare-fun lt!99850 () tuple2!5666)

(assert (=> d!19690 (= res!52655 (isPrefixOf!0 (_1!2944 lt!99850) (_2!2944 lt!99850)))))

(declare-fun lt!99843 () BitStream!2224)

(assert (=> d!19690 (= lt!99850 (tuple2!5667 lt!99843 (_2!2945 lt!99018)))))

(declare-fun lt!99842 () Unit!4277)

(declare-fun lt!99838 () Unit!4277)

(assert (=> d!19690 (= lt!99842 lt!99838)))

(assert (=> d!19690 (isPrefixOf!0 lt!99843 (_2!2945 lt!99018))))

(assert (=> d!19690 (= lt!99838 (lemmaIsPrefixTransitive!0 lt!99843 (_2!2945 lt!99018) (_2!2945 lt!99018)))))

(declare-fun lt!99855 () Unit!4277)

(declare-fun lt!99839 () Unit!4277)

(assert (=> d!19690 (= lt!99855 lt!99839)))

(assert (=> d!19690 (isPrefixOf!0 lt!99843 (_2!2945 lt!99018))))

(assert (=> d!19690 (= lt!99839 (lemmaIsPrefixTransitive!0 lt!99843 thiss!1379 (_2!2945 lt!99018)))))

(declare-fun lt!99853 () Unit!4277)

(assert (=> d!19690 (= lt!99853 e!41969)))

(declare-fun c!4524 () Bool)

(assert (=> d!19690 (= c!4524 (not (= (size!1280 (buf!1661 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!99847 () Unit!4277)

(declare-fun lt!99849 () Unit!4277)

(assert (=> d!19690 (= lt!99847 lt!99849)))

(assert (=> d!19690 (isPrefixOf!0 (_2!2945 lt!99018) (_2!2945 lt!99018))))

(assert (=> d!19690 (= lt!99849 (lemmaIsPrefixRefl!0 (_2!2945 lt!99018)))))

(declare-fun lt!99854 () Unit!4277)

(declare-fun lt!99848 () Unit!4277)

(assert (=> d!19690 (= lt!99854 lt!99848)))

(assert (=> d!19690 (= lt!99848 (lemmaIsPrefixRefl!0 (_2!2945 lt!99018)))))

(declare-fun lt!99837 () Unit!4277)

(declare-fun lt!99840 () Unit!4277)

(assert (=> d!19690 (= lt!99837 lt!99840)))

(assert (=> d!19690 (isPrefixOf!0 lt!99843 lt!99843)))

(assert (=> d!19690 (= lt!99840 (lemmaIsPrefixRefl!0 lt!99843))))

(declare-fun lt!99856 () Unit!4277)

(declare-fun lt!99851 () Unit!4277)

(assert (=> d!19690 (= lt!99856 lt!99851)))

(assert (=> d!19690 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!19690 (= lt!99851 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!19690 (= lt!99843 (BitStream!2225 (buf!1661 (_2!2945 lt!99018)) (currentByte!3303 thiss!1379) (currentBit!3298 thiss!1379)))))

(assert (=> d!19690 (isPrefixOf!0 thiss!1379 (_2!2945 lt!99018))))

(assert (=> d!19690 (= (reader!0 thiss!1379 (_2!2945 lt!99018)) lt!99850)))

(declare-fun b!63359 () Bool)

(declare-fun res!52654 () Bool)

(assert (=> b!63359 (=> (not res!52654) (not e!41970))))

(assert (=> b!63359 (= res!52654 (isPrefixOf!0 (_2!2944 lt!99850) (_2!2945 lt!99018)))))

(declare-fun lt!99846 () (_ BitVec 64))

(declare-fun b!63360 () Bool)

(declare-fun lt!99845 () (_ BitVec 64))

(assert (=> b!63360 (= e!41970 (= (_1!2944 lt!99850) (withMovedBitIndex!0 (_2!2944 lt!99850) (bvsub lt!99846 lt!99845))))))

(assert (=> b!63360 (or (= (bvand lt!99846 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!99845 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!99846 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!99846 lt!99845) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63360 (= lt!99845 (bitIndex!0 (size!1280 (buf!1661 (_2!2945 lt!99018))) (currentByte!3303 (_2!2945 lt!99018)) (currentBit!3298 (_2!2945 lt!99018))))))

(assert (=> b!63360 (= lt!99846 (bitIndex!0 (size!1280 (buf!1661 thiss!1379)) (currentByte!3303 thiss!1379) (currentBit!3298 thiss!1379)))))

(declare-fun b!63361 () Bool)

(declare-fun lt!99841 () Unit!4277)

(assert (=> b!63361 (= e!41969 lt!99841)))

(declare-fun lt!99844 () (_ BitVec 64))

(assert (=> b!63361 (= lt!99844 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!99852 () (_ BitVec 64))

(assert (=> b!63361 (= lt!99852 (bitIndex!0 (size!1280 (buf!1661 thiss!1379)) (currentByte!3303 thiss!1379) (currentBit!3298 thiss!1379)))))

(assert (=> b!63361 (= lt!99841 (arrayBitRangesEqSymmetric!0 (buf!1661 thiss!1379) (buf!1661 (_2!2945 lt!99018)) lt!99844 lt!99852))))

(assert (=> b!63361 (arrayBitRangesEq!0 (buf!1661 (_2!2945 lt!99018)) (buf!1661 thiss!1379) lt!99844 lt!99852)))

(declare-fun b!63362 () Bool)

(declare-fun res!52653 () Bool)

(assert (=> b!63362 (=> (not res!52653) (not e!41970))))

(assert (=> b!63362 (= res!52653 (isPrefixOf!0 (_1!2944 lt!99850) thiss!1379))))

(assert (= (and d!19690 c!4524) b!63361))

(assert (= (and d!19690 (not c!4524)) b!63358))

(assert (= (and d!19690 res!52655) b!63362))

(assert (= (and b!63362 res!52653) b!63359))

(assert (= (and b!63359 res!52654) b!63360))

(declare-fun m!100383 () Bool)

(assert (=> d!19690 m!100383))

(declare-fun m!100385 () Bool)

(assert (=> d!19690 m!100385))

(assert (=> d!19690 m!99617))

(assert (=> d!19690 m!100357))

(declare-fun m!100387 () Bool)

(assert (=> d!19690 m!100387))

(declare-fun m!100389 () Bool)

(assert (=> d!19690 m!100389))

(declare-fun m!100391 () Bool)

(assert (=> d!19690 m!100391))

(declare-fun m!100393 () Bool)

(assert (=> d!19690 m!100393))

(assert (=> d!19690 m!99643))

(assert (=> d!19690 m!100367))

(assert (=> d!19690 m!99615))

(declare-fun m!100395 () Bool)

(assert (=> b!63362 m!100395))

(assert (=> b!63361 m!99619))

(declare-fun m!100397 () Bool)

(assert (=> b!63361 m!100397))

(declare-fun m!100399 () Bool)

(assert (=> b!63361 m!100399))

(declare-fun m!100401 () Bool)

(assert (=> b!63360 m!100401))

(assert (=> b!63360 m!99637))

(assert (=> b!63360 m!99619))

(declare-fun m!100403 () Bool)

(assert (=> b!63359 m!100403))

(assert (=> b!62917 d!19690))

(push 1)

(assert (not b!63352))

(assert (not b!63351))

(assert (not bm!802))

(assert (not b!63195))

(assert (not b!63342))

(assert (not b!63293))

(assert (not d!19662))

(assert (not b!63362))

(assert (not b!63347))

(assert (not b!63346))

(assert (not b!63359))

(assert (not d!19602))

(assert (not d!19674))

(assert (not b!63291))

(assert (not d!19650))

(assert (not d!19684))

(assert (not b!63348))

(assert (not b!63192))

(assert (not d!19642))

(assert (not b!63309))

(assert (not b!63297))

(assert (not d!19668))

(assert (not b!63316))

(assert (not b!63196))

(assert (not b!63292))

(assert (not b!63274))

(assert (not d!19646))

(assert (not b!63174))

(assert (not b!63344))

(assert (not b!63337))

(assert (not b!63272))

(assert (not b!63294))

(assert (not b!63319))

(assert (not b!63278))

(assert (not d!19618))

(assert (not b!63279))

(assert (not b!63340))

(assert (not b!63314))

(assert (not b!63357))

(assert (not b!63311))

(assert (not b!63354))

(assert (not b!63276))

(assert (not d!19644))

(assert (not b!63343))

(assert (not b!63339))

(assert (not d!19690))

(assert (not b!63190))

(assert (not b!63198))

(assert (not b!63295))

(assert (not b!63360))

(assert (not b!63306))

(assert (not b!63180))

(assert (not b!63356))

(assert (not b!63193))

(assert (not b!63191))

(assert (not d!19656))

(assert (not b!63341))

(assert (not d!19666))

(assert (not d!19682))

(assert (not d!19622))

(assert (not b!63273))

(assert (not d!19686))

(assert (not b!63172))

(assert (not b!63361))

(assert (not b!63304))

(assert (not d!19596))

(assert (not d!19670))

(assert (not d!19680))

(assert (not b!63338))

(assert (not d!19688))

(assert (not d!19654))

(assert (not b!63350))

(assert (not b!63355))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

