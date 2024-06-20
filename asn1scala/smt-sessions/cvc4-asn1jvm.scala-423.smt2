; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11068 () Bool)

(assert start!11068)

(declare-datatypes ((array!2570 0))(
  ( (array!2571 (arr!1714 (Array (_ BitVec 32) (_ BitVec 8))) (size!1171 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2570)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun b!54973 () Bool)

(declare-datatypes ((BitStream!2030 0))(
  ( (BitStream!2031 (buf!1531 array!2570) (currentByte!3110 (_ BitVec 32)) (currentBit!3105 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3797 0))(
  ( (Unit!3798) )
))
(declare-datatypes ((tuple2!5014 0))(
  ( (tuple2!5015 (_1!2618 Unit!3797) (_2!2618 BitStream!2030)) )
))
(declare-fun lt!85571 () tuple2!5014)

(declare-datatypes ((tuple2!5016 0))(
  ( (tuple2!5017 (_1!2619 BitStream!2030) (_2!2619 BitStream!2030)) )
))
(declare-fun lt!85573 () tuple2!5016)

(declare-fun e!36671 () Bool)

(declare-datatypes ((List!590 0))(
  ( (Nil!587) (Cons!586 (h!705 Bool) (t!1340 List!590)) )
))
(declare-fun head!409 (List!590) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2030 array!2570 (_ BitVec 64) (_ BitVec 64)) List!590)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2030 BitStream!2030 (_ BitVec 64)) List!590)

(assert (=> b!54973 (= e!36671 (= (head!409 (byteArrayBitContentToList!0 (_2!2618 lt!85571) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!409 (bitStreamReadBitsIntoList!0 (_2!2618 lt!85571) (_1!2619 lt!85573) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!54974 () Bool)

(declare-fun e!36676 () Bool)

(declare-fun thiss!1379 () BitStream!2030)

(declare-fun array_inv!1074 (array!2570) Bool)

(assert (=> b!54974 (= e!36676 (array_inv!1074 (buf!1531 thiss!1379)))))

(declare-fun res!45825 () Bool)

(declare-fun e!36670 () Bool)

(assert (=> start!11068 (=> (not res!45825) (not e!36670))))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!11068 (= res!45825 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1171 srcBuffer!2))))))))

(assert (=> start!11068 e!36670))

(assert (=> start!11068 true))

(assert (=> start!11068 (array_inv!1074 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2030) Bool)

(assert (=> start!11068 (and (inv!12 thiss!1379) e!36676)))

(declare-fun b!54975 () Bool)

(declare-fun e!36672 () Bool)

(assert (=> b!54975 (= e!36670 (not e!36672))))

(declare-fun res!45828 () Bool)

(assert (=> b!54975 (=> res!45828 e!36672)))

(assert (=> b!54975 (= res!45828 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2030 BitStream!2030) Bool)

(assert (=> b!54975 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!85570 () Unit!3797)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2030) Unit!3797)

(assert (=> b!54975 (= lt!85570 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!85572 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!54975 (= lt!85572 (bitIndex!0 (size!1171 (buf!1531 thiss!1379)) (currentByte!3110 thiss!1379) (currentBit!3105 thiss!1379)))))

(declare-fun b!54976 () Bool)

(declare-fun e!36677 () Bool)

(assert (=> b!54976 (= e!36672 e!36677)))

(declare-fun res!45824 () Bool)

(assert (=> b!54976 (=> res!45824 e!36677)))

(assert (=> b!54976 (= res!45824 (not (isPrefixOf!0 thiss!1379 (_2!2618 lt!85571))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!54976 (validate_offset_bits!1 ((_ sign_extend 32) (size!1171 (buf!1531 (_2!2618 lt!85571)))) ((_ sign_extend 32) (currentByte!3110 (_2!2618 lt!85571))) ((_ sign_extend 32) (currentBit!3105 (_2!2618 lt!85571))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!85577 () Unit!3797)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2030 BitStream!2030 (_ BitVec 64) (_ BitVec 64)) Unit!3797)

(assert (=> b!54976 (= lt!85577 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2618 lt!85571) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2030 (_ BitVec 8) (_ BitVec 32)) tuple2!5014)

(assert (=> b!54976 (= lt!85571 (appendBitFromByte!0 thiss!1379 (select (arr!1714 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!54977 () Bool)

(declare-fun lt!85574 () (_ BitVec 64))

(declare-fun lt!85578 () (_ BitVec 64))

(declare-fun e!36674 () Bool)

(assert (=> b!54977 (= e!36674 (or (= lt!85574 (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!85574 (bvand (bvsub lt!85578 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!54977 (= lt!85574 (bvand lt!85578 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!54977 (= lt!85578 (bvadd lt!85572 to!314))))

(declare-fun b!54978 () Bool)

(declare-fun res!45826 () Bool)

(assert (=> b!54978 (=> (not res!45826) (not e!36670))))

(assert (=> b!54978 (= res!45826 (validate_offset_bits!1 ((_ sign_extend 32) (size!1171 (buf!1531 thiss!1379))) ((_ sign_extend 32) (currentByte!3110 thiss!1379)) ((_ sign_extend 32) (currentBit!3105 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!54979 () Bool)

(assert (=> b!54979 (= e!36677 e!36674)))

(declare-fun res!45823 () Bool)

(assert (=> b!54979 (=> res!45823 e!36674)))

(declare-fun lt!85575 () tuple2!5014)

(assert (=> b!54979 (= res!45823 (not (isPrefixOf!0 (_2!2618 lt!85571) (_2!2618 lt!85575))))))

(assert (=> b!54979 (isPrefixOf!0 thiss!1379 (_2!2618 lt!85575))))

(declare-fun lt!85579 () Unit!3797)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2030 BitStream!2030 BitStream!2030) Unit!3797)

(assert (=> b!54979 (= lt!85579 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2618 lt!85571) (_2!2618 lt!85575)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2030 array!2570 (_ BitVec 64) (_ BitVec 64)) tuple2!5014)

(assert (=> b!54979 (= lt!85575 (appendBitsMSBFirstLoop!0 (_2!2618 lt!85571) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!54979 e!36671))

(declare-fun res!45827 () Bool)

(assert (=> b!54979 (=> (not res!45827) (not e!36671))))

(assert (=> b!54979 (= res!45827 (validate_offset_bits!1 ((_ sign_extend 32) (size!1171 (buf!1531 (_2!2618 lt!85571)))) ((_ sign_extend 32) (currentByte!3110 thiss!1379)) ((_ sign_extend 32) (currentBit!3105 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!85576 () Unit!3797)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2030 array!2570 (_ BitVec 64)) Unit!3797)

(assert (=> b!54979 (= lt!85576 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1531 (_2!2618 lt!85571)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2030 BitStream!2030) tuple2!5016)

(assert (=> b!54979 (= lt!85573 (reader!0 thiss!1379 (_2!2618 lt!85571)))))

(assert (= (and start!11068 res!45825) b!54978))

(assert (= (and b!54978 res!45826) b!54975))

(assert (= (and b!54975 (not res!45828)) b!54976))

(assert (= (and b!54976 (not res!45824)) b!54979))

(assert (= (and b!54979 res!45827) b!54973))

(assert (= (and b!54979 (not res!45823)) b!54977))

(assert (= start!11068 b!54974))

(declare-fun m!86553 () Bool)

(assert (=> b!54974 m!86553))

(declare-fun m!86555 () Bool)

(assert (=> start!11068 m!86555))

(declare-fun m!86557 () Bool)

(assert (=> start!11068 m!86557))

(declare-fun m!86559 () Bool)

(assert (=> b!54976 m!86559))

(declare-fun m!86561 () Bool)

(assert (=> b!54976 m!86561))

(declare-fun m!86563 () Bool)

(assert (=> b!54976 m!86563))

(declare-fun m!86565 () Bool)

(assert (=> b!54976 m!86565))

(assert (=> b!54976 m!86559))

(declare-fun m!86567 () Bool)

(assert (=> b!54976 m!86567))

(declare-fun m!86569 () Bool)

(assert (=> b!54979 m!86569))

(declare-fun m!86571 () Bool)

(assert (=> b!54979 m!86571))

(declare-fun m!86573 () Bool)

(assert (=> b!54979 m!86573))

(declare-fun m!86575 () Bool)

(assert (=> b!54979 m!86575))

(declare-fun m!86577 () Bool)

(assert (=> b!54979 m!86577))

(declare-fun m!86579 () Bool)

(assert (=> b!54979 m!86579))

(declare-fun m!86581 () Bool)

(assert (=> b!54979 m!86581))

(declare-fun m!86583 () Bool)

(assert (=> b!54978 m!86583))

(declare-fun m!86585 () Bool)

(assert (=> b!54975 m!86585))

(declare-fun m!86587 () Bool)

(assert (=> b!54975 m!86587))

(declare-fun m!86589 () Bool)

(assert (=> b!54975 m!86589))

(declare-fun m!86591 () Bool)

(assert (=> b!54973 m!86591))

(assert (=> b!54973 m!86591))

(declare-fun m!86593 () Bool)

(assert (=> b!54973 m!86593))

(declare-fun m!86595 () Bool)

(assert (=> b!54973 m!86595))

(assert (=> b!54973 m!86595))

(declare-fun m!86597 () Bool)

(assert (=> b!54973 m!86597))

(push 1)

(assert (not b!54979))

(assert (not b!54975))

(assert (not b!54974))

(assert (not start!11068))

(assert (not b!54973))

(assert (not b!54976))

(assert (not b!54978))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!17550 () Bool)

(assert (=> d!17550 (= (array_inv!1074 srcBuffer!2) (bvsge (size!1171 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!11068 d!17550))

(declare-fun d!17552 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!17552 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3105 thiss!1379) (currentByte!3110 thiss!1379) (size!1171 (buf!1531 thiss!1379))))))

(declare-fun bs!4419 () Bool)

(assert (= bs!4419 d!17552))

(declare-fun m!86661 () Bool)

(assert (=> bs!4419 m!86661))

(assert (=> start!11068 d!17552))

(declare-fun d!17554 () Bool)

(declare-fun res!45885 () Bool)

(declare-fun e!36712 () Bool)

(assert (=> d!17554 (=> (not res!45885) (not e!36712))))

(assert (=> d!17554 (= res!45885 (= (size!1171 (buf!1531 thiss!1379)) (size!1171 (buf!1531 (_2!2618 lt!85571)))))))

(assert (=> d!17554 (= (isPrefixOf!0 thiss!1379 (_2!2618 lt!85571)) e!36712)))

(declare-fun b!55040 () Bool)

(declare-fun res!45884 () Bool)

(assert (=> b!55040 (=> (not res!45884) (not e!36712))))

(assert (=> b!55040 (= res!45884 (bvsle (bitIndex!0 (size!1171 (buf!1531 thiss!1379)) (currentByte!3110 thiss!1379) (currentBit!3105 thiss!1379)) (bitIndex!0 (size!1171 (buf!1531 (_2!2618 lt!85571))) (currentByte!3110 (_2!2618 lt!85571)) (currentBit!3105 (_2!2618 lt!85571)))))))

(declare-fun b!55041 () Bool)

(declare-fun e!36713 () Bool)

(assert (=> b!55041 (= e!36712 e!36713)))

(declare-fun res!45883 () Bool)

(assert (=> b!55041 (=> res!45883 e!36713)))

(assert (=> b!55041 (= res!45883 (= (size!1171 (buf!1531 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!55042 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2570 array!2570 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!55042 (= e!36713 (arrayBitRangesEq!0 (buf!1531 thiss!1379) (buf!1531 (_2!2618 lt!85571)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1171 (buf!1531 thiss!1379)) (currentByte!3110 thiss!1379) (currentBit!3105 thiss!1379))))))

(assert (= (and d!17554 res!45885) b!55040))

(assert (= (and b!55040 res!45884) b!55041))

(assert (= (and b!55041 (not res!45883)) b!55042))

(assert (=> b!55040 m!86589))

(declare-fun m!86663 () Bool)

(assert (=> b!55040 m!86663))

(assert (=> b!55042 m!86589))

(assert (=> b!55042 m!86589))

(declare-fun m!86665 () Bool)

(assert (=> b!55042 m!86665))

(assert (=> b!54976 d!17554))

(declare-fun d!17556 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!17556 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1171 (buf!1531 (_2!2618 lt!85571)))) ((_ sign_extend 32) (currentByte!3110 (_2!2618 lt!85571))) ((_ sign_extend 32) (currentBit!3105 (_2!2618 lt!85571))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1171 (buf!1531 (_2!2618 lt!85571)))) ((_ sign_extend 32) (currentByte!3110 (_2!2618 lt!85571))) ((_ sign_extend 32) (currentBit!3105 (_2!2618 lt!85571)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4420 () Bool)

(assert (= bs!4420 d!17556))

(declare-fun m!86667 () Bool)

(assert (=> bs!4420 m!86667))

(assert (=> b!54976 d!17556))

(declare-fun d!17558 () Bool)

(declare-fun e!36716 () Bool)

(assert (=> d!17558 e!36716))

(declare-fun res!45888 () Bool)

(assert (=> d!17558 (=> (not res!45888) (not e!36716))))

(assert (=> d!17558 (= res!45888 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!85693 () Unit!3797)

(declare-fun choose!27 (BitStream!2030 BitStream!2030 (_ BitVec 64) (_ BitVec 64)) Unit!3797)

(assert (=> d!17558 (= lt!85693 (choose!27 thiss!1379 (_2!2618 lt!85571) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!17558 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!17558 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2618 lt!85571) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!85693)))

(declare-fun b!55045 () Bool)

(assert (=> b!55045 (= e!36716 (validate_offset_bits!1 ((_ sign_extend 32) (size!1171 (buf!1531 (_2!2618 lt!85571)))) ((_ sign_extend 32) (currentByte!3110 (_2!2618 lt!85571))) ((_ sign_extend 32) (currentBit!3105 (_2!2618 lt!85571))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!17558 res!45888) b!55045))

(declare-fun m!86669 () Bool)

(assert (=> d!17558 m!86669))

(assert (=> b!55045 m!86563))

(assert (=> b!54976 d!17558))

(declare-fun b!55081 () Bool)

(declare-fun res!45919 () Bool)

(declare-fun e!36734 () Bool)

(assert (=> b!55081 (=> (not res!45919) (not e!36734))))

(declare-fun lt!85782 () tuple2!5014)

(assert (=> b!55081 (= res!45919 (isPrefixOf!0 thiss!1379 (_2!2618 lt!85782)))))

(declare-fun b!55082 () Bool)

(declare-fun res!45921 () Bool)

(assert (=> b!55082 (=> (not res!45921) (not e!36734))))

(assert (=> b!55082 (= res!45921 (= (bitIndex!0 (size!1171 (buf!1531 (_2!2618 lt!85782))) (currentByte!3110 (_2!2618 lt!85782)) (currentBit!3105 (_2!2618 lt!85782))) (bvadd (bitIndex!0 (size!1171 (buf!1531 thiss!1379)) (currentByte!3110 thiss!1379) (currentBit!3105 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!55083 () Bool)

(declare-fun res!45923 () Bool)

(declare-fun e!36735 () Bool)

(assert (=> b!55083 (=> (not res!45923) (not e!36735))))

(declare-fun lt!85786 () tuple2!5014)

(assert (=> b!55083 (= res!45923 (isPrefixOf!0 thiss!1379 (_2!2618 lt!85786)))))

(declare-fun b!55084 () Bool)

(declare-fun e!36736 () Bool)

(declare-datatypes ((tuple2!5020 0))(
  ( (tuple2!5021 (_1!2621 BitStream!2030) (_2!2621 Bool)) )
))
(declare-fun lt!85784 () tuple2!5020)

(assert (=> b!55084 (= e!36736 (= (bitIndex!0 (size!1171 (buf!1531 (_1!2621 lt!85784))) (currentByte!3110 (_1!2621 lt!85784)) (currentBit!3105 (_1!2621 lt!85784))) (bitIndex!0 (size!1171 (buf!1531 (_2!2618 lt!85786))) (currentByte!3110 (_2!2618 lt!85786)) (currentBit!3105 (_2!2618 lt!85786)))))))

(declare-fun d!17560 () Bool)

(assert (=> d!17560 e!36735))

(declare-fun res!45917 () Bool)

(assert (=> d!17560 (=> (not res!45917) (not e!36735))))

(assert (=> d!17560 (= res!45917 (= (size!1171 (buf!1531 (_2!2618 lt!85786))) (size!1171 (buf!1531 thiss!1379))))))

(declare-fun lt!85779 () (_ BitVec 8))

(declare-fun lt!85788 () array!2570)

(assert (=> d!17560 (= lt!85779 (select (arr!1714 lt!85788) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!17560 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1171 lt!85788)))))

(assert (=> d!17560 (= lt!85788 (array!2571 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!85780 () tuple2!5014)

(assert (=> d!17560 (= lt!85786 (tuple2!5015 (_1!2618 lt!85780) (_2!2618 lt!85780)))))

(assert (=> d!17560 (= lt!85780 lt!85782)))

(assert (=> d!17560 e!36734))

(declare-fun res!45920 () Bool)

(assert (=> d!17560 (=> (not res!45920) (not e!36734))))

(assert (=> d!17560 (= res!45920 (= (size!1171 (buf!1531 thiss!1379)) (size!1171 (buf!1531 (_2!2618 lt!85782)))))))

(declare-fun lt!85787 () Bool)

(declare-fun appendBit!0 (BitStream!2030 Bool) tuple2!5014)

(assert (=> d!17560 (= lt!85782 (appendBit!0 thiss!1379 lt!85787))))

(assert (=> d!17560 (= lt!85787 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1714 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!17560 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!17560 (= (appendBitFromByte!0 thiss!1379 (select (arr!1714 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!85786)))

(declare-fun b!55085 () Bool)

(declare-fun e!36733 () Bool)

(declare-fun lt!85783 () tuple2!5020)

(assert (=> b!55085 (= e!36733 (= (bitIndex!0 (size!1171 (buf!1531 (_1!2621 lt!85783))) (currentByte!3110 (_1!2621 lt!85783)) (currentBit!3105 (_1!2621 lt!85783))) (bitIndex!0 (size!1171 (buf!1531 (_2!2618 lt!85782))) (currentByte!3110 (_2!2618 lt!85782)) (currentBit!3105 (_2!2618 lt!85782)))))))

(declare-fun b!55086 () Bool)

(assert (=> b!55086 (= e!36735 e!36736)))

(declare-fun res!45924 () Bool)

(assert (=> b!55086 (=> (not res!45924) (not e!36736))))

(assert (=> b!55086 (= res!45924 (and (= (_2!2621 lt!85784) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1714 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!85779)) #b00000000000000000000000000000000))) (= (_1!2621 lt!85784) (_2!2618 lt!85786))))))

(declare-datatypes ((tuple2!5026 0))(
  ( (tuple2!5027 (_1!2624 array!2570) (_2!2624 BitStream!2030)) )
))
(declare-fun lt!85778 () tuple2!5026)

(declare-fun lt!85781 () BitStream!2030)

(declare-fun readBits!0 (BitStream!2030 (_ BitVec 64)) tuple2!5026)

(assert (=> b!55086 (= lt!85778 (readBits!0 lt!85781 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2030) tuple2!5020)

(assert (=> b!55086 (= lt!85784 (readBitPure!0 lt!85781))))

(declare-fun readerFrom!0 (BitStream!2030 (_ BitVec 32) (_ BitVec 32)) BitStream!2030)

(assert (=> b!55086 (= lt!85781 (readerFrom!0 (_2!2618 lt!85786) (currentBit!3105 thiss!1379) (currentByte!3110 thiss!1379)))))

(declare-fun b!55087 () Bool)

(assert (=> b!55087 (= e!36734 e!36733)))

(declare-fun res!45918 () Bool)

(assert (=> b!55087 (=> (not res!45918) (not e!36733))))

(assert (=> b!55087 (= res!45918 (and (= (_2!2621 lt!85783) lt!85787) (= (_1!2621 lt!85783) (_2!2618 lt!85782))))))

(assert (=> b!55087 (= lt!85783 (readBitPure!0 (readerFrom!0 (_2!2618 lt!85782) (currentBit!3105 thiss!1379) (currentByte!3110 thiss!1379))))))

(declare-fun b!55088 () Bool)

(declare-fun res!45922 () Bool)

(assert (=> b!55088 (=> (not res!45922) (not e!36735))))

(declare-fun lt!85789 () (_ BitVec 64))

(declare-fun lt!85785 () (_ BitVec 64))

(assert (=> b!55088 (= res!45922 (= (bitIndex!0 (size!1171 (buf!1531 (_2!2618 lt!85786))) (currentByte!3110 (_2!2618 lt!85786)) (currentBit!3105 (_2!2618 lt!85786))) (bvadd lt!85789 lt!85785)))))

(assert (=> b!55088 (or (not (= (bvand lt!85789 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!85785 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!85789 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!85789 lt!85785) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!55088 (= lt!85785 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!55088 (= lt!85789 (bitIndex!0 (size!1171 (buf!1531 thiss!1379)) (currentByte!3110 thiss!1379) (currentBit!3105 thiss!1379)))))

(assert (= (and d!17560 res!45920) b!55082))

(assert (= (and b!55082 res!45921) b!55081))

(assert (= (and b!55081 res!45919) b!55087))

(assert (= (and b!55087 res!45918) b!55085))

(assert (= (and d!17560 res!45917) b!55088))

(assert (= (and b!55088 res!45922) b!55083))

(assert (= (and b!55083 res!45923) b!55086))

(assert (= (and b!55086 res!45924) b!55084))

(declare-fun m!86701 () Bool)

(assert (=> b!55086 m!86701))

(declare-fun m!86703 () Bool)

(assert (=> b!55086 m!86703))

(declare-fun m!86705 () Bool)

(assert (=> b!55086 m!86705))

(declare-fun m!86707 () Bool)

(assert (=> b!55082 m!86707))

(assert (=> b!55082 m!86589))

(declare-fun m!86709 () Bool)

(assert (=> d!17560 m!86709))

(declare-fun m!86711 () Bool)

(assert (=> d!17560 m!86711))

(declare-fun m!86713 () Bool)

(assert (=> d!17560 m!86713))

(declare-fun m!86715 () Bool)

(assert (=> b!55088 m!86715))

(assert (=> b!55088 m!86589))

(declare-fun m!86717 () Bool)

(assert (=> b!55081 m!86717))

(declare-fun m!86719 () Bool)

(assert (=> b!55084 m!86719))

(assert (=> b!55084 m!86715))

(declare-fun m!86721 () Bool)

(assert (=> b!55085 m!86721))

(assert (=> b!55085 m!86707))

(declare-fun m!86723 () Bool)

(assert (=> b!55087 m!86723))

(assert (=> b!55087 m!86723))

(declare-fun m!86725 () Bool)

(assert (=> b!55087 m!86725))

(declare-fun m!86727 () Bool)

(assert (=> b!55083 m!86727))

(assert (=> b!54976 d!17560))

(declare-fun d!17566 () Bool)

(declare-fun res!45927 () Bool)

(declare-fun e!36737 () Bool)

(assert (=> d!17566 (=> (not res!45927) (not e!36737))))

(assert (=> d!17566 (= res!45927 (= (size!1171 (buf!1531 thiss!1379)) (size!1171 (buf!1531 thiss!1379))))))

(assert (=> d!17566 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!36737)))

(declare-fun b!55089 () Bool)

(declare-fun res!45926 () Bool)

(assert (=> b!55089 (=> (not res!45926) (not e!36737))))

(assert (=> b!55089 (= res!45926 (bvsle (bitIndex!0 (size!1171 (buf!1531 thiss!1379)) (currentByte!3110 thiss!1379) (currentBit!3105 thiss!1379)) (bitIndex!0 (size!1171 (buf!1531 thiss!1379)) (currentByte!3110 thiss!1379) (currentBit!3105 thiss!1379))))))

(declare-fun b!55090 () Bool)

(declare-fun e!36738 () Bool)

(assert (=> b!55090 (= e!36737 e!36738)))

(declare-fun res!45925 () Bool)

(assert (=> b!55090 (=> res!45925 e!36738)))

(assert (=> b!55090 (= res!45925 (= (size!1171 (buf!1531 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!55091 () Bool)

(assert (=> b!55091 (= e!36738 (arrayBitRangesEq!0 (buf!1531 thiss!1379) (buf!1531 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1171 (buf!1531 thiss!1379)) (currentByte!3110 thiss!1379) (currentBit!3105 thiss!1379))))))

(assert (= (and d!17566 res!45927) b!55089))

(assert (= (and b!55089 res!45926) b!55090))

(assert (= (and b!55090 (not res!45925)) b!55091))

(assert (=> b!55089 m!86589))

(assert (=> b!55089 m!86589))

(assert (=> b!55091 m!86589))

(assert (=> b!55091 m!86589))

(declare-fun m!86729 () Bool)

(assert (=> b!55091 m!86729))

(assert (=> b!54975 d!17566))

(declare-fun d!17568 () Bool)

(assert (=> d!17568 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!85792 () Unit!3797)

(declare-fun choose!11 (BitStream!2030) Unit!3797)

(assert (=> d!17568 (= lt!85792 (choose!11 thiss!1379))))

(assert (=> d!17568 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!85792)))

(declare-fun bs!4422 () Bool)

(assert (= bs!4422 d!17568))

(assert (=> bs!4422 m!86585))

(declare-fun m!86731 () Bool)

(assert (=> bs!4422 m!86731))

(assert (=> b!54975 d!17568))

(declare-fun d!17570 () Bool)

(declare-fun e!36741 () Bool)

(assert (=> d!17570 e!36741))

(declare-fun res!45932 () Bool)

(assert (=> d!17570 (=> (not res!45932) (not e!36741))))

(declare-fun lt!85808 () (_ BitVec 64))

(declare-fun lt!85809 () (_ BitVec 64))

(declare-fun lt!85805 () (_ BitVec 64))

(assert (=> d!17570 (= res!45932 (= lt!85808 (bvsub lt!85805 lt!85809)))))

(assert (=> d!17570 (or (= (bvand lt!85805 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!85809 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!85805 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!85805 lt!85809) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17570 (= lt!85809 (remainingBits!0 ((_ sign_extend 32) (size!1171 (buf!1531 thiss!1379))) ((_ sign_extend 32) (currentByte!3110 thiss!1379)) ((_ sign_extend 32) (currentBit!3105 thiss!1379))))))

(declare-fun lt!85810 () (_ BitVec 64))

(declare-fun lt!85807 () (_ BitVec 64))

(assert (=> d!17570 (= lt!85805 (bvmul lt!85810 lt!85807))))

(assert (=> d!17570 (or (= lt!85810 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!85807 (bvsdiv (bvmul lt!85810 lt!85807) lt!85810)))))

(assert (=> d!17570 (= lt!85807 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17570 (= lt!85810 ((_ sign_extend 32) (size!1171 (buf!1531 thiss!1379))))))

(assert (=> d!17570 (= lt!85808 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3110 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3105 thiss!1379))))))

(assert (=> d!17570 (invariant!0 (currentBit!3105 thiss!1379) (currentByte!3110 thiss!1379) (size!1171 (buf!1531 thiss!1379)))))

(assert (=> d!17570 (= (bitIndex!0 (size!1171 (buf!1531 thiss!1379)) (currentByte!3110 thiss!1379) (currentBit!3105 thiss!1379)) lt!85808)))

(declare-fun b!55096 () Bool)

(declare-fun res!45933 () Bool)

(assert (=> b!55096 (=> (not res!45933) (not e!36741))))

(assert (=> b!55096 (= res!45933 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!85808))))

(declare-fun b!55097 () Bool)

(declare-fun lt!85806 () (_ BitVec 64))

(assert (=> b!55097 (= e!36741 (bvsle lt!85808 (bvmul lt!85806 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!55097 (or (= lt!85806 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!85806 #b0000000000000000000000000000000000000000000000000000000000001000) lt!85806)))))

(assert (=> b!55097 (= lt!85806 ((_ sign_extend 32) (size!1171 (buf!1531 thiss!1379))))))

(assert (= (and d!17570 res!45932) b!55096))

(assert (= (and b!55096 res!45933) b!55097))

(declare-fun m!86733 () Bool)

(assert (=> d!17570 m!86733))

(assert (=> d!17570 m!86661))

(assert (=> b!54975 d!17570))

(declare-fun d!17572 () Bool)

(assert (=> d!17572 (= (array_inv!1074 (buf!1531 thiss!1379)) (bvsge (size!1171 (buf!1531 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!54974 d!17572))

(declare-fun d!17574 () Bool)

(declare-fun res!45936 () Bool)

(declare-fun e!36742 () Bool)

(assert (=> d!17574 (=> (not res!45936) (not e!36742))))

(assert (=> d!17574 (= res!45936 (= (size!1171 (buf!1531 thiss!1379)) (size!1171 (buf!1531 (_2!2618 lt!85575)))))))

(assert (=> d!17574 (= (isPrefixOf!0 thiss!1379 (_2!2618 lt!85575)) e!36742)))

(declare-fun b!55098 () Bool)

(declare-fun res!45935 () Bool)

(assert (=> b!55098 (=> (not res!45935) (not e!36742))))

(assert (=> b!55098 (= res!45935 (bvsle (bitIndex!0 (size!1171 (buf!1531 thiss!1379)) (currentByte!3110 thiss!1379) (currentBit!3105 thiss!1379)) (bitIndex!0 (size!1171 (buf!1531 (_2!2618 lt!85575))) (currentByte!3110 (_2!2618 lt!85575)) (currentBit!3105 (_2!2618 lt!85575)))))))

(declare-fun b!55099 () Bool)

(declare-fun e!36743 () Bool)

(assert (=> b!55099 (= e!36742 e!36743)))

(declare-fun res!45934 () Bool)

(assert (=> b!55099 (=> res!45934 e!36743)))

(assert (=> b!55099 (= res!45934 (= (size!1171 (buf!1531 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!55100 () Bool)

(assert (=> b!55100 (= e!36743 (arrayBitRangesEq!0 (buf!1531 thiss!1379) (buf!1531 (_2!2618 lt!85575)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1171 (buf!1531 thiss!1379)) (currentByte!3110 thiss!1379) (currentBit!3105 thiss!1379))))))

(assert (= (and d!17574 res!45936) b!55098))

(assert (= (and b!55098 res!45935) b!55099))

(assert (= (and b!55099 (not res!45934)) b!55100))

(assert (=> b!55098 m!86589))

(declare-fun m!86735 () Bool)

(assert (=> b!55098 m!86735))

(assert (=> b!55100 m!86589))

(assert (=> b!55100 m!86589))

(declare-fun m!86737 () Bool)

(assert (=> b!55100 m!86737))

(assert (=> b!54979 d!17574))

(declare-fun b!55111 () Bool)

(declare-fun e!36749 () Unit!3797)

(declare-fun Unit!3815 () Unit!3797)

(assert (=> b!55111 (= e!36749 Unit!3815)))

(declare-fun b!55113 () Bool)

(declare-fun res!45943 () Bool)

(declare-fun e!36748 () Bool)

(assert (=> b!55113 (=> (not res!45943) (not e!36748))))

(declare-fun lt!85863 () tuple2!5016)

(assert (=> b!55113 (= res!45943 (isPrefixOf!0 (_1!2619 lt!85863) thiss!1379))))

(declare-fun b!55114 () Bool)

(declare-fun res!45944 () Bool)

(assert (=> b!55114 (=> (not res!45944) (not e!36748))))

(assert (=> b!55114 (= res!45944 (isPrefixOf!0 (_2!2619 lt!85863) (_2!2618 lt!85571)))))

(declare-fun b!55115 () Bool)

(declare-fun lt!85858 () (_ BitVec 64))

(declare-fun lt!85868 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2030 (_ BitVec 64)) BitStream!2030)

(assert (=> b!55115 (= e!36748 (= (_1!2619 lt!85863) (withMovedBitIndex!0 (_2!2619 lt!85863) (bvsub lt!85858 lt!85868))))))

(assert (=> b!55115 (or (= (bvand lt!85858 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!85868 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!85858 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!85858 lt!85868) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!55115 (= lt!85868 (bitIndex!0 (size!1171 (buf!1531 (_2!2618 lt!85571))) (currentByte!3110 (_2!2618 lt!85571)) (currentBit!3105 (_2!2618 lt!85571))))))

(assert (=> b!55115 (= lt!85858 (bitIndex!0 (size!1171 (buf!1531 thiss!1379)) (currentByte!3110 thiss!1379) (currentBit!3105 thiss!1379)))))

(declare-fun b!55112 () Bool)

(declare-fun lt!85853 () Unit!3797)

(assert (=> b!55112 (= e!36749 lt!85853)))

(declare-fun lt!85856 () (_ BitVec 64))

(assert (=> b!55112 (= lt!85856 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85870 () (_ BitVec 64))

(assert (=> b!55112 (= lt!85870 (bitIndex!0 (size!1171 (buf!1531 thiss!1379)) (currentByte!3110 thiss!1379) (currentBit!3105 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2570 array!2570 (_ BitVec 64) (_ BitVec 64)) Unit!3797)

(assert (=> b!55112 (= lt!85853 (arrayBitRangesEqSymmetric!0 (buf!1531 thiss!1379) (buf!1531 (_2!2618 lt!85571)) lt!85856 lt!85870))))

(assert (=> b!55112 (arrayBitRangesEq!0 (buf!1531 (_2!2618 lt!85571)) (buf!1531 thiss!1379) lt!85856 lt!85870)))

(declare-fun d!17576 () Bool)

(assert (=> d!17576 e!36748))

(declare-fun res!45945 () Bool)

(assert (=> d!17576 (=> (not res!45945) (not e!36748))))

(assert (=> d!17576 (= res!45945 (isPrefixOf!0 (_1!2619 lt!85863) (_2!2619 lt!85863)))))

(declare-fun lt!85855 () BitStream!2030)

(assert (=> d!17576 (= lt!85863 (tuple2!5017 lt!85855 (_2!2618 lt!85571)))))

(declare-fun lt!85866 () Unit!3797)

(declare-fun lt!85865 () Unit!3797)

(assert (=> d!17576 (= lt!85866 lt!85865)))

(assert (=> d!17576 (isPrefixOf!0 lt!85855 (_2!2618 lt!85571))))

(assert (=> d!17576 (= lt!85865 (lemmaIsPrefixTransitive!0 lt!85855 (_2!2618 lt!85571) (_2!2618 lt!85571)))))

(declare-fun lt!85869 () Unit!3797)

(declare-fun lt!85860 () Unit!3797)

(assert (=> d!17576 (= lt!85869 lt!85860)))

(assert (=> d!17576 (isPrefixOf!0 lt!85855 (_2!2618 lt!85571))))

(assert (=> d!17576 (= lt!85860 (lemmaIsPrefixTransitive!0 lt!85855 thiss!1379 (_2!2618 lt!85571)))))

(declare-fun lt!85854 () Unit!3797)

(assert (=> d!17576 (= lt!85854 e!36749)))

(declare-fun c!3921 () Bool)

(assert (=> d!17576 (= c!3921 (not (= (size!1171 (buf!1531 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!85852 () Unit!3797)

(declare-fun lt!85851 () Unit!3797)

(assert (=> d!17576 (= lt!85852 lt!85851)))

(assert (=> d!17576 (isPrefixOf!0 (_2!2618 lt!85571) (_2!2618 lt!85571))))

(assert (=> d!17576 (= lt!85851 (lemmaIsPrefixRefl!0 (_2!2618 lt!85571)))))

(declare-fun lt!85867 () Unit!3797)

(declare-fun lt!85857 () Unit!3797)

(assert (=> d!17576 (= lt!85867 lt!85857)))

(assert (=> d!17576 (= lt!85857 (lemmaIsPrefixRefl!0 (_2!2618 lt!85571)))))

(declare-fun lt!85861 () Unit!3797)

(declare-fun lt!85859 () Unit!3797)

(assert (=> d!17576 (= lt!85861 lt!85859)))

(assert (=> d!17576 (isPrefixOf!0 lt!85855 lt!85855)))

(assert (=> d!17576 (= lt!85859 (lemmaIsPrefixRefl!0 lt!85855))))

(declare-fun lt!85862 () Unit!3797)

(declare-fun lt!85864 () Unit!3797)

(assert (=> d!17576 (= lt!85862 lt!85864)))

(assert (=> d!17576 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!17576 (= lt!85864 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!17576 (= lt!85855 (BitStream!2031 (buf!1531 (_2!2618 lt!85571)) (currentByte!3110 thiss!1379) (currentBit!3105 thiss!1379)))))

(assert (=> d!17576 (isPrefixOf!0 thiss!1379 (_2!2618 lt!85571))))

(assert (=> d!17576 (= (reader!0 thiss!1379 (_2!2618 lt!85571)) lt!85863)))

(assert (= (and d!17576 c!3921) b!55112))

(assert (= (and d!17576 (not c!3921)) b!55111))

(assert (= (and d!17576 res!45945) b!55113))

(assert (= (and b!55113 res!45943) b!55114))

(assert (= (and b!55114 res!45944) b!55115))

(assert (=> b!55112 m!86589))

(declare-fun m!86739 () Bool)

(assert (=> b!55112 m!86739))

(declare-fun m!86741 () Bool)

(assert (=> b!55112 m!86741))

(declare-fun m!86743 () Bool)

(assert (=> d!17576 m!86743))

(assert (=> d!17576 m!86587))

(declare-fun m!86745 () Bool)

(assert (=> d!17576 m!86745))

(assert (=> d!17576 m!86561))

(declare-fun m!86747 () Bool)

(assert (=> d!17576 m!86747))

(declare-fun m!86749 () Bool)

(assert (=> d!17576 m!86749))

(declare-fun m!86751 () Bool)

(assert (=> d!17576 m!86751))

(declare-fun m!86753 () Bool)

(assert (=> d!17576 m!86753))

(declare-fun m!86755 () Bool)

(assert (=> d!17576 m!86755))

(declare-fun m!86757 () Bool)

(assert (=> d!17576 m!86757))

(assert (=> d!17576 m!86585))

(declare-fun m!86759 () Bool)

(assert (=> b!55114 m!86759))

(declare-fun m!86761 () Bool)

(assert (=> b!55113 m!86761))

(declare-fun m!86763 () Bool)

(assert (=> b!55115 m!86763))

(assert (=> b!55115 m!86663))

(assert (=> b!55115 m!86589))

(assert (=> b!54979 d!17576))

(declare-fun d!17578 () Bool)

(assert (=> d!17578 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1171 (buf!1531 (_2!2618 lt!85571)))) ((_ sign_extend 32) (currentByte!3110 thiss!1379)) ((_ sign_extend 32) (currentBit!3105 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1171 (buf!1531 (_2!2618 lt!85571)))) ((_ sign_extend 32) (currentByte!3110 thiss!1379)) ((_ sign_extend 32) (currentBit!3105 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4423 () Bool)

(assert (= bs!4423 d!17578))

(declare-fun m!86765 () Bool)

(assert (=> bs!4423 m!86765))

(assert (=> b!54979 d!17578))

(declare-fun d!17580 () Bool)

(declare-fun res!45948 () Bool)

(declare-fun e!36750 () Bool)

(assert (=> d!17580 (=> (not res!45948) (not e!36750))))

(assert (=> d!17580 (= res!45948 (= (size!1171 (buf!1531 (_2!2618 lt!85571))) (size!1171 (buf!1531 (_2!2618 lt!85575)))))))

(assert (=> d!17580 (= (isPrefixOf!0 (_2!2618 lt!85571) (_2!2618 lt!85575)) e!36750)))

(declare-fun b!55116 () Bool)

(declare-fun res!45947 () Bool)

(assert (=> b!55116 (=> (not res!45947) (not e!36750))))

(assert (=> b!55116 (= res!45947 (bvsle (bitIndex!0 (size!1171 (buf!1531 (_2!2618 lt!85571))) (currentByte!3110 (_2!2618 lt!85571)) (currentBit!3105 (_2!2618 lt!85571))) (bitIndex!0 (size!1171 (buf!1531 (_2!2618 lt!85575))) (currentByte!3110 (_2!2618 lt!85575)) (currentBit!3105 (_2!2618 lt!85575)))))))

(declare-fun b!55117 () Bool)

(declare-fun e!36751 () Bool)

(assert (=> b!55117 (= e!36750 e!36751)))

(declare-fun res!45946 () Bool)

(assert (=> b!55117 (=> res!45946 e!36751)))

(assert (=> b!55117 (= res!45946 (= (size!1171 (buf!1531 (_2!2618 lt!85571))) #b00000000000000000000000000000000))))

(declare-fun b!55118 () Bool)

(assert (=> b!55118 (= e!36751 (arrayBitRangesEq!0 (buf!1531 (_2!2618 lt!85571)) (buf!1531 (_2!2618 lt!85575)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1171 (buf!1531 (_2!2618 lt!85571))) (currentByte!3110 (_2!2618 lt!85571)) (currentBit!3105 (_2!2618 lt!85571)))))))

(assert (= (and d!17580 res!45948) b!55116))

(assert (= (and b!55116 res!45947) b!55117))

(assert (= (and b!55117 (not res!45946)) b!55118))

(assert (=> b!55116 m!86663))

(assert (=> b!55116 m!86735))

(assert (=> b!55118 m!86663))

(assert (=> b!55118 m!86663))

(declare-fun m!86767 () Bool)

(assert (=> b!55118 m!86767))

(assert (=> b!54979 d!17580))

(declare-fun d!17582 () Bool)

(assert (=> d!17582 (validate_offset_bits!1 ((_ sign_extend 32) (size!1171 (buf!1531 (_2!2618 lt!85571)))) ((_ sign_extend 32) (currentByte!3110 thiss!1379)) ((_ sign_extend 32) (currentBit!3105 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!85873 () Unit!3797)

(declare-fun choose!9 (BitStream!2030 array!2570 (_ BitVec 64) BitStream!2030) Unit!3797)

(assert (=> d!17582 (= lt!85873 (choose!9 thiss!1379 (buf!1531 (_2!2618 lt!85571)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2031 (buf!1531 (_2!2618 lt!85571)) (currentByte!3110 thiss!1379) (currentBit!3105 thiss!1379))))))

(assert (=> d!17582 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1531 (_2!2618 lt!85571)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!85873)))

(declare-fun bs!4424 () Bool)

(assert (= bs!4424 d!17582))

(assert (=> bs!4424 m!86573))

(declare-fun m!86769 () Bool)

(assert (=> bs!4424 m!86769))

(assert (=> b!54979 d!17582))

(declare-fun b!55273 () Bool)

(declare-fun res!46052 () Bool)

(declare-fun e!36825 () Bool)

(assert (=> b!55273 (=> (not res!46052) (not e!36825))))

(declare-fun lt!86346 () tuple2!5014)

(assert (=> b!55273 (= res!46052 (= (size!1171 (buf!1531 (_2!2618 lt!85571))) (size!1171 (buf!1531 (_2!2618 lt!86346)))))))

(declare-fun b!55274 () Bool)

(declare-fun e!36824 () Bool)

(declare-fun lt!86325 () (_ BitVec 64))

(assert (=> b!55274 (= e!36824 (validate_offset_bits!1 ((_ sign_extend 32) (size!1171 (buf!1531 (_2!2618 lt!85571)))) ((_ sign_extend 32) (currentByte!3110 (_2!2618 lt!85571))) ((_ sign_extend 32) (currentBit!3105 (_2!2618 lt!85571))) lt!86325))))

(declare-fun b!55275 () Bool)

(declare-fun e!36826 () tuple2!5014)

(declare-fun lt!86333 () tuple2!5014)

(declare-fun Unit!3816 () Unit!3797)

(assert (=> b!55275 (= e!36826 (tuple2!5015 Unit!3816 (_2!2618 lt!86333)))))

(declare-fun lt!86331 () tuple2!5014)

(assert (=> b!55275 (= lt!86331 (appendBitFromByte!0 (_2!2618 lt!85571) (select (arr!1714 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!86349 () (_ BitVec 64))

(assert (=> b!55275 (= lt!86349 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!86328 () (_ BitVec 64))

(assert (=> b!55275 (= lt!86328 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!86342 () Unit!3797)

(assert (=> b!55275 (= lt!86342 (validateOffsetBitsIneqLemma!0 (_2!2618 lt!85571) (_2!2618 lt!86331) lt!86349 lt!86328))))

(assert (=> b!55275 (validate_offset_bits!1 ((_ sign_extend 32) (size!1171 (buf!1531 (_2!2618 lt!86331)))) ((_ sign_extend 32) (currentByte!3110 (_2!2618 lt!86331))) ((_ sign_extend 32) (currentBit!3105 (_2!2618 lt!86331))) (bvsub lt!86349 lt!86328))))

(declare-fun lt!86316 () Unit!3797)

(assert (=> b!55275 (= lt!86316 lt!86342)))

(declare-fun lt!86343 () tuple2!5016)

(declare-fun call!709 () tuple2!5016)

(assert (=> b!55275 (= lt!86343 call!709)))

(declare-fun lt!86322 () (_ BitVec 64))

(assert (=> b!55275 (= lt!86322 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!86355 () Unit!3797)

(assert (=> b!55275 (= lt!86355 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2618 lt!85571) (buf!1531 (_2!2618 lt!86331)) lt!86322))))

(assert (=> b!55275 (validate_offset_bits!1 ((_ sign_extend 32) (size!1171 (buf!1531 (_2!2618 lt!86331)))) ((_ sign_extend 32) (currentByte!3110 (_2!2618 lt!85571))) ((_ sign_extend 32) (currentBit!3105 (_2!2618 lt!85571))) lt!86322)))

(declare-fun lt!86350 () Unit!3797)

(assert (=> b!55275 (= lt!86350 lt!86355)))

(assert (=> b!55275 (= (head!409 (byteArrayBitContentToList!0 (_2!2618 lt!86331) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!409 (bitStreamReadBitsIntoList!0 (_2!2618 lt!86331) (_1!2619 lt!86343) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!86351 () Unit!3797)

(declare-fun Unit!3817 () Unit!3797)

(assert (=> b!55275 (= lt!86351 Unit!3817)))

(assert (=> b!55275 (= lt!86333 (appendBitsMSBFirstLoop!0 (_2!2618 lt!86331) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!86315 () Unit!3797)

(assert (=> b!55275 (= lt!86315 (lemmaIsPrefixTransitive!0 (_2!2618 lt!85571) (_2!2618 lt!86331) (_2!2618 lt!86333)))))

(assert (=> b!55275 (isPrefixOf!0 (_2!2618 lt!85571) (_2!2618 lt!86333))))

(declare-fun lt!86320 () Unit!3797)

(assert (=> b!55275 (= lt!86320 lt!86315)))

(assert (=> b!55275 (= (size!1171 (buf!1531 (_2!2618 lt!86333))) (size!1171 (buf!1531 (_2!2618 lt!85571))))))

(declare-fun lt!86314 () Unit!3797)

(declare-fun Unit!3818 () Unit!3797)

(assert (=> b!55275 (= lt!86314 Unit!3818)))

(assert (=> b!55275 (= (bitIndex!0 (size!1171 (buf!1531 (_2!2618 lt!86333))) (currentByte!3110 (_2!2618 lt!86333)) (currentBit!3105 (_2!2618 lt!86333))) (bvsub (bvadd (bitIndex!0 (size!1171 (buf!1531 (_2!2618 lt!85571))) (currentByte!3110 (_2!2618 lt!85571)) (currentBit!3105 (_2!2618 lt!85571))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!86348 () Unit!3797)

(declare-fun Unit!3819 () Unit!3797)

(assert (=> b!55275 (= lt!86348 Unit!3819)))

(assert (=> b!55275 (= (bitIndex!0 (size!1171 (buf!1531 (_2!2618 lt!86333))) (currentByte!3110 (_2!2618 lt!86333)) (currentBit!3105 (_2!2618 lt!86333))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1171 (buf!1531 (_2!2618 lt!86331))) (currentByte!3110 (_2!2618 lt!86331)) (currentBit!3105 (_2!2618 lt!86331))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!86329 () Unit!3797)

(declare-fun Unit!3820 () Unit!3797)

(assert (=> b!55275 (= lt!86329 Unit!3820)))

(declare-fun lt!86323 () tuple2!5016)

(assert (=> b!55275 (= lt!86323 (reader!0 (_2!2618 lt!85571) (_2!2618 lt!86333)))))

(declare-fun lt!86330 () (_ BitVec 64))

(assert (=> b!55275 (= lt!86330 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!86334 () Unit!3797)

(assert (=> b!55275 (= lt!86334 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2618 lt!85571) (buf!1531 (_2!2618 lt!86333)) lt!86330))))

(assert (=> b!55275 (validate_offset_bits!1 ((_ sign_extend 32) (size!1171 (buf!1531 (_2!2618 lt!86333)))) ((_ sign_extend 32) (currentByte!3110 (_2!2618 lt!85571))) ((_ sign_extend 32) (currentBit!3105 (_2!2618 lt!85571))) lt!86330)))

(declare-fun lt!86332 () Unit!3797)

(assert (=> b!55275 (= lt!86332 lt!86334)))

(declare-fun lt!86324 () tuple2!5016)

(assert (=> b!55275 (= lt!86324 (reader!0 (_2!2618 lt!86331) (_2!2618 lt!86333)))))

(declare-fun lt!86344 () (_ BitVec 64))

(assert (=> b!55275 (= lt!86344 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!86338 () Unit!3797)

(assert (=> b!55275 (= lt!86338 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2618 lt!86331) (buf!1531 (_2!2618 lt!86333)) lt!86344))))

(assert (=> b!55275 (validate_offset_bits!1 ((_ sign_extend 32) (size!1171 (buf!1531 (_2!2618 lt!86333)))) ((_ sign_extend 32) (currentByte!3110 (_2!2618 lt!86331))) ((_ sign_extend 32) (currentBit!3105 (_2!2618 lt!86331))) lt!86344)))

(declare-fun lt!86317 () Unit!3797)

(assert (=> b!55275 (= lt!86317 lt!86338)))

(declare-fun lt!86341 () List!590)

(assert (=> b!55275 (= lt!86341 (byteArrayBitContentToList!0 (_2!2618 lt!86333) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!86336 () List!590)

(assert (=> b!55275 (= lt!86336 (byteArrayBitContentToList!0 (_2!2618 lt!86333) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!86345 () List!590)

(assert (=> b!55275 (= lt!86345 (bitStreamReadBitsIntoList!0 (_2!2618 lt!86333) (_1!2619 lt!86323) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!86347 () List!590)

(assert (=> b!55275 (= lt!86347 (bitStreamReadBitsIntoList!0 (_2!2618 lt!86333) (_1!2619 lt!86324) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!86327 () (_ BitVec 64))

(assert (=> b!55275 (= lt!86327 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!86321 () Unit!3797)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2030 BitStream!2030 BitStream!2030 BitStream!2030 (_ BitVec 64) List!590) Unit!3797)

(assert (=> b!55275 (= lt!86321 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2618 lt!86333) (_2!2618 lt!86333) (_1!2619 lt!86323) (_1!2619 lt!86324) lt!86327 lt!86345))))

(declare-fun tail!263 (List!590) List!590)

(assert (=> b!55275 (= (bitStreamReadBitsIntoList!0 (_2!2618 lt!86333) (_1!2619 lt!86324) (bvsub lt!86327 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!263 lt!86345))))

(declare-fun lt!86313 () Unit!3797)

(assert (=> b!55275 (= lt!86313 lt!86321)))

(declare-fun lt!86356 () Unit!3797)

(declare-fun lt!86352 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2570 array!2570 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3797)

(assert (=> b!55275 (= lt!86356 (arrayBitRangesEqImpliesEq!0 (buf!1531 (_2!2618 lt!86331)) (buf!1531 (_2!2618 lt!86333)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!86352 (bitIndex!0 (size!1171 (buf!1531 (_2!2618 lt!86331))) (currentByte!3110 (_2!2618 lt!86331)) (currentBit!3105 (_2!2618 lt!86331)))))))

(declare-fun bitAt!0 (array!2570 (_ BitVec 64)) Bool)

(assert (=> b!55275 (= (bitAt!0 (buf!1531 (_2!2618 lt!86331)) lt!86352) (bitAt!0 (buf!1531 (_2!2618 lt!86333)) lt!86352))))

(declare-fun lt!86340 () Unit!3797)

(assert (=> b!55275 (= lt!86340 lt!86356)))

(declare-fun d!17584 () Bool)

(assert (=> d!17584 e!36825))

(declare-fun res!46054 () Bool)

(assert (=> d!17584 (=> (not res!46054) (not e!36825))))

(declare-fun lt!86326 () (_ BitVec 64))

(assert (=> d!17584 (= res!46054 (= (bitIndex!0 (size!1171 (buf!1531 (_2!2618 lt!86346))) (currentByte!3110 (_2!2618 lt!86346)) (currentBit!3105 (_2!2618 lt!86346))) (bvsub lt!86326 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!17584 (or (= (bvand lt!86326 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!86326 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!86326 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!86353 () (_ BitVec 64))

(assert (=> d!17584 (= lt!86326 (bvadd lt!86353 to!314))))

(assert (=> d!17584 (or (not (= (bvand lt!86353 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!86353 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!86353 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17584 (= lt!86353 (bitIndex!0 (size!1171 (buf!1531 (_2!2618 lt!85571))) (currentByte!3110 (_2!2618 lt!85571)) (currentBit!3105 (_2!2618 lt!85571))))))

(assert (=> d!17584 (= lt!86346 e!36826)))

(declare-fun c!3948 () Bool)

(assert (=> d!17584 (= c!3948 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!86335 () Unit!3797)

(declare-fun lt!86337 () Unit!3797)

(assert (=> d!17584 (= lt!86335 lt!86337)))

(assert (=> d!17584 (isPrefixOf!0 (_2!2618 lt!85571) (_2!2618 lt!85571))))

(assert (=> d!17584 (= lt!86337 (lemmaIsPrefixRefl!0 (_2!2618 lt!85571)))))

(assert (=> d!17584 (= lt!86352 (bitIndex!0 (size!1171 (buf!1531 (_2!2618 lt!85571))) (currentByte!3110 (_2!2618 lt!85571)) (currentBit!3105 (_2!2618 lt!85571))))))

(assert (=> d!17584 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17584 (= (appendBitsMSBFirstLoop!0 (_2!2618 lt!85571) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!86346)))

(declare-fun b!55276 () Bool)

(declare-fun res!46053 () Bool)

(assert (=> b!55276 (=> (not res!46053) (not e!36825))))

(assert (=> b!55276 (= res!46053 (invariant!0 (currentBit!3105 (_2!2618 lt!86346)) (currentByte!3110 (_2!2618 lt!86346)) (size!1171 (buf!1531 (_2!2618 lt!86346)))))))

(declare-fun b!55277 () Bool)

(declare-fun res!46051 () Bool)

(assert (=> b!55277 (=> (not res!46051) (not e!36825))))

(assert (=> b!55277 (= res!46051 (isPrefixOf!0 (_2!2618 lt!85571) (_2!2618 lt!86346)))))

(declare-fun b!55278 () Bool)

(declare-fun lt!86318 () tuple2!5016)

(assert (=> b!55278 (= e!36825 (= (bitStreamReadBitsIntoList!0 (_2!2618 lt!86346) (_1!2619 lt!86318) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2618 lt!86346) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!55278 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!55278 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!86354 () Unit!3797)

(declare-fun lt!86339 () Unit!3797)

(assert (=> b!55278 (= lt!86354 lt!86339)))

(assert (=> b!55278 (validate_offset_bits!1 ((_ sign_extend 32) (size!1171 (buf!1531 (_2!2618 lt!86346)))) ((_ sign_extend 32) (currentByte!3110 (_2!2618 lt!85571))) ((_ sign_extend 32) (currentBit!3105 (_2!2618 lt!85571))) lt!86325)))

(assert (=> b!55278 (= lt!86339 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2618 lt!85571) (buf!1531 (_2!2618 lt!86346)) lt!86325))))

(assert (=> b!55278 e!36824))

(declare-fun res!46050 () Bool)

(assert (=> b!55278 (=> (not res!46050) (not e!36824))))

(assert (=> b!55278 (= res!46050 (and (= (size!1171 (buf!1531 (_2!2618 lt!85571))) (size!1171 (buf!1531 (_2!2618 lt!86346)))) (bvsge lt!86325 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!55278 (= lt!86325 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!55278 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!55278 (= lt!86318 (reader!0 (_2!2618 lt!85571) (_2!2618 lt!86346)))))

(declare-fun b!55279 () Bool)

(declare-fun res!46049 () Bool)

(assert (=> b!55279 (=> (not res!46049) (not e!36825))))

(assert (=> b!55279 (= res!46049 (= (size!1171 (buf!1531 (_2!2618 lt!86346))) (size!1171 (buf!1531 (_2!2618 lt!85571)))))))

(declare-fun bm!706 () Bool)

(assert (=> bm!706 (= call!709 (reader!0 (_2!2618 lt!85571) (ite c!3948 (_2!2618 lt!86331) (_2!2618 lt!85571))))))

(declare-fun b!55280 () Bool)

(declare-fun Unit!3821 () Unit!3797)

(assert (=> b!55280 (= e!36826 (tuple2!5015 Unit!3821 (_2!2618 lt!85571)))))

(assert (=> b!55280 (= (size!1171 (buf!1531 (_2!2618 lt!85571))) (size!1171 (buf!1531 (_2!2618 lt!85571))))))

(declare-fun lt!86319 () Unit!3797)

(declare-fun Unit!3822 () Unit!3797)

(assert (=> b!55280 (= lt!86319 Unit!3822)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2030 array!2570 array!2570 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!55280 (checkByteArrayBitContent!0 (_2!2618 lt!85571) srcBuffer!2 (_1!2624 (readBits!0 (_1!2619 call!709) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (= (and d!17584 c!3948) b!55275))

(assert (= (and d!17584 (not c!3948)) b!55280))

(assert (= (or b!55275 b!55280) bm!706))

(assert (= (and d!17584 res!46054) b!55276))

(assert (= (and b!55276 res!46053) b!55273))

(assert (= (and b!55273 res!46052) b!55277))

(assert (= (and b!55277 res!46051) b!55279))

(assert (= (and b!55279 res!46049) b!55278))

(assert (= (and b!55278 res!46050) b!55274))

(declare-fun m!87009 () Bool)

(assert (=> b!55274 m!87009))

(declare-fun m!87011 () Bool)

(assert (=> b!55275 m!87011))

(declare-fun m!87013 () Bool)

(assert (=> b!55275 m!87013))

(declare-fun m!87015 () Bool)

(assert (=> b!55275 m!87015))

(declare-fun m!87017 () Bool)

(assert (=> b!55275 m!87017))

(declare-fun m!87019 () Bool)

(assert (=> b!55275 m!87019))

(declare-fun m!87021 () Bool)

(assert (=> b!55275 m!87021))

(declare-fun m!87023 () Bool)

(assert (=> b!55275 m!87023))

(assert (=> b!55275 m!87017))

(declare-fun m!87025 () Bool)

(assert (=> b!55275 m!87025))

(declare-fun m!87027 () Bool)

(assert (=> b!55275 m!87027))

(declare-fun m!87029 () Bool)

(assert (=> b!55275 m!87029))

(declare-fun m!87031 () Bool)

(assert (=> b!55275 m!87031))

(declare-fun m!87033 () Bool)

(assert (=> b!55275 m!87033))

(declare-fun m!87035 () Bool)

(assert (=> b!55275 m!87035))

(assert (=> b!55275 m!87027))

(declare-fun m!87037 () Bool)

(assert (=> b!55275 m!87037))

(declare-fun m!87039 () Bool)

(assert (=> b!55275 m!87039))

(declare-fun m!87041 () Bool)

(assert (=> b!55275 m!87041))

(declare-fun m!87043 () Bool)

(assert (=> b!55275 m!87043))

(assert (=> b!55275 m!87025))

(declare-fun m!87045 () Bool)

(assert (=> b!55275 m!87045))

(assert (=> b!55275 m!87033))

(declare-fun m!87047 () Bool)

(assert (=> b!55275 m!87047))

(declare-fun m!87049 () Bool)

(assert (=> b!55275 m!87049))

(declare-fun m!87051 () Bool)

(assert (=> b!55275 m!87051))

(declare-fun m!87053 () Bool)

(assert (=> b!55275 m!87053))

(declare-fun m!87055 () Bool)

(assert (=> b!55275 m!87055))

(declare-fun m!87057 () Bool)

(assert (=> b!55275 m!87057))

(declare-fun m!87059 () Bool)

(assert (=> b!55275 m!87059))

(declare-fun m!87061 () Bool)

(assert (=> b!55275 m!87061))

(declare-fun m!87063 () Bool)

(assert (=> b!55275 m!87063))

(assert (=> b!55275 m!86663))

(declare-fun m!87065 () Bool)

(assert (=> b!55275 m!87065))

(declare-fun m!87067 () Bool)

(assert (=> b!55275 m!87067))

(declare-fun m!87069 () Bool)

(assert (=> b!55275 m!87069))

(declare-fun m!87071 () Bool)

(assert (=> b!55275 m!87071))

(declare-fun m!87073 () Bool)

(assert (=> bm!706 m!87073))

(declare-fun m!87075 () Bool)

(assert (=> b!55277 m!87075))

(declare-fun m!87077 () Bool)

(assert (=> b!55276 m!87077))

(declare-fun m!87079 () Bool)

(assert (=> b!55280 m!87079))

(declare-fun m!87081 () Bool)

(assert (=> b!55280 m!87081))

(declare-fun m!87083 () Bool)

(assert (=> d!17584 m!87083))

(assert (=> d!17584 m!86663))

(assert (=> d!17584 m!86747))

(assert (=> d!17584 m!86755))

(declare-fun m!87085 () Bool)

(assert (=> b!55278 m!87085))

(declare-fun m!87087 () Bool)

(assert (=> b!55278 m!87087))

(declare-fun m!87089 () Bool)

(assert (=> b!55278 m!87089))

(declare-fun m!87091 () Bool)

(assert (=> b!55278 m!87091))

(declare-fun m!87093 () Bool)

(assert (=> b!55278 m!87093))

(assert (=> b!54979 d!17584))

(declare-fun d!17632 () Bool)

(assert (=> d!17632 (isPrefixOf!0 thiss!1379 (_2!2618 lt!85575))))

(declare-fun lt!86371 () Unit!3797)

(declare-fun choose!30 (BitStream!2030 BitStream!2030 BitStream!2030) Unit!3797)

(assert (=> d!17632 (= lt!86371 (choose!30 thiss!1379 (_2!2618 lt!85571) (_2!2618 lt!85575)))))

(assert (=> d!17632 (isPrefixOf!0 thiss!1379 (_2!2618 lt!85571))))

(assert (=> d!17632 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2618 lt!85571) (_2!2618 lt!85575)) lt!86371)))

(declare-fun bs!4432 () Bool)

(assert (= bs!4432 d!17632))

(assert (=> bs!4432 m!86569))

(declare-fun m!87121 () Bool)

(assert (=> bs!4432 m!87121))

(assert (=> bs!4432 m!86561))

(assert (=> b!54979 d!17632))

(declare-fun d!17636 () Bool)

(assert (=> d!17636 (= (head!409 (byteArrayBitContentToList!0 (_2!2618 lt!85571) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!705 (byteArrayBitContentToList!0 (_2!2618 lt!85571) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!54973 d!17636))

(declare-fun d!17638 () Bool)

(declare-fun c!3951 () Bool)

(assert (=> d!17638 (= c!3951 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!36833 () List!590)

(assert (=> d!17638 (= (byteArrayBitContentToList!0 (_2!2618 lt!85571) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!36833)))

(declare-fun b!55293 () Bool)

(assert (=> b!55293 (= e!36833 Nil!587)))

(declare-fun b!55294 () Bool)

(assert (=> b!55294 (= e!36833 (Cons!586 (not (= (bvand ((_ sign_extend 24) (select (arr!1714 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2618 lt!85571) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!17638 c!3951) b!55293))

(assert (= (and d!17638 (not c!3951)) b!55294))

(assert (=> b!55294 m!86559))

(assert (=> b!55294 m!86713))

(declare-fun m!87123 () Bool)

(assert (=> b!55294 m!87123))

(assert (=> b!54973 d!17638))

(declare-fun d!17640 () Bool)

(assert (=> d!17640 (= (head!409 (bitStreamReadBitsIntoList!0 (_2!2618 lt!85571) (_1!2619 lt!85573) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!705 (bitStreamReadBitsIntoList!0 (_2!2618 lt!85571) (_1!2619 lt!85573) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!54973 d!17640))

(declare-fun d!17642 () Bool)

(declare-fun e!36838 () Bool)

(assert (=> d!17642 e!36838))

(declare-fun c!3956 () Bool)

(assert (=> d!17642 (= c!3956 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!86378 () List!590)

(declare-datatypes ((tuple2!5038 0))(
  ( (tuple2!5039 (_1!2630 List!590) (_2!2630 BitStream!2030)) )
))
(declare-fun e!36839 () tuple2!5038)

(assert (=> d!17642 (= lt!86378 (_1!2630 e!36839))))

(declare-fun c!3957 () Bool)

(assert (=> d!17642 (= c!3957 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17642 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17642 (= (bitStreamReadBitsIntoList!0 (_2!2618 lt!85571) (_1!2619 lt!85573) #b0000000000000000000000000000000000000000000000000000000000000001) lt!86378)))

(declare-fun b!55305 () Bool)

(declare-fun isEmpty!161 (List!590) Bool)

(assert (=> b!55305 (= e!36838 (isEmpty!161 lt!86378))))

(declare-fun b!55304 () Bool)

(declare-datatypes ((tuple2!5040 0))(
  ( (tuple2!5041 (_1!2631 Bool) (_2!2631 BitStream!2030)) )
))
(declare-fun lt!86379 () tuple2!5040)

(declare-fun lt!86380 () (_ BitVec 64))

(assert (=> b!55304 (= e!36839 (tuple2!5039 (Cons!586 (_1!2631 lt!86379) (bitStreamReadBitsIntoList!0 (_2!2618 lt!85571) (_2!2631 lt!86379) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!86380))) (_2!2631 lt!86379)))))

(declare-fun readBit!0 (BitStream!2030) tuple2!5040)

(assert (=> b!55304 (= lt!86379 (readBit!0 (_1!2619 lt!85573)))))

(assert (=> b!55304 (= lt!86380 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!55306 () Bool)

(declare-fun length!275 (List!590) Int)

(assert (=> b!55306 (= e!36838 (> (length!275 lt!86378) 0))))

(declare-fun b!55303 () Bool)

(assert (=> b!55303 (= e!36839 (tuple2!5039 Nil!587 (_1!2619 lt!85573)))))

(assert (= (and d!17642 c!3957) b!55303))

(assert (= (and d!17642 (not c!3957)) b!55304))

(assert (= (and d!17642 c!3956) b!55305))

(assert (= (and d!17642 (not c!3956)) b!55306))

(declare-fun m!87125 () Bool)

(assert (=> b!55305 m!87125))

(declare-fun m!87127 () Bool)

(assert (=> b!55304 m!87127))

(declare-fun m!87129 () Bool)

(assert (=> b!55304 m!87129))

(declare-fun m!87131 () Bool)

(assert (=> b!55306 m!87131))

(assert (=> b!54973 d!17642))

(declare-fun d!17644 () Bool)

(assert (=> d!17644 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1171 (buf!1531 thiss!1379))) ((_ sign_extend 32) (currentByte!3110 thiss!1379)) ((_ sign_extend 32) (currentBit!3105 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1171 (buf!1531 thiss!1379))) ((_ sign_extend 32) (currentByte!3110 thiss!1379)) ((_ sign_extend 32) (currentBit!3105 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4433 () Bool)

(assert (= bs!4433 d!17644))

(assert (=> bs!4433 m!86733))

(assert (=> b!54978 d!17644))

(push 1)

(assert (not b!55087))

(assert (not b!55305))

(assert (not b!55040))

(assert (not b!55116))

(assert (not b!55278))

(assert (not b!55091))

(assert (not b!55113))

(assert (not b!55275))

(assert (not b!55100))

(assert (not d!17584))

(assert (not b!55085))

(assert (not b!55042))

(assert (not d!17632))

(assert (not b!55115))

(assert (not b!55306))

(assert (not d!17552))

(assert (not b!55081))

(assert (not b!55276))

(assert (not b!55277))

(assert (not d!17556))

(assert (not d!17570))

(assert (not b!55045))

(assert (not b!55280))

(assert (not d!17644))

(assert (not b!55112))

(assert (not b!55084))

(assert (not d!17578))

(assert (not d!17576))

(assert (not b!55098))

(assert (not b!55114))

(assert (not b!55294))

(assert (not d!17558))

(assert (not b!55118))

(assert (not b!55304))

(assert (not bm!706))

(assert (not b!55088))

(assert (not d!17568))

(assert (not b!55086))

(assert (not b!55274))

(assert (not d!17560))

(assert (not b!55089))

(assert (not b!55082))

(assert (not d!17582))

(assert (not b!55083))

(check-sat)

(pop 1)

(push 1)

(check-sat)

