; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7932 () Bool)

(assert start!7932)

(declare-fun b!39401 () Bool)

(declare-fun e!25949 () Bool)

(assert (=> b!39401 (= e!25949 true)))

(declare-datatypes ((array!1983 0))(
  ( (array!1984 (arr!1390 (Array (_ BitVec 32) (_ BitVec 8))) (size!894 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1538 0))(
  ( (BitStream!1539 (buf!1222 array!1983) (currentByte!2634 (_ BitVec 32)) (currentBit!2629 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3808 0))(
  ( (tuple2!3809 (_1!1991 BitStream!1538) (_2!1991 Bool)) )
))
(declare-fun lt!59829 () tuple2!3808)

(declare-datatypes ((tuple2!3810 0))(
  ( (tuple2!3811 (_1!1992 BitStream!1538) (_2!1992 BitStream!1538)) )
))
(declare-fun lt!59812 () tuple2!3810)

(declare-fun readBitPure!0 (BitStream!1538) tuple2!3808)

(assert (=> b!39401 (= lt!59829 (readBitPure!0 (_1!1992 lt!59812)))))

(declare-fun b!39402 () Bool)

(declare-fun res!33514 () Bool)

(declare-fun e!25951 () Bool)

(assert (=> b!39402 (=> res!33514 e!25951)))

(declare-datatypes ((Unit!2809 0))(
  ( (Unit!2810) )
))
(declare-datatypes ((tuple2!3812 0))(
  ( (tuple2!3813 (_1!1993 Unit!2809) (_2!1993 BitStream!1538)) )
))
(declare-fun lt!59815 () tuple2!3812)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!39402 (= res!33514 (not (invariant!0 (currentBit!2629 (_2!1993 lt!59815)) (currentByte!2634 (_2!1993 lt!59815)) (size!894 (buf!1222 (_2!1993 lt!59815))))))))

(declare-fun b!39403 () Bool)

(declare-fun res!33527 () Bool)

(declare-fun e!25954 () Bool)

(assert (=> b!39403 (=> res!33527 e!25954)))

(declare-datatypes ((List!470 0))(
  ( (Nil!467) (Cons!466 (h!585 Bool) (t!1220 List!470)) )
))
(declare-fun lt!59819 () List!470)

(declare-fun lt!59813 () Bool)

(declare-fun head!307 (List!470) Bool)

(assert (=> b!39403 (= res!33527 (not (= (head!307 lt!59819) lt!59813)))))

(declare-fun b!39404 () Bool)

(declare-fun e!25962 () Bool)

(declare-fun e!25959 () Bool)

(assert (=> b!39404 (= e!25962 e!25959)))

(declare-fun res!33509 () Bool)

(assert (=> b!39404 (=> res!33509 e!25959)))

(declare-fun lt!59834 () Bool)

(declare-fun lt!59833 () Bool)

(assert (=> b!39404 (= res!33509 (not (= lt!59834 lt!59833)))))

(declare-fun lt!59827 () tuple2!3812)

(declare-fun lt!59822 () (_ BitVec 64))

(declare-fun bitAt!0 (array!1983 (_ BitVec 64)) Bool)

(assert (=> b!39404 (= lt!59834 (bitAt!0 (buf!1222 (_2!1993 lt!59827)) lt!59822))))

(declare-fun b!39405 () Bool)

(declare-fun e!25957 () Bool)

(declare-fun e!25960 () Bool)

(assert (=> b!39405 (= e!25957 e!25960)))

(declare-fun res!33522 () Bool)

(assert (=> b!39405 (=> res!33522 e!25960)))

(declare-fun lt!59818 () List!470)

(declare-fun lt!59831 () List!470)

(assert (=> b!39405 (= res!33522 (not (= lt!59818 lt!59831)))))

(assert (=> b!39405 (= lt!59831 lt!59818)))

(declare-fun tail!187 (List!470) List!470)

(assert (=> b!39405 (= lt!59818 (tail!187 lt!59819))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!59817 () Unit!2809)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!59823 () tuple2!3810)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1538 BitStream!1538 BitStream!1538 BitStream!1538 (_ BitVec 64) List!470) Unit!2809)

(assert (=> b!39405 (= lt!59817 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1993 lt!59815) (_2!1993 lt!59815) (_1!1992 lt!59812) (_1!1992 lt!59823) (bvsub to!314 i!635) lt!59819))))

(declare-fun b!39406 () Bool)

(declare-fun e!25958 () Bool)

(assert (=> b!39406 (= e!25958 e!25951)))

(declare-fun res!33511 () Bool)

(assert (=> b!39406 (=> res!33511 e!25951)))

