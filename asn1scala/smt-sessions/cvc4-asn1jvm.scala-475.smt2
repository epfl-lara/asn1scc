; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14074 () Bool)

(assert start!14074)

(declare-fun res!59729 () Bool)

(declare-fun e!47181 () Bool)

(assert (=> start!14074 (=> (not res!59729) (not e!47181))))

(declare-datatypes ((array!2957 0))(
  ( (array!2958 (arr!1972 (Array (_ BitVec 32) (_ BitVec 8))) (size!1381 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2957)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> start!14074 (= res!59729 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1381 srcBuffer!2))))))))

(assert (=> start!14074 e!47181))

(assert (=> start!14074 true))

(declare-fun array_inv!1230 (array!2957) Bool)

(assert (=> start!14074 (array_inv!1230 srcBuffer!2)))

(declare-datatypes ((BitStream!2342 0))(
  ( (BitStream!2343 (buf!1762 array!2957) (currentByte!3488 (_ BitVec 32)) (currentBit!3483 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2342)

(declare-fun e!47178 () Bool)

(declare-fun inv!12 (BitStream!2342) Bool)

(assert (=> start!14074 (and (inv!12 thiss!1379) e!47178)))

(declare-fun b!72392 () Bool)

(declare-fun res!59743 () Bool)

(declare-fun e!47186 () Bool)

(assert (=> b!72392 (=> res!59743 e!47186)))

(declare-datatypes ((List!746 0))(
  ( (Nil!743) (Cons!742 (h!861 Bool) (t!1496 List!746)) )
))
(declare-fun lt!116839 () List!746)

(declare-fun lt!116842 () Bool)

(declare-fun head!565 (List!746) Bool)

(assert (=> b!72392 (= res!59743 (not (= (head!565 lt!116839) lt!116842)))))

(declare-fun b!72393 () Bool)

(declare-fun e!47182 () Bool)

(assert (=> b!72393 (= e!47182 e!47186)))

(declare-fun res!59748 () Bool)

(assert (=> b!72393 (=> res!59748 e!47186)))

(declare-fun lt!116840 () (_ BitVec 64))

(declare-datatypes ((tuple2!6258 0))(
  ( (tuple2!6259 (_1!3243 BitStream!2342) (_2!3243 BitStream!2342)) )
))
(declare-fun lt!116847 () tuple2!6258)

(declare-fun bitAt!0 (array!2957 (_ BitVec 64)) Bool)

(assert (=> b!72393 (= res!59748 (not (= lt!116842 (bitAt!0 (buf!1762 (_1!3243 lt!116847)) lt!116840))))))

(declare-fun lt!116852 () tuple2!6258)

(assert (=> b!72393 (= lt!116842 (bitAt!0 (buf!1762 (_1!3243 lt!116852)) lt!116840))))

(declare-fun b!72394 () Bool)

(declare-fun e!47179 () Bool)

(declare-fun e!47192 () Bool)

(assert (=> b!72394 (= e!47179 e!47192)))

(declare-fun res!59742 () Bool)

(assert (=> b!72394 (=> res!59742 e!47192)))

(declare-datatypes ((Unit!4815 0))(
  ( (Unit!4816) )
))
(declare-datatypes ((tuple2!6260 0))(
  ( (tuple2!6261 (_1!3244 Unit!4815) (_2!3244 BitStream!2342)) )
))
(declare-fun lt!116843 () tuple2!6260)

(declare-fun isPrefixOf!0 (BitStream!2342 BitStream!2342) Bool)

(assert (=> b!72394 (= res!59742 (not (isPrefixOf!0 thiss!1379 (_2!3244 lt!116843))))))

(declare-fun lt!116856 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!72394 (validate_offset_bits!1 ((_ sign_extend 32) (size!1381 (buf!1762 (_2!3244 lt!116843)))) ((_ sign_extend 32) (currentByte!3488 (_2!3244 lt!116843))) ((_ sign_extend 32) (currentBit!3483 (_2!3244 lt!116843))) lt!116856)))

(assert (=> b!72394 (= lt!116856 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!116850 () Unit!4815)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2342 BitStream!2342 (_ BitVec 64) (_ BitVec 64)) Unit!4815)

(assert (=> b!72394 (= lt!116850 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3244 lt!116843) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2342 (_ BitVec 8) (_ BitVec 32)) tuple2!6260)

(assert (=> b!72394 (= lt!116843 (appendBitFromByte!0 thiss!1379 (select (arr!1972 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!72395 () Bool)

(declare-fun e!47188 () Bool)

(assert (=> b!72395 (= e!47192 e!47188)))

(declare-fun res!59747 () Bool)

(assert (=> b!72395 (=> res!59747 e!47188)))

(declare-fun lt!116861 () tuple2!6260)

(assert (=> b!72395 (= res!59747 (not (isPrefixOf!0 (_2!3244 lt!116843) (_2!3244 lt!116861))))))

(assert (=> b!72395 (isPrefixOf!0 thiss!1379 (_2!3244 lt!116861))))

(declare-fun lt!116845 () Unit!4815)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2342 BitStream!2342 BitStream!2342) Unit!4815)

(assert (=> b!72395 (= lt!116845 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3244 lt!116843) (_2!3244 lt!116861)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2342 array!2957 (_ BitVec 64) (_ BitVec 64)) tuple2!6260)

(assert (=> b!72395 (= lt!116861 (appendBitsMSBFirstLoop!0 (_2!3244 lt!116843) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!47189 () Bool)

(assert (=> b!72395 e!47189))

(declare-fun res!59739 () Bool)

(assert (=> b!72395 (=> (not res!59739) (not e!47189))))

(assert (=> b!72395 (= res!59739 (validate_offset_bits!1 ((_ sign_extend 32) (size!1381 (buf!1762 (_2!3244 lt!116843)))) ((_ sign_extend 32) (currentByte!3488 thiss!1379)) ((_ sign_extend 32) (currentBit!3483 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!116859 () Unit!4815)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2342 array!2957 (_ BitVec 64)) Unit!4815)

(assert (=> b!72395 (= lt!116859 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1762 (_2!3244 lt!116843)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!116863 () tuple2!6258)

(declare-fun reader!0 (BitStream!2342 BitStream!2342) tuple2!6258)

(assert (=> b!72395 (= lt!116863 (reader!0 thiss!1379 (_2!3244 lt!116843)))))

(declare-fun b!72396 () Bool)

(declare-fun res!59735 () Bool)

(assert (=> b!72396 (=> (not res!59735) (not e!47181))))

(assert (=> b!72396 (= res!59735 (validate_offset_bits!1 ((_ sign_extend 32) (size!1381 (buf!1762 thiss!1379))) ((_ sign_extend 32) (currentByte!3488 thiss!1379)) ((_ sign_extend 32) (currentBit!3483 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!72397 () Bool)

(declare-fun res!59738 () Bool)

(declare-fun e!47184 () Bool)

(assert (=> b!72397 (=> res!59738 e!47184)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!72397 (= res!59738 (not (invariant!0 (currentBit!3483 (_2!3244 lt!116843)) (currentByte!3488 (_2!3244 lt!116843)) (size!1381 (buf!1762 (_2!3244 lt!116843))))))))

(declare-fun b!72398 () Bool)

(declare-fun res!59736 () Bool)

(declare-fun e!47180 () Bool)

(assert (=> b!72398 (=> res!59736 e!47180)))

(assert (=> b!72398 (= res!59736 (not (= (size!1381 (buf!1762 thiss!1379)) (size!1381 (buf!1762 (_2!3244 lt!116861))))))))

(declare-fun b!72399 () Bool)

(declare-fun e!47191 () Bool)

(assert (=> b!72399 (= e!47191 true)))

(declare-datatypes ((tuple2!6262 0))(
  ( (tuple2!6263 (_1!3245 BitStream!2342) (_2!3245 Bool)) )
))
(declare-fun lt!116848 () tuple2!6262)

(declare-fun readBitPure!0 (BitStream!2342) tuple2!6262)

(assert (=> b!72399 (= lt!116848 (readBitPure!0 (_1!3243 lt!116852)))))

(declare-fun b!72400 () Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2342 array!2957 (_ BitVec 64) (_ BitVec 64)) List!746)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2342 BitStream!2342 (_ BitVec 64)) List!746)

(assert (=> b!72400 (= e!47189 (= (head!565 (byteArrayBitContentToList!0 (_2!3244 lt!116843) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!565 (bitStreamReadBitsIntoList!0 (_2!3244 lt!116843) (_1!3243 lt!116863) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!72401 () Bool)

(declare-fun e!47183 () Bool)

(assert (=> b!72401 (= e!47183 e!47182)))

(declare-fun res!59737 () Bool)

(assert (=> b!72401 (=> res!59737 e!47182)))

(declare-fun lt!116844 () List!746)

(declare-fun lt!116855 () List!746)

(assert (=> b!72401 (= res!59737 (not (= lt!116844 lt!116855)))))

(assert (=> b!72401 (= lt!116855 lt!116844)))

(declare-fun tail!350 (List!746) List!746)

(assert (=> b!72401 (= lt!116844 (tail!350 lt!116839))))

(declare-fun lt!116858 () Unit!4815)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2342 BitStream!2342 BitStream!2342 BitStream!2342 (_ BitVec 64) List!746) Unit!4815)

(assert (=> b!72401 (= lt!116858 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3244 lt!116861) (_2!3244 lt!116861) (_1!3243 lt!116852) (_1!3243 lt!116847) (bvsub to!314 i!635) lt!116839))))

(declare-fun b!72402 () Bool)

(assert (=> b!72402 (= e!47188 e!47180)))

(declare-fun res!59745 () Bool)

(assert (=> b!72402 (=> res!59745 e!47180)))

(declare-fun lt!116860 () (_ BitVec 64))

(assert (=> b!72402 (= res!59745 (not (= lt!116860 (bvsub (bvadd lt!116840 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!72402 (= lt!116860 (bitIndex!0 (size!1381 (buf!1762 (_2!3244 lt!116861))) (currentByte!3488 (_2!3244 lt!116861)) (currentBit!3483 (_2!3244 lt!116861))))))

(declare-fun b!72403 () Bool)

(declare-fun res!59733 () Bool)

(assert (=> b!72403 (=> res!59733 e!47183)))

(declare-fun length!374 (List!746) Int)

(assert (=> b!72403 (= res!59733 (<= (length!374 lt!116839) 0))))

(declare-fun b!72404 () Bool)

(declare-fun e!47177 () Bool)

(assert (=> b!72404 (= e!47177 e!47191)))

(declare-fun res!59732 () Bool)

(assert (=> b!72404 (=> res!59732 e!47191)))

(declare-fun lt!116846 () Bool)

(declare-fun lt!116841 () Bool)

(assert (=> b!72404 (= res!59732 (not (= lt!116846 lt!116841)))))

(declare-fun lt!116854 () Bool)

(assert (=> b!72404 (= lt!116854 lt!116846)))

(assert (=> b!72404 (= lt!116846 (bitAt!0 (buf!1762 (_2!3244 lt!116861)) lt!116840))))

(declare-fun lt!116857 () Unit!4815)

(declare-fun lt!116862 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2957 array!2957 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4815)

(assert (=> b!72404 (= lt!116857 (arrayBitRangesEqImpliesEq!0 (buf!1762 (_2!3244 lt!116843)) (buf!1762 (_2!3244 lt!116861)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!116840 lt!116862))))

(declare-fun b!72405 () Bool)

(assert (=> b!72405 (= e!47180 e!47184)))

(declare-fun res!59741 () Bool)

(assert (=> b!72405 (=> res!59741 e!47184)))

(assert (=> b!72405 (= res!59741 (not (= (size!1381 (buf!1762 (_2!3244 lt!116843))) (size!1381 (buf!1762 (_2!3244 lt!116861))))))))

(assert (=> b!72405 (= lt!116860 (bvsub (bvsub (bvadd lt!116862 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!72405 (= lt!116862 (bitIndex!0 (size!1381 (buf!1762 (_2!3244 lt!116843))) (currentByte!3488 (_2!3244 lt!116843)) (currentBit!3483 (_2!3244 lt!116843))))))

(assert (=> b!72405 (= (size!1381 (buf!1762 (_2!3244 lt!116861))) (size!1381 (buf!1762 thiss!1379)))))

(declare-fun b!72406 () Bool)

(declare-fun e!47190 () Bool)

(assert (=> b!72406 (= e!47190 e!47177)))

(declare-fun res!59734 () Bool)

(assert (=> b!72406 (=> res!59734 e!47177)))

(assert (=> b!72406 (= res!59734 (not (= lt!116854 lt!116841)))))

(assert (=> b!72406 (= lt!116854 (bitAt!0 (buf!1762 (_2!3244 lt!116843)) lt!116840))))

(declare-fun b!72407 () Bool)

(declare-fun res!59731 () Bool)

(assert (=> b!72407 (=> res!59731 e!47184)))

(assert (=> b!72407 (= res!59731 (not (invariant!0 (currentBit!3483 (_2!3244 lt!116843)) (currentByte!3488 (_2!3244 lt!116843)) (size!1381 (buf!1762 (_2!3244 lt!116861))))))))

(declare-fun b!72408 () Bool)

(assert (=> b!72408 (= e!47186 e!47190)))

(declare-fun res!59746 () Bool)

(assert (=> b!72408 (=> res!59746 e!47190)))

(assert (=> b!72408 (= res!59746 (not (= (head!565 (byteArrayBitContentToList!0 (_2!3244 lt!116861) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!116841)))))

(assert (=> b!72408 (= lt!116841 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!72409 () Bool)

(assert (=> b!72409 (= e!47181 (not e!47179))))

(declare-fun res!59740 () Bool)

(assert (=> b!72409 (=> res!59740 e!47179)))

(assert (=> b!72409 (= res!59740 (bvsge i!635 to!314))))

(assert (=> b!72409 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!116853 () Unit!4815)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2342) Unit!4815)

(assert (=> b!72409 (= lt!116853 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!72409 (= lt!116840 (bitIndex!0 (size!1381 (buf!1762 thiss!1379)) (currentByte!3488 thiss!1379) (currentBit!3483 thiss!1379)))))

(declare-fun b!72410 () Bool)

(assert (=> b!72410 (= e!47184 e!47183)))

(declare-fun res!59744 () Bool)

(assert (=> b!72410 (=> res!59744 e!47183)))

(assert (=> b!72410 (= res!59744 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!72410 (= lt!116855 (bitStreamReadBitsIntoList!0 (_2!3244 lt!116861) (_1!3243 lt!116847) lt!116856))))

(assert (=> b!72410 (= lt!116839 (bitStreamReadBitsIntoList!0 (_2!3244 lt!116861) (_1!3243 lt!116852) (bvsub to!314 i!635)))))

(assert (=> b!72410 (validate_offset_bits!1 ((_ sign_extend 32) (size!1381 (buf!1762 (_2!3244 lt!116861)))) ((_ sign_extend 32) (currentByte!3488 (_2!3244 lt!116843))) ((_ sign_extend 32) (currentBit!3483 (_2!3244 lt!116843))) lt!116856)))

(declare-fun lt!116851 () Unit!4815)

(assert (=> b!72410 (= lt!116851 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3244 lt!116843) (buf!1762 (_2!3244 lt!116861)) lt!116856))))

(assert (=> b!72410 (= lt!116847 (reader!0 (_2!3244 lt!116843) (_2!3244 lt!116861)))))

(assert (=> b!72410 (validate_offset_bits!1 ((_ sign_extend 32) (size!1381 (buf!1762 (_2!3244 lt!116861)))) ((_ sign_extend 32) (currentByte!3488 thiss!1379)) ((_ sign_extend 32) (currentBit!3483 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!116849 () Unit!4815)

(assert (=> b!72410 (= lt!116849 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1762 (_2!3244 lt!116861)) (bvsub to!314 i!635)))))

(assert (=> b!72410 (= lt!116852 (reader!0 thiss!1379 (_2!3244 lt!116861)))))

(declare-fun b!72411 () Bool)

(declare-fun res!59730 () Bool)

(assert (=> b!72411 (=> res!59730 e!47180)))

(assert (=> b!72411 (= res!59730 (not (invariant!0 (currentBit!3483 (_2!3244 lt!116861)) (currentByte!3488 (_2!3244 lt!116861)) (size!1381 (buf!1762 (_2!3244 lt!116861))))))))

(declare-fun b!72412 () Bool)

(assert (=> b!72412 (= e!47178 (array_inv!1230 (buf!1762 thiss!1379)))))

(assert (= (and start!14074 res!59729) b!72396))

(assert (= (and b!72396 res!59735) b!72409))

(assert (= (and b!72409 (not res!59740)) b!72394))

(assert (= (and b!72394 (not res!59742)) b!72395))

(assert (= (and b!72395 res!59739) b!72400))

(assert (= (and b!72395 (not res!59747)) b!72402))

(assert (= (and b!72402 (not res!59745)) b!72411))

(assert (= (and b!72411 (not res!59730)) b!72398))

(assert (= (and b!72398 (not res!59736)) b!72405))

(assert (= (and b!72405 (not res!59741)) b!72397))

(assert (= (and b!72397 (not res!59738)) b!72407))

(assert (= (and b!72407 (not res!59731)) b!72410))

(assert (= (and b!72410 (not res!59744)) b!72403))

(assert (= (and b!72403 (not res!59733)) b!72401))

(assert (= (and b!72401 (not res!59737)) b!72393))

(assert (= (and b!72393 (not res!59748)) b!72392))

(assert (= (and b!72392 (not res!59743)) b!72408))

(assert (= (and b!72408 (not res!59746)) b!72406))

(assert (= (and b!72406 (not res!59734)) b!72404))

(assert (= (and b!72404 (not res!59732)) b!72399))

(assert (= start!14074 b!72412))

(declare-fun m!116165 () Bool)

(assert (=> b!72405 m!116165))

(declare-fun m!116167 () Bool)

(assert (=> b!72400 m!116167))

(assert (=> b!72400 m!116167))

(declare-fun m!116169 () Bool)

(assert (=> b!72400 m!116169))

(declare-fun m!116171 () Bool)

(assert (=> b!72400 m!116171))

(assert (=> b!72400 m!116171))

(declare-fun m!116173 () Bool)

(assert (=> b!72400 m!116173))

(declare-fun m!116175 () Bool)

(assert (=> b!72403 m!116175))

(declare-fun m!116177 () Bool)

(assert (=> b!72410 m!116177))

(declare-fun m!116179 () Bool)

(assert (=> b!72410 m!116179))

(declare-fun m!116181 () Bool)

(assert (=> b!72410 m!116181))

(declare-fun m!116183 () Bool)

(assert (=> b!72410 m!116183))

(declare-fun m!116185 () Bool)

(assert (=> b!72410 m!116185))

(declare-fun m!116187 () Bool)

(assert (=> b!72410 m!116187))

(declare-fun m!116189 () Bool)

(assert (=> b!72410 m!116189))

(declare-fun m!116191 () Bool)

(assert (=> b!72410 m!116191))

(declare-fun m!116193 () Bool)

(assert (=> b!72393 m!116193))

(declare-fun m!116195 () Bool)

(assert (=> b!72393 m!116195))

(declare-fun m!116197 () Bool)

(assert (=> start!14074 m!116197))

(declare-fun m!116199 () Bool)

(assert (=> start!14074 m!116199))

(declare-fun m!116201 () Bool)

(assert (=> b!72396 m!116201))

(declare-fun m!116203 () Bool)

(assert (=> b!72394 m!116203))

(declare-fun m!116205 () Bool)

(assert (=> b!72394 m!116205))

(declare-fun m!116207 () Bool)

(assert (=> b!72394 m!116207))

(declare-fun m!116209 () Bool)

(assert (=> b!72394 m!116209))

(assert (=> b!72394 m!116205))

(declare-fun m!116211 () Bool)

(assert (=> b!72394 m!116211))

(declare-fun m!116213 () Bool)

(assert (=> b!72407 m!116213))

(declare-fun m!116215 () Bool)

(assert (=> b!72392 m!116215))

(declare-fun m!116217 () Bool)

(assert (=> b!72397 m!116217))

(declare-fun m!116219 () Bool)

(assert (=> b!72408 m!116219))

(assert (=> b!72408 m!116219))

(declare-fun m!116221 () Bool)

(assert (=> b!72408 m!116221))

(declare-fun m!116223 () Bool)

(assert (=> b!72408 m!116223))

(declare-fun m!116225 () Bool)

(assert (=> b!72409 m!116225))

(declare-fun m!116227 () Bool)

(assert (=> b!72409 m!116227))

(declare-fun m!116229 () Bool)

(assert (=> b!72409 m!116229))

(declare-fun m!116231 () Bool)

(assert (=> b!72399 m!116231))

(declare-fun m!116233 () Bool)

(assert (=> b!72411 m!116233))

(declare-fun m!116235 () Bool)

(assert (=> b!72412 m!116235))

(declare-fun m!116237 () Bool)

(assert (=> b!72406 m!116237))

(declare-fun m!116239 () Bool)

(assert (=> b!72401 m!116239))

(declare-fun m!116241 () Bool)

(assert (=> b!72401 m!116241))

(declare-fun m!116243 () Bool)

(assert (=> b!72404 m!116243))

(declare-fun m!116245 () Bool)

(assert (=> b!72404 m!116245))

(declare-fun m!116247 () Bool)

(assert (=> b!72395 m!116247))

(declare-fun m!116249 () Bool)

(assert (=> b!72395 m!116249))

(declare-fun m!116251 () Bool)

(assert (=> b!72395 m!116251))

(declare-fun m!116253 () Bool)

(assert (=> b!72395 m!116253))

(declare-fun m!116255 () Bool)

(assert (=> b!72395 m!116255))

(declare-fun m!116257 () Bool)

(assert (=> b!72395 m!116257))

(declare-fun m!116259 () Bool)

(assert (=> b!72395 m!116259))

(declare-fun m!116261 () Bool)

(assert (=> b!72402 m!116261))

(push 1)

(assert (not b!72396))

(assert (not b!72405))

(assert (not b!72407))

(assert (not b!72403))

(assert (not b!72408))

(assert (not b!72409))

(assert (not b!72399))

(assert (not b!72392))

(assert (not b!72404))

(assert (not b!72395))

(assert (not start!14074))

(assert (not b!72401))

(assert (not b!72400))

(assert (not b!72410))

(assert (not b!72402))

(assert (not b!72393))

(assert (not b!72412))

(assert (not b!72411))

(assert (not b!72406))

(assert (not b!72394))

(assert (not b!72397))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