(declare-fun lt!59828 () (_ BitVec 64))

(assert (=> b!39406 (= res!33511 (not (= lt!59828 (bvsub (bvadd lt!59822 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!39406 (= lt!59828 (bitIndex!0 (size!894 (buf!1222 (_2!1993 lt!59815))) (currentByte!2634 (_2!1993 lt!59815)) (currentBit!2629 (_2!1993 lt!59815))))))

(declare-fun b!39407 () Bool)

(declare-fun e!25963 () Bool)

(assert (=> b!39407 (= e!25963 e!25957)))

(declare-fun res!33523 () Bool)

(assert (=> b!39407 (=> res!33523 e!25957)))

(assert (=> b!39407 (= res!33523 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!59816 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1538 BitStream!1538 (_ BitVec 64)) List!470)

(assert (=> b!39407 (= lt!59831 (bitStreamReadBitsIntoList!0 (_2!1993 lt!59815) (_1!1992 lt!59823) lt!59816))))

(assert (=> b!39407 (= lt!59819 (bitStreamReadBitsIntoList!0 (_2!1993 lt!59815) (_1!1992 lt!59812) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!39407 (validate_offset_bits!1 ((_ sign_extend 32) (size!894 (buf!1222 (_2!1993 lt!59815)))) ((_ sign_extend 32) (currentByte!2634 (_2!1993 lt!59827))) ((_ sign_extend 32) (currentBit!2629 (_2!1993 lt!59827))) lt!59816)))

(declare-fun lt!59835 () Unit!2809)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1538 array!1983 (_ BitVec 64)) Unit!2809)

(assert (=> b!39407 (= lt!59835 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1993 lt!59827) (buf!1222 (_2!1993 lt!59815)) lt!59816))))

(declare-fun reader!0 (BitStream!1538 BitStream!1538) tuple2!3810)

(assert (=> b!39407 (= lt!59823 (reader!0 (_2!1993 lt!59827) (_2!1993 lt!59815)))))

(declare-fun thiss!1379 () BitStream!1538)

(assert (=> b!39407 (validate_offset_bits!1 ((_ sign_extend 32) (size!894 (buf!1222 (_2!1993 lt!59815)))) ((_ sign_extend 32) (currentByte!2634 thiss!1379)) ((_ sign_extend 32) (currentBit!2629 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!59832 () Unit!2809)

(assert (=> b!39407 (= lt!59832 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1222 (_2!1993 lt!59815)) (bvsub to!314 i!635)))))

(assert (=> b!39407 (= lt!59812 (reader!0 thiss!1379 (_2!1993 lt!59815)))))

(declare-fun res!33524 () Bool)

(declare-fun e!25952 () Bool)

(assert (=> start!7932 (=> (not res!33524) (not e!25952))))

(declare-fun srcBuffer!2 () array!1983)

(assert (=> start!7932 (= res!33524 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!894 srcBuffer!2))))))))

(assert (=> start!7932 e!25952))

(assert (=> start!7932 true))

(declare-fun array_inv!822 (array!1983) Bool)

(assert (=> start!7932 (array_inv!822 srcBuffer!2)))

(declare-fun e!25953 () Bool)

(declare-fun inv!12 (BitStream!1538) Bool)

(assert (=> start!7932 (and (inv!12 thiss!1379) e!25953)))

(declare-fun b!39408 () Bool)

(declare-fun res!33520 () Bool)

(assert (=> b!39408 (=> (not res!33520) (not e!25952))))

(assert (=> b!39408 (= res!33520 (validate_offset_bits!1 ((_ sign_extend 32) (size!894 (buf!1222 thiss!1379))) ((_ sign_extend 32) (currentByte!2634 thiss!1379)) ((_ sign_extend 32) (currentBit!2629 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!39409 () Bool)

(assert (=> b!39409 (= e!25953 (array_inv!822 (buf!1222 thiss!1379)))))

(declare-fun b!39410 () Bool)

(declare-fun res!33519 () Bool)

(assert (=> b!39410 (=> res!33519 e!25963)))

(assert (=> b!39410 (= res!33519 (not (invariant!0 (currentBit!2629 (_2!1993 lt!59827)) (currentByte!2634 (_2!1993 lt!59827)) (size!894 (buf!1222 (_2!1993 lt!59815))))))))

(declare-fun b!39411 () Bool)

(declare-fun e!25955 () Bool)

(assert (=> b!39411 (= e!25952 (not e!25955))))

(declare-fun res!33525 () Bool)

(assert (=> b!39411 (=> res!33525 e!25955)))

(assert (=> b!39411 (= res!33525 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1538 BitStream!1538) Bool)

(assert (=> b!39411 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!59824 () Unit!2809)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1538) Unit!2809)

(assert (=> b!39411 (= lt!59824 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!39411 (= lt!59822 (bitIndex!0 (size!894 (buf!1222 thiss!1379)) (currentByte!2634 thiss!1379) (currentBit!2629 thiss!1379)))))

(declare-fun b!39412 () Bool)

(assert (=> b!39412 (= e!25954 e!25962)))

(declare-fun res!33512 () Bool)

(assert (=> b!39412 (=> res!33512 e!25962)))

(declare-fun byteArrayBitContentToList!0 (BitStream!1538 array!1983 (_ BitVec 64) (_ BitVec 64)) List!470)

(assert (=> b!39412 (= res!33512 (not (= (head!307 (byteArrayBitContentToList!0 (_2!1993 lt!59815) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!59833)))))

(assert (=> b!39412 (= lt!59833 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!39413 () Bool)

(declare-fun res!33510 () Bool)

(assert (=> b!39413 (=> res!33510 e!25963)))

(assert (=> b!39413 (= res!33510 (not (invariant!0 (currentBit!2629 (_2!1993 lt!59827)) (currentByte!2634 (_2!1993 lt!59827)) (size!894 (buf!1222 (_2!1993 lt!59827))))))))

(declare-fun b!39414 () Bool)

(declare-fun res!33516 () Bool)

(assert (=> b!39414 (=> res!33516 e!25951)))

(assert (=> b!39414 (= res!33516 (not (= (size!894 (buf!1222 thiss!1379)) (size!894 (buf!1222 (_2!1993 lt!59815))))))))

(declare-fun b!39415 () Bool)

(assert (=> b!39415 (= e!25960 e!25954)))

(declare-fun res!33515 () Bool)

(assert (=> b!39415 (=> res!33515 e!25954)))

(assert (=> b!39415 (= res!33515 (not (= lt!59813 (bitAt!0 (buf!1222 (_1!1992 lt!59823)) lt!59822))))))

(assert (=> b!39415 (= lt!59813 (bitAt!0 (buf!1222 (_1!1992 lt!59812)) lt!59822))))

(declare-fun b!39416 () Bool)

(declare-fun res!33528 () Bool)

(assert (=> b!39416 (=> res!33528 e!25957)))

(declare-fun length!196 (List!470) Int)

(assert (=> b!39416 (= res!33528 (<= (length!196 lt!59819) 0))))

(declare-fun b!39417 () Bool)

(assert (=> b!39417 (= e!25951 e!25963)))

(declare-fun res!33513 () Bool)

(assert (=> b!39417 (=> res!33513 e!25963)))

(assert (=> b!39417 (= res!33513 (not (= (size!894 (buf!1222 (_2!1993 lt!59827))) (size!894 (buf!1222 (_2!1993 lt!59815))))))))

(declare-fun lt!59825 () (_ BitVec 64))

(assert (=> b!39417 (= lt!59828 (bvsub (bvsub (bvadd lt!59825 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!39417 (= lt!59825 (bitIndex!0 (size!894 (buf!1222 (_2!1993 lt!59827))) (currentByte!2634 (_2!1993 lt!59827)) (currentBit!2629 (_2!1993 lt!59827))))))

(assert (=> b!39417 (= (size!894 (buf!1222 (_2!1993 lt!59815))) (size!894 (buf!1222 thiss!1379)))))

(declare-fun b!39418 () Bool)

(declare-fun e!25956 () Bool)

(assert (=> b!39418 (= e!25955 e!25956)))

(declare-fun res!33518 () Bool)

(assert (=> b!39418 (=> res!33518 e!25956)))

(assert (=> b!39418 (= res!33518 (not (isPrefixOf!0 thiss!1379 (_2!1993 lt!59827))))))

(assert (=> b!39418 (validate_offset_bits!1 ((_ sign_extend 32) (size!894 (buf!1222 (_2!1993 lt!59827)))) ((_ sign_extend 32) (currentByte!2634 (_2!1993 lt!59827))) ((_ sign_extend 32) (currentBit!2629 (_2!1993 lt!59827))) lt!59816)))

(assert (=> b!39418 (= lt!59816 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!59821 () Unit!2809)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1538 BitStream!1538 (_ BitVec 64) (_ BitVec 64)) Unit!2809)

(assert (=> b!39418 (= lt!59821 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1993 lt!59827) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1538 (_ BitVec 8) (_ BitVec 32)) tuple2!3812)

(assert (=> b!39418 (= lt!59827 (appendBitFromByte!0 thiss!1379 (select (arr!1390 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!39419 () Bool)

(assert (=> b!39419 (= e!25959 e!25949)))

(declare-fun res!33517 () Bool)

(assert (=> b!39419 (=> res!33517 e!25949)))

(declare-fun lt!59820 () Bool)

(assert (=> b!39419 (= res!33517 (not (= lt!59820 lt!59833)))))

(assert (=> b!39419 (= lt!59834 lt!59820)))

(assert (=> b!39419 (= lt!59820 (bitAt!0 (buf!1222 (_2!1993 lt!59815)) lt!59822))))

(declare-fun lt!59814 () Unit!2809)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1983 array!1983 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2809)

(assert (=> b!39419 (= lt!59814 (arrayBitRangesEqImpliesEq!0 (buf!1222 (_2!1993 lt!59827)) (buf!1222 (_2!1993 lt!59815)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!59822 lt!59825))))

(declare-fun e!25950 () Bool)

(declare-fun b!39420 () Bool)

(declare-fun lt!59836 () tuple2!3810)

(assert (=> b!39420 (= e!25950 (= (head!307 (byteArrayBitContentToList!0 (_2!1993 lt!59827) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!307 (bitStreamReadBitsIntoList!0 (_2!1993 lt!59827) (_1!1992 lt!59836) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!39421 () Bool)

(assert (=> b!39421 (= e!25956 e!25958)))

(declare-fun res!33521 () Bool)

(assert (=> b!39421 (=> res!33521 e!25958)))

(assert (=> b!39421 (= res!33521 (not (isPrefixOf!0 (_2!1993 lt!59827) (_2!1993 lt!59815))))))

(assert (=> b!39421 (isPrefixOf!0 thiss!1379 (_2!1993 lt!59815))))

(declare-fun lt!59826 () Unit!2809)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1538 BitStream!1538 BitStream!1538) Unit!2809)

(assert (=> b!39421 (= lt!59826 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1993 lt!59827) (_2!1993 lt!59815)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1538 array!1983 (_ BitVec 64) (_ BitVec 64)) tuple2!3812)

(assert (=> b!39421 (= lt!59815 (appendBitsMSBFirstLoop!0 (_2!1993 lt!59827) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!39421 e!25950))

(declare-fun res!33526 () Bool)

(assert (=> b!39421 (=> (not res!33526) (not e!25950))))

(assert (=> b!39421 (= res!33526 (validate_offset_bits!1 ((_ sign_extend 32) (size!894 (buf!1222 (_2!1993 lt!59827)))) ((_ sign_extend 32) (currentByte!2634 thiss!1379)) ((_ sign_extend 32) (currentBit!2629 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!59830 () Unit!2809)

(assert (=> b!39421 (= lt!59830 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1222 (_2!1993 lt!59827)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!39421 (= lt!59836 (reader!0 thiss!1379 (_2!1993 lt!59827)))))

(assert (= (and start!7932 res!33524) b!39408))

(assert (= (and b!39408 res!33520) b!39411))

(assert (= (and b!39411 (not res!33525)) b!39418))

(assert (= (and b!39418 (not res!33518)) b!39421))

(assert (= (and b!39421 res!33526) b!39420))

(assert (= (and b!39421 (not res!33521)) b!39406))

(assert (= (and b!39406 (not res!33511)) b!39402))

(assert (= (and b!39402 (not res!33514)) b!39414))

(assert (= (and b!39414 (not res!33516)) b!39417))

(assert (= (and b!39417 (not res!33513)) b!39413))

(assert (= (and b!39413 (not res!33510)) b!39410))

(assert (= (and b!39410 (not res!33519)) b!39407))

(assert (= (and b!39407 (not res!33523)) b!39416))

(assert (= (and b!39416 (not res!33528)) b!39405))

(assert (= (and b!39405 (not res!33522)) b!39415))

(assert (= (and b!39415 (not res!33515)) b!39403))

(assert (= (and b!39403 (not res!33527)) b!39412))

(assert (= (and b!39412 (not res!33512)) b!39404))

(assert (= (and b!39404 (not res!33509)) b!39419))

(assert (= (and b!39419 (not res!33517)) b!39401))

(assert (= start!7932 b!39409))

(declare-fun m!60067 () Bool)

(assert (=> b!39404 m!60067))

(declare-fun m!60069 () Bool)

(assert (=> b!39412 m!60069))

(assert (=> b!39412 m!60069))

(declare-fun m!60071 () Bool)

(assert (=> b!39412 m!60071))

(declare-fun m!60073 () Bool)

(assert (=> b!39412 m!60073))

(declare-fun m!60075 () Bool)

(assert (=> b!39406 m!60075))

(declare-fun m!60077 () Bool)

(assert (=> b!39416 m!60077))

(declare-fun m!60079 () Bool)

(assert (=> b!39418 m!60079))

(declare-fun m!60081 () Bool)

(assert (=> b!39418 m!60081))

(declare-fun m!60083 () Bool)

(assert (=> b!39418 m!60083))

(declare-fun m!60085 () Bool)

(assert (=> b!39418 m!60085))

(assert (=> b!39418 m!60081))

(declare-fun m!60087 () Bool)

(assert (=> b!39418 m!60087))

(declare-fun m!60089 () Bool)

(assert (=> b!39408 m!60089))

(declare-fun m!60091 () Bool)

(assert (=> b!39415 m!60091))

(declare-fun m!60093 () Bool)

(assert (=> b!39415 m!60093))

(declare-fun m!60095 () Bool)

(assert (=> b!39413 m!60095))

(declare-fun m!60097 () Bool)

(assert (=> b!39405 m!60097))

(declare-fun m!60099 () Bool)

(assert (=> b!39405 m!60099))

(declare-fun m!60101 () Bool)

(assert (=> b!39419 m!60101))

(declare-fun m!60103 () Bool)

(assert (=> b!39419 m!60103))

(declare-fun m!60105 () Bool)

(assert (=> b!39401 m!60105))

(declare-fun m!60107 () Bool)

(assert (=> b!39417 m!60107))

(declare-fun m!60109 () Bool)

(assert (=> b!39407 m!60109))

(declare-fun m!60111 () Bool)

(assert (=> b!39407 m!60111))

(declare-fun m!60113 () Bool)

(assert (=> b!39407 m!60113))

(declare-fun m!60115 () Bool)

(assert (=> b!39407 m!60115))

(declare-fun m!60117 () Bool)

(assert (=> b!39407 m!60117))

(declare-fun m!60119 () Bool)

(assert (=> b!39407 m!60119))

(declare-fun m!60121 () Bool)

(assert (=> b!39407 m!60121))

(declare-fun m!60123 () Bool)

(assert (=> b!39407 m!60123))

(declare-fun m!60125 () Bool)

(assert (=> b!39421 m!60125))

(declare-fun m!60127 () Bool)

(assert (=> b!39421 m!60127))

(declare-fun m!60129 () Bool)

(assert (=> b!39421 m!60129))

(declare-fun m!60131 () Bool)

(assert (=> b!39421 m!60131))

(declare-fun m!60133 () Bool)

(assert (=> b!39421 m!60133))

(declare-fun m!60135 () Bool)

(assert (=> b!39421 m!60135))

(declare-fun m!60137 () Bool)

(assert (=> b!39421 m!60137))

(declare-fun m!60139 () Bool)

(assert (=> start!7932 m!60139))

(declare-fun m!60141 () Bool)

(assert (=> start!7932 m!60141))

(declare-fun m!60143 () Bool)

(assert (=> b!39403 m!60143))

(declare-fun m!60145 () Bool)

(assert (=> b!39402 m!60145))

(declare-fun m!60147 () Bool)

(assert (=> b!39409 m!60147))

(declare-fun m!60149 () Bool)

(assert (=> b!39420 m!60149))

(assert (=> b!39420 m!60149))

(declare-fun m!60151 () Bool)

(assert (=> b!39420 m!60151))

(declare-fun m!60153 () Bool)

(assert (=> b!39420 m!60153))

(assert (=> b!39420 m!60153))

(declare-fun m!60155 () Bool)

(assert (=> b!39420 m!60155))

(declare-fun m!60157 () Bool)

(assert (=> b!39411 m!60157))

(declare-fun m!60159 () Bool)

(assert (=> b!39411 m!60159))

(declare-fun m!60161 () Bool)

(assert (=> b!39411 m!60161))

(declare-fun m!60163 () Bool)

(assert (=> b!39410 m!60163))

(push 1)

(assert (not b!39412))

(assert (not b!39406))

(assert (not b!39415))

(assert (not b!39409))

(assert (not b!39416))

(assert (not b!39411))

(assert (not b!39405))

(assert (not b!39408))

(assert (not b!39418))

(assert (not start!7932))

(assert (not b!39419))

(assert (not b!39401))

(assert (not b!39420))

(assert (not b!39404))

(assert (not b!39421))

(assert (not b!39403))

(assert (not b!39417))

(assert (not b!39413))

(assert (not b!39410))

(assert (not b!39407))

(assert (not b!39402))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

