; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6374 () Bool)

(assert start!6374)

(declare-fun b!29942 () Bool)

(declare-fun e!19997 () Bool)

(declare-fun e!20002 () Bool)

(assert (=> b!29942 (= e!19997 e!20002)))

(declare-fun res!25795 () Bool)

(assert (=> b!29942 (=> res!25795 e!20002)))

(declare-datatypes ((array!1778 0))(
  ( (array!1779 (arr!1238 (Array (_ BitVec 32) (_ BitVec 8))) (size!775 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1366 0))(
  ( (BitStream!1367 (buf!1103 array!1778) (currentByte!2446 (_ BitVec 32)) (currentBit!2441 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2319 0))(
  ( (Unit!2320) )
))
(declare-datatypes ((tuple2!3170 0))(
  ( (tuple2!3171 (_1!1672 Unit!2319) (_2!1672 BitStream!1366)) )
))
(declare-fun lt!43242 () tuple2!3170)

(declare-fun lt!43248 () tuple2!3170)

(assert (=> b!29942 (= res!25795 (not (= (size!775 (buf!1103 (_2!1672 lt!43242))) (size!775 (buf!1103 (_2!1672 lt!43248))))))))

(declare-fun e!19999 () Bool)

(assert (=> b!29942 e!19999))

(declare-fun res!25794 () Bool)

(assert (=> b!29942 (=> (not res!25794) (not e!19999))))

(declare-fun thiss!1379 () BitStream!1366)

(assert (=> b!29942 (= res!25794 (= (size!775 (buf!1103 (_2!1672 lt!43248))) (size!775 (buf!1103 thiss!1379))))))

(declare-fun b!29943 () Bool)

(declare-fun e!19992 () Bool)

(declare-fun e!19996 () Bool)

(assert (=> b!29943 (= e!19992 e!19996)))

(declare-fun res!25796 () Bool)

(assert (=> b!29943 (=> res!25796 e!19996)))

(declare-fun isPrefixOf!0 (BitStream!1366 BitStream!1366) Bool)

(assert (=> b!29943 (= res!25796 (not (isPrefixOf!0 (_2!1672 lt!43242) (_2!1672 lt!43248))))))

(assert (=> b!29943 (isPrefixOf!0 thiss!1379 (_2!1672 lt!43248))))

(declare-fun lt!43255 () Unit!2319)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1366 BitStream!1366 BitStream!1366) Unit!2319)

(assert (=> b!29943 (= lt!43255 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1672 lt!43242) (_2!1672 lt!43248)))))

(declare-fun srcBuffer!2 () array!1778)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1366 array!1778 (_ BitVec 64) (_ BitVec 64)) tuple2!3170)

(assert (=> b!29943 (= lt!43248 (appendBitsMSBFirstLoop!0 (_2!1672 lt!43242) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!20001 () Bool)

(assert (=> b!29943 e!20001))

(declare-fun res!25789 () Bool)

(assert (=> b!29943 (=> (not res!25789) (not e!20001))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!29943 (= res!25789 (validate_offset_bits!1 ((_ sign_extend 32) (size!775 (buf!1103 (_2!1672 lt!43242)))) ((_ sign_extend 32) (currentByte!2446 thiss!1379)) ((_ sign_extend 32) (currentBit!2441 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!43258 () Unit!2319)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1366 array!1778 (_ BitVec 64)) Unit!2319)

(assert (=> b!29943 (= lt!43258 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1103 (_2!1672 lt!43242)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!3172 0))(
  ( (tuple2!3173 (_1!1673 BitStream!1366) (_2!1673 BitStream!1366)) )
))
(declare-fun lt!43250 () tuple2!3172)

(declare-fun reader!0 (BitStream!1366 BitStream!1366) tuple2!3172)

(assert (=> b!29943 (= lt!43250 (reader!0 thiss!1379 (_2!1672 lt!43242)))))

(declare-fun b!29944 () Bool)

(declare-fun e!19998 () Bool)

(declare-datatypes ((List!384 0))(
  ( (Nil!381) (Cons!380 (h!499 Bool) (t!1134 List!384)) )
))
(declare-fun lt!43247 () List!384)

(assert (=> b!29944 (= e!19998 (not (= lt!43247 Nil!381)))))

(declare-fun b!29945 () Bool)

(declare-fun res!25781 () Bool)

(assert (=> b!29945 (=> res!25781 e!19997)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!29945 (= res!25781 (not (invariant!0 (currentBit!2441 (_2!1672 lt!43248)) (currentByte!2446 (_2!1672 lt!43248)) (size!775 (buf!1103 (_2!1672 lt!43248))))))))

(declare-fun b!29946 () Bool)

(assert (=> b!29946 (= e!19996 e!19997)))

(declare-fun res!25785 () Bool)

(assert (=> b!29946 (=> res!25785 e!19997)))

(declare-fun lt!43243 () (_ BitVec 64))

(declare-fun lt!43241 () (_ BitVec 64))

(assert (=> b!29946 (= res!25785 (not (= lt!43243 (bvsub (bvadd lt!43241 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!29946 (= lt!43243 (bitIndex!0 (size!775 (buf!1103 (_2!1672 lt!43248))) (currentByte!2446 (_2!1672 lt!43248)) (currentBit!2441 (_2!1672 lt!43248))))))

(declare-fun b!29947 () Bool)

(assert (=> b!29947 (= e!19999 (= lt!43243 (bvsub (bvsub (bvadd (bitIndex!0 (size!775 (buf!1103 (_2!1672 lt!43242))) (currentByte!2446 (_2!1672 lt!43242)) (currentBit!2441 (_2!1672 lt!43242))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!29948 () Bool)

(declare-fun head!221 (List!384) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1366 array!1778 (_ BitVec 64) (_ BitVec 64)) List!384)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1366 BitStream!1366 (_ BitVec 64)) List!384)

(assert (=> b!29948 (= e!20001 (= (head!221 (byteArrayBitContentToList!0 (_2!1672 lt!43242) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!221 (bitStreamReadBitsIntoList!0 (_2!1672 lt!43242) (_1!1673 lt!43250) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!29949 () Bool)

(declare-fun e!20000 () Bool)

(declare-fun e!19995 () Bool)

(assert (=> b!29949 (= e!20000 (not e!19995))))

(declare-fun res!25782 () Bool)

(assert (=> b!29949 (=> res!25782 e!19995)))

(assert (=> b!29949 (= res!25782 (bvsge i!635 to!314))))

(assert (=> b!29949 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!43244 () Unit!2319)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1366) Unit!2319)

(assert (=> b!29949 (= lt!43244 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!29949 (= lt!43241 (bitIndex!0 (size!775 (buf!1103 thiss!1379)) (currentByte!2446 thiss!1379) (currentBit!2441 thiss!1379)))))

(declare-fun b!29950 () Bool)

(declare-fun res!25788 () Bool)

(assert (=> b!29950 (=> (not res!25788) (not e!20000))))

(assert (=> b!29950 (= res!25788 (validate_offset_bits!1 ((_ sign_extend 32) (size!775 (buf!1103 thiss!1379))) ((_ sign_extend 32) (currentByte!2446 thiss!1379)) ((_ sign_extend 32) (currentBit!2441 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!25790 () Bool)

(assert (=> start!6374 (=> (not res!25790) (not e!20000))))

(assert (=> start!6374 (= res!25790 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!775 srcBuffer!2))))))))

(assert (=> start!6374 e!20000))

(assert (=> start!6374 true))

(declare-fun array_inv!736 (array!1778) Bool)

(assert (=> start!6374 (array_inv!736 srcBuffer!2)))

(declare-fun e!19991 () Bool)

(declare-fun inv!12 (BitStream!1366) Bool)

(assert (=> start!6374 (and (inv!12 thiss!1379) e!19991)))

(declare-fun b!29951 () Bool)

(declare-fun res!25793 () Bool)

(assert (=> b!29951 (=> res!25793 e!19998)))

(declare-fun lt!43249 () tuple2!3172)

(declare-fun lt!43253 () tuple2!3172)

(declare-fun bitAt!0 (array!1778 (_ BitVec 64)) Bool)

(assert (=> b!29951 (= res!25793 (not (= (bitAt!0 (buf!1103 (_1!1673 lt!43249)) lt!43241) (bitAt!0 (buf!1103 (_1!1673 lt!43253)) lt!43241))))))

(declare-fun b!29952 () Bool)

(declare-fun e!19993 () Bool)

(assert (=> b!29952 (= e!19993 e!19998)))

(declare-fun res!25784 () Bool)

(assert (=> b!29952 (=> res!25784 e!19998)))

(declare-fun lt!43245 () List!384)

(declare-fun lt!43254 () List!384)

(assert (=> b!29952 (= res!25784 (not (= lt!43245 lt!43254)))))

(assert (=> b!29952 (= lt!43254 lt!43245)))

(declare-fun tail!101 (List!384) List!384)

(assert (=> b!29952 (= lt!43245 (tail!101 lt!43247))))

(declare-fun lt!43252 () Unit!2319)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1366 BitStream!1366 BitStream!1366 BitStream!1366 (_ BitVec 64) List!384) Unit!2319)

(assert (=> b!29952 (= lt!43252 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1672 lt!43248) (_2!1672 lt!43248) (_1!1673 lt!43249) (_1!1673 lt!43253) (bvsub to!314 i!635) lt!43247))))

(declare-fun b!29953 () Bool)

(assert (=> b!29953 (= e!20002 e!19993)))

(declare-fun res!25786 () Bool)

(assert (=> b!29953 (=> res!25786 e!19993)))

(assert (=> b!29953 (= res!25786 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!43257 () (_ BitVec 64))

(assert (=> b!29953 (= lt!43254 (bitStreamReadBitsIntoList!0 (_2!1672 lt!43248) (_1!1673 lt!43253) lt!43257))))

(assert (=> b!29953 (= lt!43247 (bitStreamReadBitsIntoList!0 (_2!1672 lt!43248) (_1!1673 lt!43249) (bvsub to!314 i!635)))))

(assert (=> b!29953 (validate_offset_bits!1 ((_ sign_extend 32) (size!775 (buf!1103 (_2!1672 lt!43248)))) ((_ sign_extend 32) (currentByte!2446 (_2!1672 lt!43242))) ((_ sign_extend 32) (currentBit!2441 (_2!1672 lt!43242))) lt!43257)))

(declare-fun lt!43256 () Unit!2319)

(assert (=> b!29953 (= lt!43256 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1672 lt!43242) (buf!1103 (_2!1672 lt!43248)) lt!43257))))

(assert (=> b!29953 (= lt!43253 (reader!0 (_2!1672 lt!43242) (_2!1672 lt!43248)))))

(assert (=> b!29953 (validate_offset_bits!1 ((_ sign_extend 32) (size!775 (buf!1103 (_2!1672 lt!43248)))) ((_ sign_extend 32) (currentByte!2446 thiss!1379)) ((_ sign_extend 32) (currentBit!2441 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!43246 () Unit!2319)

(assert (=> b!29953 (= lt!43246 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1103 (_2!1672 lt!43248)) (bvsub to!314 i!635)))))

(assert (=> b!29953 (= lt!43249 (reader!0 thiss!1379 (_2!1672 lt!43248)))))

(declare-fun b!29954 () Bool)

(declare-fun res!25791 () Bool)

(assert (=> b!29954 (=> res!25791 e!19997)))

(assert (=> b!29954 (= res!25791 (not (= (size!775 (buf!1103 thiss!1379)) (size!775 (buf!1103 (_2!1672 lt!43248))))))))

(declare-fun b!29955 () Bool)

(assert (=> b!29955 (= e!19991 (array_inv!736 (buf!1103 thiss!1379)))))

(declare-fun b!29956 () Bool)

(declare-fun res!25787 () Bool)

(assert (=> b!29956 (=> res!25787 e!19993)))

(declare-fun length!110 (List!384) Int)

(assert (=> b!29956 (= res!25787 (<= (length!110 lt!43247) 0))))

(declare-fun b!29957 () Bool)

(assert (=> b!29957 (= e!19995 e!19992)))

(declare-fun res!25797 () Bool)

(assert (=> b!29957 (=> res!25797 e!19992)))

(assert (=> b!29957 (= res!25797 (not (isPrefixOf!0 thiss!1379 (_2!1672 lt!43242))))))

(assert (=> b!29957 (validate_offset_bits!1 ((_ sign_extend 32) (size!775 (buf!1103 (_2!1672 lt!43242)))) ((_ sign_extend 32) (currentByte!2446 (_2!1672 lt!43242))) ((_ sign_extend 32) (currentBit!2441 (_2!1672 lt!43242))) lt!43257)))

(assert (=> b!29957 (= lt!43257 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!43251 () Unit!2319)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1366 BitStream!1366 (_ BitVec 64) (_ BitVec 64)) Unit!2319)

(assert (=> b!29957 (= lt!43251 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1672 lt!43242) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1366 (_ BitVec 8) (_ BitVec 32)) tuple2!3170)

(assert (=> b!29957 (= lt!43242 (appendBitFromByte!0 thiss!1379 (select (arr!1238 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!29958 () Bool)

(declare-fun res!25783 () Bool)

(assert (=> b!29958 (=> res!25783 e!20002)))

(assert (=> b!29958 (= res!25783 (not (invariant!0 (currentBit!2441 (_2!1672 lt!43242)) (currentByte!2446 (_2!1672 lt!43242)) (size!775 (buf!1103 (_2!1672 lt!43242))))))))

(declare-fun b!29959 () Bool)

(declare-fun res!25792 () Bool)

(assert (=> b!29959 (=> res!25792 e!20002)))

(assert (=> b!29959 (= res!25792 (not (invariant!0 (currentBit!2441 (_2!1672 lt!43242)) (currentByte!2446 (_2!1672 lt!43242)) (size!775 (buf!1103 (_2!1672 lt!43248))))))))

(assert (= (and start!6374 res!25790) b!29950))

(assert (= (and b!29950 res!25788) b!29949))

(assert (= (and b!29949 (not res!25782)) b!29957))

(assert (= (and b!29957 (not res!25797)) b!29943))

(assert (= (and b!29943 res!25789) b!29948))

(assert (= (and b!29943 (not res!25796)) b!29946))

(assert (= (and b!29946 (not res!25785)) b!29945))

(assert (= (and b!29945 (not res!25781)) b!29954))

(assert (= (and b!29954 (not res!25791)) b!29942))

(assert (= (and b!29942 res!25794) b!29947))

(assert (= (and b!29942 (not res!25795)) b!29958))

(assert (= (and b!29958 (not res!25783)) b!29959))

(assert (= (and b!29959 (not res!25792)) b!29953))

(assert (= (and b!29953 (not res!25786)) b!29956))

(assert (= (and b!29956 (not res!25787)) b!29952))

(assert (= (and b!29952 (not res!25784)) b!29951))

(assert (= (and b!29951 (not res!25793)) b!29944))

(assert (= start!6374 b!29955))

(declare-fun m!43539 () Bool)

(assert (=> b!29956 m!43539))

(declare-fun m!43541 () Bool)

(assert (=> b!29958 m!43541))

(declare-fun m!43543 () Bool)

(assert (=> b!29948 m!43543))

(assert (=> b!29948 m!43543))

(declare-fun m!43545 () Bool)

(assert (=> b!29948 m!43545))

(declare-fun m!43547 () Bool)

(assert (=> b!29948 m!43547))

(assert (=> b!29948 m!43547))

(declare-fun m!43549 () Bool)

(assert (=> b!29948 m!43549))

(declare-fun m!43551 () Bool)

(assert (=> b!29959 m!43551))

(declare-fun m!43553 () Bool)

(assert (=> b!29951 m!43553))

(declare-fun m!43555 () Bool)

(assert (=> b!29951 m!43555))

(declare-fun m!43557 () Bool)

(assert (=> b!29947 m!43557))

(declare-fun m!43559 () Bool)

(assert (=> b!29955 m!43559))

(declare-fun m!43561 () Bool)

(assert (=> b!29950 m!43561))

(declare-fun m!43563 () Bool)

(assert (=> b!29946 m!43563))

(declare-fun m!43565 () Bool)

(assert (=> b!29943 m!43565))

(declare-fun m!43567 () Bool)

(assert (=> b!29943 m!43567))

(declare-fun m!43569 () Bool)

(assert (=> b!29943 m!43569))

(declare-fun m!43571 () Bool)

(assert (=> b!29943 m!43571))

(declare-fun m!43573 () Bool)

(assert (=> b!29943 m!43573))

(declare-fun m!43575 () Bool)

(assert (=> b!29943 m!43575))

(declare-fun m!43577 () Bool)

(assert (=> b!29943 m!43577))

(declare-fun m!43579 () Bool)

(assert (=> b!29945 m!43579))

(declare-fun m!43581 () Bool)

(assert (=> b!29949 m!43581))

(declare-fun m!43583 () Bool)

(assert (=> b!29949 m!43583))

(declare-fun m!43585 () Bool)

(assert (=> b!29949 m!43585))

(declare-fun m!43587 () Bool)

(assert (=> b!29953 m!43587))

(declare-fun m!43589 () Bool)

(assert (=> b!29953 m!43589))

(declare-fun m!43591 () Bool)

(assert (=> b!29953 m!43591))

(declare-fun m!43593 () Bool)

(assert (=> b!29953 m!43593))

(declare-fun m!43595 () Bool)

(assert (=> b!29953 m!43595))

(declare-fun m!43597 () Bool)

(assert (=> b!29953 m!43597))

(declare-fun m!43599 () Bool)

(assert (=> b!29953 m!43599))

(declare-fun m!43601 () Bool)

(assert (=> b!29953 m!43601))

(declare-fun m!43603 () Bool)

(assert (=> b!29952 m!43603))

(declare-fun m!43605 () Bool)

(assert (=> b!29952 m!43605))

(declare-fun m!43607 () Bool)

(assert (=> start!6374 m!43607))

(declare-fun m!43609 () Bool)

(assert (=> start!6374 m!43609))

(declare-fun m!43611 () Bool)

(assert (=> b!29957 m!43611))

(declare-fun m!43613 () Bool)

(assert (=> b!29957 m!43613))

(declare-fun m!43615 () Bool)

(assert (=> b!29957 m!43615))

(declare-fun m!43617 () Bool)

(assert (=> b!29957 m!43617))

(assert (=> b!29957 m!43613))

(declare-fun m!43619 () Bool)

(assert (=> b!29957 m!43619))

(push 1)

(assert (not b!29952))

(assert (not b!29953))

(assert (not b!29958))

(assert (not start!6374))

(assert (not b!29945))

(assert (not b!29948))

(assert (not b!29943))

(assert (not b!29950))

(assert (not b!29946))

(assert (not b!29957))

(assert (not b!29951))

(assert (not b!29947))

(assert (not b!29955))

(assert (not b!29949))

(assert (not b!29956))

(assert (not b!29959))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!8610 () Bool)

(assert (=> d!8610 (= (array_inv!736 (buf!1103 thiss!1379)) (bvsge (size!775 (buf!1103 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!29955 d!8610))

(declare-fun d!8612 () Bool)

(declare-fun res!25934 () Bool)

(declare-fun e!20112 () Bool)

(assert (=> d!8612 (=> (not res!25934) (not e!20112))))

(assert (=> d!8612 (= res!25934 (= (size!775 (buf!1103 (_2!1672 lt!43242))) (size!775 (buf!1103 (_2!1672 lt!43248)))))))

(assert (=> d!8612 (= (isPrefixOf!0 (_2!1672 lt!43242) (_2!1672 lt!43248)) e!20112)))

(declare-fun b!30127 () Bool)

(declare-fun res!25935 () Bool)

(assert (=> b!30127 (=> (not res!25935) (not e!20112))))

(assert (=> b!30127 (= res!25935 (bvsle (bitIndex!0 (size!775 (buf!1103 (_2!1672 lt!43242))) (currentByte!2446 (_2!1672 lt!43242)) (currentBit!2441 (_2!1672 lt!43242))) (bitIndex!0 (size!775 (buf!1103 (_2!1672 lt!43248))) (currentByte!2446 (_2!1672 lt!43248)) (currentBit!2441 (_2!1672 lt!43248)))))))

(declare-fun b!30128 () Bool)

(declare-fun e!20113 () Bool)

(assert (=> b!30128 (= e!20112 e!20113)))

(declare-fun res!25933 () Bool)

(assert (=> b!30128 (=> res!25933 e!20113)))

(assert (=> b!30128 (= res!25933 (= (size!775 (buf!1103 (_2!1672 lt!43242))) #b00000000000000000000000000000000))))

(declare-fun b!30129 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1778 array!1778 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!30129 (= e!20113 (arrayBitRangesEq!0 (buf!1103 (_2!1672 lt!43242)) (buf!1103 (_2!1672 lt!43248)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!775 (buf!1103 (_2!1672 lt!43242))) (currentByte!2446 (_2!1672 lt!43242)) (currentBit!2441 (_2!1672 lt!43242)))))))

(assert (= (and d!8612 res!25934) b!30127))

(assert (= (and b!30127 res!25935) b!30128))

(assert (= (and b!30128 (not res!25933)) b!30129))

(assert (=> b!30127 m!43557))

(assert (=> b!30127 m!43563))

(assert (=> b!30129 m!43557))

(assert (=> b!30129 m!43557))

(declare-fun m!43899 () Bool)

(assert (=> b!30129 m!43899))

(assert (=> b!29943 d!8612))

(declare-fun b!30307 () Bool)

(declare-fun e!20204 () tuple2!3170)

(declare-fun lt!43956 () tuple2!3170)

(declare-fun Unit!2335 () Unit!2319)

(assert (=> b!30307 (= e!20204 (tuple2!3171 Unit!2335 (_2!1672 lt!43956)))))

(declare-fun lt!43985 () tuple2!3170)

(assert (=> b!30307 (= lt!43985 (appendBitFromByte!0 (_2!1672 lt!43242) (select (arr!1238 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!43947 () (_ BitVec 64))

(assert (=> b!30307 (= lt!43947 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!43964 () (_ BitVec 64))

(assert (=> b!30307 (= lt!43964 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!43948 () Unit!2319)

(assert (=> b!30307 (= lt!43948 (validateOffsetBitsIneqLemma!0 (_2!1672 lt!43242) (_2!1672 lt!43985) lt!43947 lt!43964))))

(assert (=> b!30307 (validate_offset_bits!1 ((_ sign_extend 32) (size!775 (buf!1103 (_2!1672 lt!43985)))) ((_ sign_extend 32) (currentByte!2446 (_2!1672 lt!43985))) ((_ sign_extend 32) (currentBit!2441 (_2!1672 lt!43985))) (bvsub lt!43947 lt!43964))))

(declare-fun lt!43974 () Unit!2319)

(assert (=> b!30307 (= lt!43974 lt!43948)))

(declare-fun lt!43983 () tuple2!3172)

(assert (=> b!30307 (= lt!43983 (reader!0 (_2!1672 lt!43242) (_2!1672 lt!43985)))))

(declare-fun lt!43967 () (_ BitVec 64))

(assert (=> b!30307 (= lt!43967 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!43990 () Unit!2319)

(assert (=> b!30307 (= lt!43990 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1672 lt!43242) (buf!1103 (_2!1672 lt!43985)) lt!43967))))

(assert (=> b!30307 (validate_offset_bits!1 ((_ sign_extend 32) (size!775 (buf!1103 (_2!1672 lt!43985)))) ((_ sign_extend 32) (currentByte!2446 (_2!1672 lt!43242))) ((_ sign_extend 32) (currentBit!2441 (_2!1672 lt!43242))) lt!43967)))

(declare-fun lt!43976 () Unit!2319)

(assert (=> b!30307 (= lt!43976 lt!43990)))

(assert (=> b!30307 (= (head!221 (byteArrayBitContentToList!0 (_2!1672 lt!43985) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!221 (bitStreamReadBitsIntoList!0 (_2!1672 lt!43985) (_1!1673 lt!43983) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!43972 () Unit!2319)

(declare-fun Unit!2336 () Unit!2319)

(assert (=> b!30307 (= lt!43972 Unit!2336)))

(assert (=> b!30307 (= lt!43956 (appendBitsMSBFirstLoop!0 (_2!1672 lt!43985) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!43982 () Unit!2319)

(assert (=> b!30307 (= lt!43982 (lemmaIsPrefixTransitive!0 (_2!1672 lt!43242) (_2!1672 lt!43985) (_2!1672 lt!43956)))))

(assert (=> b!30307 (isPrefixOf!0 (_2!1672 lt!43242) (_2!1672 lt!43956))))

(declare-fun lt!43963 () Unit!2319)

(assert (=> b!30307 (= lt!43963 lt!43982)))

(assert (=> b!30307 (= (size!775 (buf!1103 (_2!1672 lt!43956))) (size!775 (buf!1103 (_2!1672 lt!43242))))))

(declare-fun lt!43950 () Unit!2319)

(declare-fun Unit!2337 () Unit!2319)

(assert (=> b!30307 (= lt!43950 Unit!2337)))

(assert (=> b!30307 (= (bitIndex!0 (size!775 (buf!1103 (_2!1672 lt!43956))) (currentByte!2446 (_2!1672 lt!43956)) (currentBit!2441 (_2!1672 lt!43956))) (bvsub (bvadd (bitIndex!0 (size!775 (buf!1103 (_2!1672 lt!43242))) (currentByte!2446 (_2!1672 lt!43242)) (currentBit!2441 (_2!1672 lt!43242))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!43952 () Unit!2319)

(declare-fun Unit!2338 () Unit!2319)

(assert (=> b!30307 (= lt!43952 Unit!2338)))

(assert (=> b!30307 (= (bitIndex!0 (size!775 (buf!1103 (_2!1672 lt!43956))) (currentByte!2446 (_2!1672 lt!43956)) (currentBit!2441 (_2!1672 lt!43956))) (bvsub (bvsub (bvadd (bitIndex!0 (size!775 (buf!1103 (_2!1672 lt!43985))) (currentByte!2446 (_2!1672 lt!43985)) (currentBit!2441 (_2!1672 lt!43985))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!43953 () Unit!2319)

(declare-fun Unit!2339 () Unit!2319)

(assert (=> b!30307 (= lt!43953 Unit!2339)))

(declare-fun lt!43968 () tuple2!3172)

(assert (=> b!30307 (= lt!43968 (reader!0 (_2!1672 lt!43242) (_2!1672 lt!43956)))))

(declare-fun lt!43971 () (_ BitVec 64))

(assert (=> b!30307 (= lt!43971 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!43961 () Unit!2319)

(assert (=> b!30307 (= lt!43961 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1672 lt!43242) (buf!1103 (_2!1672 lt!43956)) lt!43971))))

(assert (=> b!30307 (validate_offset_bits!1 ((_ sign_extend 32) (size!775 (buf!1103 (_2!1672 lt!43956)))) ((_ sign_extend 32) (currentByte!2446 (_2!1672 lt!43242))) ((_ sign_extend 32) (currentBit!2441 (_2!1672 lt!43242))) lt!43971)))

(declare-fun lt!43965 () Unit!2319)

(assert (=> b!30307 (= lt!43965 lt!43961)))

(declare-fun lt!43979 () tuple2!3172)

(declare-fun call!388 () tuple2!3172)

(assert (=> b!30307 (= lt!43979 call!388)))

(declare-fun lt!43986 () (_ BitVec 64))

(assert (=> b!30307 (= lt!43986 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!43984 () Unit!2319)

(assert (=> b!30307 (= lt!43984 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1672 lt!43985) (buf!1103 (_2!1672 lt!43956)) lt!43986))))

(assert (=> b!30307 (validate_offset_bits!1 ((_ sign_extend 32) (size!775 (buf!1103 (_2!1672 lt!43956)))) ((_ sign_extend 32) (currentByte!2446 (_2!1672 lt!43985))) ((_ sign_extend 32) (currentBit!2441 (_2!1672 lt!43985))) lt!43986)))

(declare-fun lt!43951 () Unit!2319)

(assert (=> b!30307 (= lt!43951 lt!43984)))

(declare-fun lt!43980 () List!384)

(assert (=> b!30307 (= lt!43980 (byteArrayBitContentToList!0 (_2!1672 lt!43956) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!43989 () List!384)

(assert (=> b!30307 (= lt!43989 (byteArrayBitContentToList!0 (_2!1672 lt!43956) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!43978 () List!384)

(assert (=> b!30307 (= lt!43978 (bitStreamReadBitsIntoList!0 (_2!1672 lt!43956) (_1!1673 lt!43968) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!43966 () List!384)

(assert (=> b!30307 (= lt!43966 (bitStreamReadBitsIntoList!0 (_2!1672 lt!43956) (_1!1673 lt!43979) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!43962 () (_ BitVec 64))

(assert (=> b!30307 (= lt!43962 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!43958 () Unit!2319)

(assert (=> b!30307 (= lt!43958 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1672 lt!43956) (_2!1672 lt!43956) (_1!1673 lt!43968) (_1!1673 lt!43979) lt!43962 lt!43978))))

(assert (=> b!30307 (= (bitStreamReadBitsIntoList!0 (_2!1672 lt!43956) (_1!1673 lt!43979) (bvsub lt!43962 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!101 lt!43978))))

(declare-fun lt!43959 () Unit!2319)

(assert (=> b!30307 (= lt!43959 lt!43958)))

(declare-fun lt!43949 () (_ BitVec 64))

(declare-fun lt!43988 () Unit!2319)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1778 array!1778 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2319)

(assert (=> b!30307 (= lt!43988 (arrayBitRangesEqImpliesEq!0 (buf!1103 (_2!1672 lt!43985)) (buf!1103 (_2!1672 lt!43956)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!43949 (bitIndex!0 (size!775 (buf!1103 (_2!1672 lt!43985))) (currentByte!2446 (_2!1672 lt!43985)) (currentBit!2441 (_2!1672 lt!43985)))))))

(assert (=> b!30307 (= (bitAt!0 (buf!1103 (_2!1672 lt!43985)) lt!43949) (bitAt!0 (buf!1103 (_2!1672 lt!43956)) lt!43949))))

(declare-fun lt!43975 () Unit!2319)

(assert (=> b!30307 (= lt!43975 lt!43988)))

(declare-fun d!8614 () Bool)

(declare-fun e!20205 () Bool)

(assert (=> d!8614 e!20205))

(declare-fun res!26060 () Bool)

(assert (=> d!8614 (=> (not res!26060) (not e!20205))))

(declare-fun lt!43969 () tuple2!3170)

(declare-fun lt!43987 () (_ BitVec 64))

(assert (=> d!8614 (= res!26060 (= (bitIndex!0 (size!775 (buf!1103 (_2!1672 lt!43969))) (currentByte!2446 (_2!1672 lt!43969)) (currentBit!2441 (_2!1672 lt!43969))) (bvsub lt!43987 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!8614 (or (= (bvand lt!43987 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!43987 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!43987 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!43960 () (_ BitVec 64))

(assert (=> d!8614 (= lt!43987 (bvadd lt!43960 to!314))))

(assert (=> d!8614 (or (not (= (bvand lt!43960 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!43960 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!43960 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8614 (= lt!43960 (bitIndex!0 (size!775 (buf!1103 (_2!1672 lt!43242))) (currentByte!2446 (_2!1672 lt!43242)) (currentBit!2441 (_2!1672 lt!43242))))))

(assert (=> d!8614 (= lt!43969 e!20204)))

(declare-fun c!2007 () Bool)

(assert (=> d!8614 (= c!2007 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!43954 () Unit!2319)

(declare-fun lt!43957 () Unit!2319)

(assert (=> d!8614 (= lt!43954 lt!43957)))

(assert (=> d!8614 (isPrefixOf!0 (_2!1672 lt!43242) (_2!1672 lt!43242))))

(assert (=> d!8614 (= lt!43957 (lemmaIsPrefixRefl!0 (_2!1672 lt!43242)))))

(assert (=> d!8614 (= lt!43949 (bitIndex!0 (size!775 (buf!1103 (_2!1672 lt!43242))) (currentByte!2446 (_2!1672 lt!43242)) (currentBit!2441 (_2!1672 lt!43242))))))

(assert (=> d!8614 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8614 (= (appendBitsMSBFirstLoop!0 (_2!1672 lt!43242) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!43969)))

(declare-fun b!30308 () Bool)

(declare-fun res!26057 () Bool)

(assert (=> b!30308 (=> (not res!26057) (not e!20205))))

(assert (=> b!30308 (= res!26057 (= (size!775 (buf!1103 (_2!1672 lt!43242))) (size!775 (buf!1103 (_2!1672 lt!43969)))))))

(declare-fun b!30309 () Bool)

(declare-fun Unit!2340 () Unit!2319)

(assert (=> b!30309 (= e!20204 (tuple2!3171 Unit!2340 (_2!1672 lt!43242)))))

(assert (=> b!30309 (= (size!775 (buf!1103 (_2!1672 lt!43242))) (size!775 (buf!1103 (_2!1672 lt!43242))))))

(declare-fun lt!43955 () Unit!2319)

(declare-fun Unit!2341 () Unit!2319)

(assert (=> b!30309 (= lt!43955 Unit!2341)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1366 array!1778 array!1778 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!3190 0))(
  ( (tuple2!3191 (_1!1682 array!1778) (_2!1682 BitStream!1366)) )
))
(declare-fun readBits!0 (BitStream!1366 (_ BitVec 64)) tuple2!3190)

(assert (=> b!30309 (checkByteArrayBitContent!0 (_2!1672 lt!43242) srcBuffer!2 (_1!1682 (readBits!0 (_1!1673 call!388) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!30310 () Bool)

(declare-fun e!20203 () Bool)

(declare-fun lt!43973 () (_ BitVec 64))

(assert (=> b!30310 (= e!20203 (validate_offset_bits!1 ((_ sign_extend 32) (size!775 (buf!1103 (_2!1672 lt!43242)))) ((_ sign_extend 32) (currentByte!2446 (_2!1672 lt!43242))) ((_ sign_extend 32) (currentBit!2441 (_2!1672 lt!43242))) lt!43973))))

(declare-fun bm!385 () Bool)

(assert (=> bm!385 (= call!388 (reader!0 (ite c!2007 (_2!1672 lt!43985) (_2!1672 lt!43242)) (ite c!2007 (_2!1672 lt!43956) (_2!1672 lt!43242))))))

(declare-fun b!30311 () Bool)

(declare-fun res!26061 () Bool)

(assert (=> b!30311 (=> (not res!26061) (not e!20205))))

(assert (=> b!30311 (= res!26061 (invariant!0 (currentBit!2441 (_2!1672 lt!43969)) (currentByte!2446 (_2!1672 lt!43969)) (size!775 (buf!1103 (_2!1672 lt!43969)))))))

(declare-fun b!30312 () Bool)

(declare-fun res!26058 () Bool)

(assert (=> b!30312 (=> (not res!26058) (not e!20205))))

(assert (=> b!30312 (= res!26058 (isPrefixOf!0 (_2!1672 lt!43242) (_2!1672 lt!43969)))))

(declare-fun b!30313 () Bool)

(declare-fun res!26056 () Bool)

(assert (=> b!30313 (=> (not res!26056) (not e!20205))))

(assert (=> b!30313 (= res!26056 (= (size!775 (buf!1103 (_2!1672 lt!43969))) (size!775 (buf!1103 (_2!1672 lt!43242)))))))

(declare-fun lt!43977 () tuple2!3172)

(declare-fun b!30314 () Bool)

(assert (=> b!30314 (= e!20205 (= (bitStreamReadBitsIntoList!0 (_2!1672 lt!43969) (_1!1673 lt!43977) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1672 lt!43969) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!30314 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30314 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!43970 () Unit!2319)

(declare-fun lt!43981 () Unit!2319)

(assert (=> b!30314 (= lt!43970 lt!43981)))

(assert (=> b!30314 (validate_offset_bits!1 ((_ sign_extend 32) (size!775 (buf!1103 (_2!1672 lt!43969)))) ((_ sign_extend 32) (currentByte!2446 (_2!1672 lt!43242))) ((_ sign_extend 32) (currentBit!2441 (_2!1672 lt!43242))) lt!43973)))

(assert (=> b!30314 (= lt!43981 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1672 lt!43242) (buf!1103 (_2!1672 lt!43969)) lt!43973))))

(assert (=> b!30314 e!20203))

(declare-fun res!26059 () Bool)

(assert (=> b!30314 (=> (not res!26059) (not e!20203))))

(assert (=> b!30314 (= res!26059 (and (= (size!775 (buf!1103 (_2!1672 lt!43242))) (size!775 (buf!1103 (_2!1672 lt!43969)))) (bvsge lt!43973 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30314 (= lt!43973 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!30314 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30314 (= lt!43977 (reader!0 (_2!1672 lt!43242) (_2!1672 lt!43969)))))

(assert (= (and d!8614 c!2007) b!30307))

(assert (= (and d!8614 (not c!2007)) b!30309))

(assert (= (or b!30307 b!30309) bm!385))

(assert (= (and d!8614 res!26060) b!30311))

(assert (= (and b!30311 res!26061) b!30308))

(assert (= (and b!30308 res!26057) b!30312))

(assert (= (and b!30312 res!26058) b!30313))

(assert (= (and b!30313 res!26056) b!30314))

(assert (= (and b!30314 res!26059) b!30310))

(declare-fun m!44195 () Bool)

(assert (=> d!8614 m!44195))

(assert (=> d!8614 m!43557))

(declare-fun m!44197 () Bool)

(assert (=> d!8614 m!44197))

(declare-fun m!44199 () Bool)

(assert (=> d!8614 m!44199))

(declare-fun m!44201 () Bool)

(assert (=> b!30310 m!44201))

(declare-fun m!44203 () Bool)

(assert (=> b!30314 m!44203))

(declare-fun m!44205 () Bool)

(assert (=> b!30314 m!44205))

(declare-fun m!44207 () Bool)

(assert (=> b!30314 m!44207))

(declare-fun m!44209 () Bool)

(assert (=> b!30314 m!44209))

(declare-fun m!44211 () Bool)

(assert (=> b!30314 m!44211))

(declare-fun m!44213 () Bool)

(assert (=> b!30307 m!44213))

(declare-fun m!44215 () Bool)

(assert (=> b!30307 m!44215))

(declare-fun m!44217 () Bool)

(assert (=> b!30307 m!44217))

(declare-fun m!44219 () Bool)

(assert (=> b!30307 m!44219))

(declare-fun m!44221 () Bool)

(assert (=> b!30307 m!44221))

(declare-fun m!44223 () Bool)

(assert (=> b!30307 m!44223))

(declare-fun m!44225 () Bool)

(assert (=> b!30307 m!44225))

(declare-fun m!44227 () Bool)

(assert (=> b!30307 m!44227))

(declare-fun m!44229 () Bool)

(assert (=> b!30307 m!44229))

(declare-fun m!44231 () Bool)

(assert (=> b!30307 m!44231))

(declare-fun m!44233 () Bool)

(assert (=> b!30307 m!44233))

(declare-fun m!44235 () Bool)

(assert (=> b!30307 m!44235))

(declare-fun m!44237 () Bool)

(assert (=> b!30307 m!44237))

(declare-fun m!44239 () Bool)

(assert (=> b!30307 m!44239))

(declare-fun m!44241 () Bool)

(assert (=> b!30307 m!44241))

(declare-fun m!44243 () Bool)

(assert (=> b!30307 m!44243))

(assert (=> b!30307 m!43557))

(declare-fun m!44245 () Bool)

(assert (=> b!30307 m!44245))

(declare-fun m!44247 () Bool)

(assert (=> b!30307 m!44247))

(declare-fun m!44249 () Bool)

(assert (=> b!30307 m!44249))

(declare-fun m!44251 () Bool)

(assert (=> b!30307 m!44251))

(assert (=> b!30307 m!44239))

(declare-fun m!44253 () Bool)

(assert (=> b!30307 m!44253))

(declare-fun m!44255 () Bool)

(assert (=> b!30307 m!44255))

(declare-fun m!44257 () Bool)

(assert (=> b!30307 m!44257))

(declare-fun m!44259 () Bool)

(assert (=> b!30307 m!44259))

(assert (=> b!30307 m!44259))

(declare-fun m!44261 () Bool)

(assert (=> b!30307 m!44261))

(declare-fun m!44263 () Bool)

(assert (=> b!30307 m!44263))

(declare-fun m!44265 () Bool)

(assert (=> b!30307 m!44265))

(declare-fun m!44267 () Bool)

(assert (=> b!30307 m!44267))

(declare-fun m!44269 () Bool)

(assert (=> b!30307 m!44269))

(declare-fun m!44271 () Bool)

(assert (=> b!30307 m!44271))

(assert (=> b!30307 m!44227))

(assert (=> b!30307 m!44231))

(declare-fun m!44273 () Bool)

(assert (=> b!30307 m!44273))

(declare-fun m!44275 () Bool)

(assert (=> b!30312 m!44275))

(declare-fun m!44277 () Bool)

(assert (=> b!30311 m!44277))

(declare-fun m!44279 () Bool)

(assert (=> b!30309 m!44279))

(declare-fun m!44281 () Bool)

(assert (=> b!30309 m!44281))

(declare-fun m!44283 () Bool)

(assert (=> bm!385 m!44283))

(assert (=> b!29943 d!8614))

(declare-fun d!8722 () Bool)

(declare-fun res!26063 () Bool)

(declare-fun e!20206 () Bool)

(assert (=> d!8722 (=> (not res!26063) (not e!20206))))

(assert (=> d!8722 (= res!26063 (= (size!775 (buf!1103 thiss!1379)) (size!775 (buf!1103 (_2!1672 lt!43248)))))))

(assert (=> d!8722 (= (isPrefixOf!0 thiss!1379 (_2!1672 lt!43248)) e!20206)))

(declare-fun b!30315 () Bool)

(declare-fun res!26064 () Bool)

(assert (=> b!30315 (=> (not res!26064) (not e!20206))))

(assert (=> b!30315 (= res!26064 (bvsle (bitIndex!0 (size!775 (buf!1103 thiss!1379)) (currentByte!2446 thiss!1379) (currentBit!2441 thiss!1379)) (bitIndex!0 (size!775 (buf!1103 (_2!1672 lt!43248))) (currentByte!2446 (_2!1672 lt!43248)) (currentBit!2441 (_2!1672 lt!43248)))))))

(declare-fun b!30316 () Bool)

(declare-fun e!20207 () Bool)

(assert (=> b!30316 (= e!20206 e!20207)))

(declare-fun res!26062 () Bool)

(assert (=> b!30316 (=> res!26062 e!20207)))

(assert (=> b!30316 (= res!26062 (= (size!775 (buf!1103 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!30317 () Bool)

(assert (=> b!30317 (= e!20207 (arrayBitRangesEq!0 (buf!1103 thiss!1379) (buf!1103 (_2!1672 lt!43248)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!775 (buf!1103 thiss!1379)) (currentByte!2446 thiss!1379) (currentBit!2441 thiss!1379))))))

(assert (= (and d!8722 res!26063) b!30315))

(assert (= (and b!30315 res!26064) b!30316))

(assert (= (and b!30316 (not res!26062)) b!30317))

(assert (=> b!30315 m!43585))

(assert (=> b!30315 m!43563))

(assert (=> b!30317 m!43585))

(assert (=> b!30317 m!43585))

(declare-fun m!44285 () Bool)

(assert (=> b!30317 m!44285))

(assert (=> b!29943 d!8722))

(declare-fun b!30328 () Bool)

(declare-fun e!20213 () Unit!2319)

(declare-fun lt!44044 () Unit!2319)

(assert (=> b!30328 (= e!20213 lt!44044)))

(declare-fun lt!44043 () (_ BitVec 64))

(assert (=> b!30328 (= lt!44043 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44036 () (_ BitVec 64))

(assert (=> b!30328 (= lt!44036 (bitIndex!0 (size!775 (buf!1103 thiss!1379)) (currentByte!2446 thiss!1379) (currentBit!2441 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1778 array!1778 (_ BitVec 64) (_ BitVec 64)) Unit!2319)

(assert (=> b!30328 (= lt!44044 (arrayBitRangesEqSymmetric!0 (buf!1103 thiss!1379) (buf!1103 (_2!1672 lt!43242)) lt!44043 lt!44036))))

(assert (=> b!30328 (arrayBitRangesEq!0 (buf!1103 (_2!1672 lt!43242)) (buf!1103 thiss!1379) lt!44043 lt!44036)))

(declare-fun b!30329 () Bool)

(declare-fun res!26071 () Bool)

(declare-fun e!20212 () Bool)

(assert (=> b!30329 (=> (not res!26071) (not e!20212))))

(declare-fun lt!44040 () tuple2!3172)

(assert (=> b!30329 (= res!26071 (isPrefixOf!0 (_2!1673 lt!44040) (_2!1672 lt!43242)))))

(declare-fun b!30330 () Bool)

(declare-fun res!26073 () Bool)

(assert (=> b!30330 (=> (not res!26073) (not e!20212))))

(assert (=> b!30330 (= res!26073 (isPrefixOf!0 (_1!1673 lt!44040) thiss!1379))))

(declare-fun d!8724 () Bool)

(assert (=> d!8724 e!20212))

(declare-fun res!26072 () Bool)

(assert (=> d!8724 (=> (not res!26072) (not e!20212))))

(assert (=> d!8724 (= res!26072 (isPrefixOf!0 (_1!1673 lt!44040) (_2!1673 lt!44040)))))

(declare-fun lt!44037 () BitStream!1366)

(assert (=> d!8724 (= lt!44040 (tuple2!3173 lt!44037 (_2!1672 lt!43242)))))

(declare-fun lt!44045 () Unit!2319)

(declare-fun lt!44039 () Unit!2319)

(assert (=> d!8724 (= lt!44045 lt!44039)))

(assert (=> d!8724 (isPrefixOf!0 lt!44037 (_2!1672 lt!43242))))

(assert (=> d!8724 (= lt!44039 (lemmaIsPrefixTransitive!0 lt!44037 (_2!1672 lt!43242) (_2!1672 lt!43242)))))

(declare-fun lt!44031 () Unit!2319)

(declare-fun lt!44042 () Unit!2319)

(assert (=> d!8724 (= lt!44031 lt!44042)))

(assert (=> d!8724 (isPrefixOf!0 lt!44037 (_2!1672 lt!43242))))

(assert (=> d!8724 (= lt!44042 (lemmaIsPrefixTransitive!0 lt!44037 thiss!1379 (_2!1672 lt!43242)))))

(declare-fun lt!44048 () Unit!2319)

(assert (=> d!8724 (= lt!44048 e!20213)))

(declare-fun c!2010 () Bool)

(assert (=> d!8724 (= c!2010 (not (= (size!775 (buf!1103 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!44047 () Unit!2319)

(declare-fun lt!44035 () Unit!2319)

(assert (=> d!8724 (= lt!44047 lt!44035)))

(assert (=> d!8724 (isPrefixOf!0 (_2!1672 lt!43242) (_2!1672 lt!43242))))

(assert (=> d!8724 (= lt!44035 (lemmaIsPrefixRefl!0 (_2!1672 lt!43242)))))

(declare-fun lt!44034 () Unit!2319)

(declare-fun lt!44050 () Unit!2319)

(assert (=> d!8724 (= lt!44034 lt!44050)))

(assert (=> d!8724 (= lt!44050 (lemmaIsPrefixRefl!0 (_2!1672 lt!43242)))))

(declare-fun lt!44041 () Unit!2319)

(declare-fun lt!44046 () Unit!2319)

(assert (=> d!8724 (= lt!44041 lt!44046)))

(assert (=> d!8724 (isPrefixOf!0 lt!44037 lt!44037)))

(assert (=> d!8724 (= lt!44046 (lemmaIsPrefixRefl!0 lt!44037))))

(declare-fun lt!44049 () Unit!2319)

(declare-fun lt!44032 () Unit!2319)

(assert (=> d!8724 (= lt!44049 lt!44032)))

(assert (=> d!8724 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!8724 (= lt!44032 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!8724 (= lt!44037 (BitStream!1367 (buf!1103 (_2!1672 lt!43242)) (currentByte!2446 thiss!1379) (currentBit!2441 thiss!1379)))))

(assert (=> d!8724 (isPrefixOf!0 thiss!1379 (_2!1672 lt!43242))))

(assert (=> d!8724 (= (reader!0 thiss!1379 (_2!1672 lt!43242)) lt!44040)))

(declare-fun lt!44038 () (_ BitVec 64))

(declare-fun lt!44033 () (_ BitVec 64))

(declare-fun b!30331 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1366 (_ BitVec 64)) BitStream!1366)

(assert (=> b!30331 (= e!20212 (= (_1!1673 lt!44040) (withMovedBitIndex!0 (_2!1673 lt!44040) (bvsub lt!44033 lt!44038))))))

(assert (=> b!30331 (or (= (bvand lt!44033 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!44038 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!44033 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!44033 lt!44038) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30331 (= lt!44038 (bitIndex!0 (size!775 (buf!1103 (_2!1672 lt!43242))) (currentByte!2446 (_2!1672 lt!43242)) (currentBit!2441 (_2!1672 lt!43242))))))

(assert (=> b!30331 (= lt!44033 (bitIndex!0 (size!775 (buf!1103 thiss!1379)) (currentByte!2446 thiss!1379) (currentBit!2441 thiss!1379)))))

(declare-fun b!30332 () Bool)

(declare-fun Unit!2342 () Unit!2319)

(assert (=> b!30332 (= e!20213 Unit!2342)))

(assert (= (and d!8724 c!2010) b!30328))

(assert (= (and d!8724 (not c!2010)) b!30332))

(assert (= (and d!8724 res!26072) b!30330))

(assert (= (and b!30330 res!26073) b!30329))

(assert (= (and b!30329 res!26071) b!30331))

(declare-fun m!44287 () Bool)

(assert (=> b!30329 m!44287))

(declare-fun m!44289 () Bool)

(assert (=> b!30331 m!44289))

(assert (=> b!30331 m!43557))

(assert (=> b!30331 m!43585))

(declare-fun m!44291 () Bool)

(assert (=> d!8724 m!44291))

(assert (=> d!8724 m!43583))

(assert (=> d!8724 m!43581))

(assert (=> d!8724 m!44197))

(assert (=> d!8724 m!43617))

(declare-fun m!44293 () Bool)

(assert (=> d!8724 m!44293))

(declare-fun m!44295 () Bool)

(assert (=> d!8724 m!44295))

(assert (=> d!8724 m!44199))

(declare-fun m!44297 () Bool)

(assert (=> d!8724 m!44297))

(declare-fun m!44299 () Bool)

(assert (=> d!8724 m!44299))

(declare-fun m!44301 () Bool)

(assert (=> d!8724 m!44301))

(assert (=> b!30328 m!43585))

(declare-fun m!44303 () Bool)

(assert (=> b!30328 m!44303))

(declare-fun m!44305 () Bool)

(assert (=> b!30328 m!44305))

(declare-fun m!44307 () Bool)

(assert (=> b!30330 m!44307))

(assert (=> b!29943 d!8724))

(declare-fun d!8726 () Bool)

(assert (=> d!8726 (isPrefixOf!0 thiss!1379 (_2!1672 lt!43248))))

(declare-fun lt!44053 () Unit!2319)

(declare-fun choose!30 (BitStream!1366 BitStream!1366 BitStream!1366) Unit!2319)

(assert (=> d!8726 (= lt!44053 (choose!30 thiss!1379 (_2!1672 lt!43242) (_2!1672 lt!43248)))))

(assert (=> d!8726 (isPrefixOf!0 thiss!1379 (_2!1672 lt!43242))))

(assert (=> d!8726 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1672 lt!43242) (_2!1672 lt!43248)) lt!44053)))

(declare-fun bs!2444 () Bool)

(assert (= bs!2444 d!8726))

(assert (=> bs!2444 m!43577))

(declare-fun m!44309 () Bool)

(assert (=> bs!2444 m!44309))

(assert (=> bs!2444 m!43617))

(assert (=> b!29943 d!8726))

(declare-fun d!8728 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!8728 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!775 (buf!1103 (_2!1672 lt!43242)))) ((_ sign_extend 32) (currentByte!2446 thiss!1379)) ((_ sign_extend 32) (currentBit!2441 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!775 (buf!1103 (_2!1672 lt!43242)))) ((_ sign_extend 32) (currentByte!2446 thiss!1379)) ((_ sign_extend 32) (currentBit!2441 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2445 () Bool)

(assert (= bs!2445 d!8728))

(declare-fun m!44311 () Bool)

(assert (=> bs!2445 m!44311))

(assert (=> b!29943 d!8728))

(declare-fun d!8730 () Bool)

(assert (=> d!8730 (validate_offset_bits!1 ((_ sign_extend 32) (size!775 (buf!1103 (_2!1672 lt!43242)))) ((_ sign_extend 32) (currentByte!2446 thiss!1379)) ((_ sign_extend 32) (currentBit!2441 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!44056 () Unit!2319)

(declare-fun choose!9 (BitStream!1366 array!1778 (_ BitVec 64) BitStream!1366) Unit!2319)

(assert (=> d!8730 (= lt!44056 (choose!9 thiss!1379 (buf!1103 (_2!1672 lt!43242)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1367 (buf!1103 (_2!1672 lt!43242)) (currentByte!2446 thiss!1379) (currentBit!2441 thiss!1379))))))

(assert (=> d!8730 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1103 (_2!1672 lt!43242)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!44056)))

(declare-fun bs!2446 () Bool)

(assert (= bs!2446 d!8730))

(assert (=> bs!2446 m!43569))

(declare-fun m!44313 () Bool)

(assert (=> bs!2446 m!44313))

(assert (=> b!29943 d!8730))

(declare-fun b!30353 () Bool)

(declare-datatypes ((tuple2!3192 0))(
  ( (tuple2!3193 (_1!1683 Bool) (_2!1683 BitStream!1366)) )
))
(declare-fun lt!44077 () tuple2!3192)

(declare-fun lt!44078 () (_ BitVec 64))

(declare-datatypes ((tuple2!3194 0))(
  ( (tuple2!3195 (_1!1684 List!384) (_2!1684 BitStream!1366)) )
))
(declare-fun e!20225 () tuple2!3194)

(assert (=> b!30353 (= e!20225 (tuple2!3195 (Cons!380 (_1!1683 lt!44077) (bitStreamReadBitsIntoList!0 (_2!1672 lt!43248) (_2!1683 lt!44077) (bvsub lt!43257 lt!44078))) (_2!1683 lt!44077)))))

(declare-fun readBit!0 (BitStream!1366) tuple2!3192)

(assert (=> b!30353 (= lt!44077 (readBit!0 (_1!1673 lt!43253)))))

(assert (=> b!30353 (= lt!44078 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!30355 () Bool)

(declare-fun e!20224 () Bool)

(declare-fun lt!44079 () List!384)

(assert (=> b!30355 (= e!20224 (> (length!110 lt!44079) 0))))

(declare-fun b!30352 () Bool)

(assert (=> b!30352 (= e!20225 (tuple2!3195 Nil!381 (_1!1673 lt!43253)))))

(declare-fun d!8732 () Bool)

(assert (=> d!8732 e!20224))

(declare-fun c!2016 () Bool)

(assert (=> d!8732 (= c!2016 (= lt!43257 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8732 (= lt!44079 (_1!1684 e!20225))))

(declare-fun c!2015 () Bool)

(assert (=> d!8732 (= c!2015 (= lt!43257 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8732 (bvsge lt!43257 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8732 (= (bitStreamReadBitsIntoList!0 (_2!1672 lt!43248) (_1!1673 lt!43253) lt!43257) lt!44079)))

(declare-fun b!30354 () Bool)

(declare-fun isEmpty!80 (List!384) Bool)

(assert (=> b!30354 (= e!20224 (isEmpty!80 lt!44079))))

(assert (= (and d!8732 c!2015) b!30352))

(assert (= (and d!8732 (not c!2015)) b!30353))

(assert (= (and d!8732 c!2016) b!30354))

(assert (= (and d!8732 (not c!2016)) b!30355))

(declare-fun m!44315 () Bool)

(assert (=> b!30353 m!44315))

(declare-fun m!44317 () Bool)

(assert (=> b!30353 m!44317))

(declare-fun m!44319 () Bool)

(assert (=> b!30355 m!44319))

(declare-fun m!44321 () Bool)

(assert (=> b!30354 m!44321))

(assert (=> b!29953 d!8732))

(declare-fun b!30361 () Bool)

(declare-fun lt!44090 () tuple2!3192)

(declare-fun lt!44091 () (_ BitVec 64))

(declare-fun e!20227 () tuple2!3194)

(assert (=> b!30361 (= e!20227 (tuple2!3195 (Cons!380 (_1!1683 lt!44090) (bitStreamReadBitsIntoList!0 (_2!1672 lt!43248) (_2!1683 lt!44090) (bvsub (bvsub to!314 i!635) lt!44091))) (_2!1683 lt!44090)))))

(assert (=> b!30361 (= lt!44090 (readBit!0 (_1!1673 lt!43249)))))

(assert (=> b!30361 (= lt!44091 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!30363 () Bool)

(declare-fun e!20226 () Bool)

(declare-fun lt!44092 () List!384)

(assert (=> b!30363 (= e!20226 (> (length!110 lt!44092) 0))))

(declare-fun b!30360 () Bool)

(assert (=> b!30360 (= e!20227 (tuple2!3195 Nil!381 (_1!1673 lt!43249)))))

(declare-fun d!8734 () Bool)

(assert (=> d!8734 e!20226))

(declare-fun c!2018 () Bool)

(assert (=> d!8734 (= c!2018 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8734 (= lt!44092 (_1!1684 e!20227))))

(declare-fun c!2017 () Bool)

(assert (=> d!8734 (= c!2017 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8734 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8734 (= (bitStreamReadBitsIntoList!0 (_2!1672 lt!43248) (_1!1673 lt!43249) (bvsub to!314 i!635)) lt!44092)))

(declare-fun b!30362 () Bool)

(assert (=> b!30362 (= e!20226 (isEmpty!80 lt!44092))))

(assert (= (and d!8734 c!2017) b!30360))

(assert (= (and d!8734 (not c!2017)) b!30361))

(assert (= (and d!8734 c!2018) b!30362))

(assert (= (and d!8734 (not c!2018)) b!30363))

(declare-fun m!44323 () Bool)

(assert (=> b!30361 m!44323))

(declare-fun m!44325 () Bool)

(assert (=> b!30361 m!44325))

(declare-fun m!44327 () Bool)

(assert (=> b!30363 m!44327))

(declare-fun m!44329 () Bool)

(assert (=> b!30362 m!44329))

(assert (=> b!29953 d!8734))

(declare-fun b!30366 () Bool)

(declare-fun e!20231 () Unit!2319)

(declare-fun lt!44106 () Unit!2319)

(assert (=> b!30366 (= e!20231 lt!44106)))

(declare-fun lt!44105 () (_ BitVec 64))

(assert (=> b!30366 (= lt!44105 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44098 () (_ BitVec 64))

(assert (=> b!30366 (= lt!44098 (bitIndex!0 (size!775 (buf!1103 thiss!1379)) (currentByte!2446 thiss!1379) (currentBit!2441 thiss!1379)))))

(assert (=> b!30366 (= lt!44106 (arrayBitRangesEqSymmetric!0 (buf!1103 thiss!1379) (buf!1103 (_2!1672 lt!43248)) lt!44105 lt!44098))))

(assert (=> b!30366 (arrayBitRangesEq!0 (buf!1103 (_2!1672 lt!43248)) (buf!1103 thiss!1379) lt!44105 lt!44098)))

(declare-fun b!30367 () Bool)

(declare-fun res!26090 () Bool)

(declare-fun e!20230 () Bool)

(assert (=> b!30367 (=> (not res!26090) (not e!20230))))

(declare-fun lt!44102 () tuple2!3172)

(assert (=> b!30367 (= res!26090 (isPrefixOf!0 (_2!1673 lt!44102) (_2!1672 lt!43248)))))

(declare-fun b!30368 () Bool)

(declare-fun res!26092 () Bool)

(assert (=> b!30368 (=> (not res!26092) (not e!20230))))

(assert (=> b!30368 (= res!26092 (isPrefixOf!0 (_1!1673 lt!44102) thiss!1379))))

(declare-fun d!8736 () Bool)

(assert (=> d!8736 e!20230))

(declare-fun res!26091 () Bool)

(assert (=> d!8736 (=> (not res!26091) (not e!20230))))

(assert (=> d!8736 (= res!26091 (isPrefixOf!0 (_1!1673 lt!44102) (_2!1673 lt!44102)))))

(declare-fun lt!44099 () BitStream!1366)

(assert (=> d!8736 (= lt!44102 (tuple2!3173 lt!44099 (_2!1672 lt!43248)))))

(declare-fun lt!44107 () Unit!2319)

(declare-fun lt!44101 () Unit!2319)

(assert (=> d!8736 (= lt!44107 lt!44101)))

(assert (=> d!8736 (isPrefixOf!0 lt!44099 (_2!1672 lt!43248))))

(assert (=> d!8736 (= lt!44101 (lemmaIsPrefixTransitive!0 lt!44099 (_2!1672 lt!43248) (_2!1672 lt!43248)))))

(declare-fun lt!44093 () Unit!2319)

(declare-fun lt!44104 () Unit!2319)

(assert (=> d!8736 (= lt!44093 lt!44104)))

(assert (=> d!8736 (isPrefixOf!0 lt!44099 (_2!1672 lt!43248))))

(assert (=> d!8736 (= lt!44104 (lemmaIsPrefixTransitive!0 lt!44099 thiss!1379 (_2!1672 lt!43248)))))

(declare-fun lt!44110 () Unit!2319)

(assert (=> d!8736 (= lt!44110 e!20231)))

(declare-fun c!2019 () Bool)

(assert (=> d!8736 (= c!2019 (not (= (size!775 (buf!1103 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!44109 () Unit!2319)

(declare-fun lt!44097 () Unit!2319)

(assert (=> d!8736 (= lt!44109 lt!44097)))

(assert (=> d!8736 (isPrefixOf!0 (_2!1672 lt!43248) (_2!1672 lt!43248))))

(assert (=> d!8736 (= lt!44097 (lemmaIsPrefixRefl!0 (_2!1672 lt!43248)))))

(declare-fun lt!44096 () Unit!2319)

(declare-fun lt!44112 () Unit!2319)

(assert (=> d!8736 (= lt!44096 lt!44112)))

(assert (=> d!8736 (= lt!44112 (lemmaIsPrefixRefl!0 (_2!1672 lt!43248)))))

(declare-fun lt!44103 () Unit!2319)

(declare-fun lt!44108 () Unit!2319)

(assert (=> d!8736 (= lt!44103 lt!44108)))

(assert (=> d!8736 (isPrefixOf!0 lt!44099 lt!44099)))

(assert (=> d!8736 (= lt!44108 (lemmaIsPrefixRefl!0 lt!44099))))

(declare-fun lt!44111 () Unit!2319)

(declare-fun lt!44094 () Unit!2319)

(assert (=> d!8736 (= lt!44111 lt!44094)))

(assert (=> d!8736 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!8736 (= lt!44094 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!8736 (= lt!44099 (BitStream!1367 (buf!1103 (_2!1672 lt!43248)) (currentByte!2446 thiss!1379) (currentBit!2441 thiss!1379)))))

(assert (=> d!8736 (isPrefixOf!0 thiss!1379 (_2!1672 lt!43248))))

(assert (=> d!8736 (= (reader!0 thiss!1379 (_2!1672 lt!43248)) lt!44102)))

(declare-fun lt!44095 () (_ BitVec 64))

(declare-fun b!30369 () Bool)

(declare-fun lt!44100 () (_ BitVec 64))

(assert (=> b!30369 (= e!20230 (= (_1!1673 lt!44102) (withMovedBitIndex!0 (_2!1673 lt!44102) (bvsub lt!44095 lt!44100))))))

(assert (=> b!30369 (or (= (bvand lt!44095 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!44100 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!44095 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!44095 lt!44100) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30369 (= lt!44100 (bitIndex!0 (size!775 (buf!1103 (_2!1672 lt!43248))) (currentByte!2446 (_2!1672 lt!43248)) (currentBit!2441 (_2!1672 lt!43248))))))

(assert (=> b!30369 (= lt!44095 (bitIndex!0 (size!775 (buf!1103 thiss!1379)) (currentByte!2446 thiss!1379) (currentBit!2441 thiss!1379)))))

(declare-fun b!30370 () Bool)

(declare-fun Unit!2343 () Unit!2319)

(assert (=> b!30370 (= e!20231 Unit!2343)))

(assert (= (and d!8736 c!2019) b!30366))

(assert (= (and d!8736 (not c!2019)) b!30370))

(assert (= (and d!8736 res!26091) b!30368))

(assert (= (and b!30368 res!26092) b!30367))

(assert (= (and b!30367 res!26090) b!30369))

(declare-fun m!44331 () Bool)

(assert (=> b!30367 m!44331))

(declare-fun m!44333 () Bool)

(assert (=> b!30369 m!44333))

(assert (=> b!30369 m!43563))

(assert (=> b!30369 m!43585))

(declare-fun m!44335 () Bool)

(assert (=> d!8736 m!44335))

(assert (=> d!8736 m!43583))

(assert (=> d!8736 m!43581))

(declare-fun m!44337 () Bool)

(assert (=> d!8736 m!44337))

(assert (=> d!8736 m!43577))

(declare-fun m!44339 () Bool)

(assert (=> d!8736 m!44339))

(declare-fun m!44341 () Bool)

(assert (=> d!8736 m!44341))

(declare-fun m!44343 () Bool)

(assert (=> d!8736 m!44343))

(declare-fun m!44345 () Bool)

(assert (=> d!8736 m!44345))

(declare-fun m!44347 () Bool)

(assert (=> d!8736 m!44347))

(declare-fun m!44349 () Bool)

(assert (=> d!8736 m!44349))

(assert (=> b!30366 m!43585))

(declare-fun m!44351 () Bool)

(assert (=> b!30366 m!44351))

(declare-fun m!44353 () Bool)

(assert (=> b!30366 m!44353))

(declare-fun m!44355 () Bool)

(assert (=> b!30368 m!44355))

(assert (=> b!29953 d!8736))

(declare-fun d!8738 () Bool)

(assert (=> d!8738 (validate_offset_bits!1 ((_ sign_extend 32) (size!775 (buf!1103 (_2!1672 lt!43248)))) ((_ sign_extend 32) (currentByte!2446 thiss!1379)) ((_ sign_extend 32) (currentBit!2441 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!44113 () Unit!2319)

(assert (=> d!8738 (= lt!44113 (choose!9 thiss!1379 (buf!1103 (_2!1672 lt!43248)) (bvsub to!314 i!635) (BitStream!1367 (buf!1103 (_2!1672 lt!43248)) (currentByte!2446 thiss!1379) (currentBit!2441 thiss!1379))))))

(assert (=> d!8738 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1103 (_2!1672 lt!43248)) (bvsub to!314 i!635)) lt!44113)))

(declare-fun bs!2447 () Bool)

(assert (= bs!2447 d!8738))

(assert (=> bs!2447 m!43595))

(declare-fun m!44357 () Bool)

(assert (=> bs!2447 m!44357))

(assert (=> b!29953 d!8738))

(declare-fun d!8740 () Bool)

(assert (=> d!8740 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!775 (buf!1103 (_2!1672 lt!43248)))) ((_ sign_extend 32) (currentByte!2446 (_2!1672 lt!43242))) ((_ sign_extend 32) (currentBit!2441 (_2!1672 lt!43242))) lt!43257) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!775 (buf!1103 (_2!1672 lt!43248)))) ((_ sign_extend 32) (currentByte!2446 (_2!1672 lt!43242))) ((_ sign_extend 32) (currentBit!2441 (_2!1672 lt!43242)))) lt!43257))))

(declare-fun bs!2448 () Bool)

(assert (= bs!2448 d!8740))

(declare-fun m!44359 () Bool)

(assert (=> bs!2448 m!44359))

(assert (=> b!29953 d!8740))

(declare-fun d!8742 () Bool)

(assert (=> d!8742 (validate_offset_bits!1 ((_ sign_extend 32) (size!775 (buf!1103 (_2!1672 lt!43248)))) ((_ sign_extend 32) (currentByte!2446 (_2!1672 lt!43242))) ((_ sign_extend 32) (currentBit!2441 (_2!1672 lt!43242))) lt!43257)))

(declare-fun lt!44114 () Unit!2319)

(assert (=> d!8742 (= lt!44114 (choose!9 (_2!1672 lt!43242) (buf!1103 (_2!1672 lt!43248)) lt!43257 (BitStream!1367 (buf!1103 (_2!1672 lt!43248)) (currentByte!2446 (_2!1672 lt!43242)) (currentBit!2441 (_2!1672 lt!43242)))))))

(assert (=> d!8742 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1672 lt!43242) (buf!1103 (_2!1672 lt!43248)) lt!43257) lt!44114)))

(declare-fun bs!2449 () Bool)

(assert (= bs!2449 d!8742))

(assert (=> bs!2449 m!43599))

(declare-fun m!44361 () Bool)

(assert (=> bs!2449 m!44361))

(assert (=> b!29953 d!8742))

(declare-fun d!8744 () Bool)

(assert (=> d!8744 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!775 (buf!1103 (_2!1672 lt!43248)))) ((_ sign_extend 32) (currentByte!2446 thiss!1379)) ((_ sign_extend 32) (currentBit!2441 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!775 (buf!1103 (_2!1672 lt!43248)))) ((_ sign_extend 32) (currentByte!2446 thiss!1379)) ((_ sign_extend 32) (currentBit!2441 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2450 () Bool)

(assert (= bs!2450 d!8744))

(declare-fun m!44363 () Bool)

(assert (=> bs!2450 m!44363))

(assert (=> b!29953 d!8744))

(declare-fun b!30371 () Bool)

(declare-fun e!20233 () Unit!2319)

(declare-fun lt!44128 () Unit!2319)

(assert (=> b!30371 (= e!20233 lt!44128)))

(declare-fun lt!44127 () (_ BitVec 64))

(assert (=> b!30371 (= lt!44127 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44120 () (_ BitVec 64))

(assert (=> b!30371 (= lt!44120 (bitIndex!0 (size!775 (buf!1103 (_2!1672 lt!43242))) (currentByte!2446 (_2!1672 lt!43242)) (currentBit!2441 (_2!1672 lt!43242))))))

(assert (=> b!30371 (= lt!44128 (arrayBitRangesEqSymmetric!0 (buf!1103 (_2!1672 lt!43242)) (buf!1103 (_2!1672 lt!43248)) lt!44127 lt!44120))))

(assert (=> b!30371 (arrayBitRangesEq!0 (buf!1103 (_2!1672 lt!43248)) (buf!1103 (_2!1672 lt!43242)) lt!44127 lt!44120)))

(declare-fun b!30372 () Bool)

(declare-fun res!26093 () Bool)

(declare-fun e!20232 () Bool)

(assert (=> b!30372 (=> (not res!26093) (not e!20232))))

(declare-fun lt!44124 () tuple2!3172)

(assert (=> b!30372 (= res!26093 (isPrefixOf!0 (_2!1673 lt!44124) (_2!1672 lt!43248)))))

(declare-fun b!30373 () Bool)

(declare-fun res!26095 () Bool)

(assert (=> b!30373 (=> (not res!26095) (not e!20232))))

(assert (=> b!30373 (= res!26095 (isPrefixOf!0 (_1!1673 lt!44124) (_2!1672 lt!43242)))))

(declare-fun d!8746 () Bool)

(assert (=> d!8746 e!20232))

(declare-fun res!26094 () Bool)

(assert (=> d!8746 (=> (not res!26094) (not e!20232))))

(assert (=> d!8746 (= res!26094 (isPrefixOf!0 (_1!1673 lt!44124) (_2!1673 lt!44124)))))

(declare-fun lt!44121 () BitStream!1366)

(assert (=> d!8746 (= lt!44124 (tuple2!3173 lt!44121 (_2!1672 lt!43248)))))

(declare-fun lt!44129 () Unit!2319)

(declare-fun lt!44123 () Unit!2319)

(assert (=> d!8746 (= lt!44129 lt!44123)))

(assert (=> d!8746 (isPrefixOf!0 lt!44121 (_2!1672 lt!43248))))

(assert (=> d!8746 (= lt!44123 (lemmaIsPrefixTransitive!0 lt!44121 (_2!1672 lt!43248) (_2!1672 lt!43248)))))

(declare-fun lt!44115 () Unit!2319)

(declare-fun lt!44126 () Unit!2319)

(assert (=> d!8746 (= lt!44115 lt!44126)))

(assert (=> d!8746 (isPrefixOf!0 lt!44121 (_2!1672 lt!43248))))

(assert (=> d!8746 (= lt!44126 (lemmaIsPrefixTransitive!0 lt!44121 (_2!1672 lt!43242) (_2!1672 lt!43248)))))

(declare-fun lt!44132 () Unit!2319)

(assert (=> d!8746 (= lt!44132 e!20233)))

(declare-fun c!2020 () Bool)

(assert (=> d!8746 (= c!2020 (not (= (size!775 (buf!1103 (_2!1672 lt!43242))) #b00000000000000000000000000000000)))))

(declare-fun lt!44131 () Unit!2319)

(declare-fun lt!44119 () Unit!2319)

(assert (=> d!8746 (= lt!44131 lt!44119)))

(assert (=> d!8746 (isPrefixOf!0 (_2!1672 lt!43248) (_2!1672 lt!43248))))

(assert (=> d!8746 (= lt!44119 (lemmaIsPrefixRefl!0 (_2!1672 lt!43248)))))

(declare-fun lt!44118 () Unit!2319)

(declare-fun lt!44134 () Unit!2319)

(assert (=> d!8746 (= lt!44118 lt!44134)))

(assert (=> d!8746 (= lt!44134 (lemmaIsPrefixRefl!0 (_2!1672 lt!43248)))))

(declare-fun lt!44125 () Unit!2319)

(declare-fun lt!44130 () Unit!2319)

(assert (=> d!8746 (= lt!44125 lt!44130)))

(assert (=> d!8746 (isPrefixOf!0 lt!44121 lt!44121)))

(assert (=> d!8746 (= lt!44130 (lemmaIsPrefixRefl!0 lt!44121))))

(declare-fun lt!44133 () Unit!2319)

(declare-fun lt!44116 () Unit!2319)

(assert (=> d!8746 (= lt!44133 lt!44116)))

(assert (=> d!8746 (isPrefixOf!0 (_2!1672 lt!43242) (_2!1672 lt!43242))))

(assert (=> d!8746 (= lt!44116 (lemmaIsPrefixRefl!0 (_2!1672 lt!43242)))))

(assert (=> d!8746 (= lt!44121 (BitStream!1367 (buf!1103 (_2!1672 lt!43248)) (currentByte!2446 (_2!1672 lt!43242)) (currentBit!2441 (_2!1672 lt!43242))))))

(assert (=> d!8746 (isPrefixOf!0 (_2!1672 lt!43242) (_2!1672 lt!43248))))

(assert (=> d!8746 (= (reader!0 (_2!1672 lt!43242) (_2!1672 lt!43248)) lt!44124)))

(declare-fun lt!44117 () (_ BitVec 64))

(declare-fun lt!44122 () (_ BitVec 64))

(declare-fun b!30374 () Bool)

(assert (=> b!30374 (= e!20232 (= (_1!1673 lt!44124) (withMovedBitIndex!0 (_2!1673 lt!44124) (bvsub lt!44117 lt!44122))))))

(assert (=> b!30374 (or (= (bvand lt!44117 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!44122 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!44117 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!44117 lt!44122) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30374 (= lt!44122 (bitIndex!0 (size!775 (buf!1103 (_2!1672 lt!43248))) (currentByte!2446 (_2!1672 lt!43248)) (currentBit!2441 (_2!1672 lt!43248))))))

(assert (=> b!30374 (= lt!44117 (bitIndex!0 (size!775 (buf!1103 (_2!1672 lt!43242))) (currentByte!2446 (_2!1672 lt!43242)) (currentBit!2441 (_2!1672 lt!43242))))))

(declare-fun b!30375 () Bool)

(declare-fun Unit!2344 () Unit!2319)

(assert (=> b!30375 (= e!20233 Unit!2344)))

(assert (= (and d!8746 c!2020) b!30371))

(assert (= (and d!8746 (not c!2020)) b!30375))

(assert (= (and d!8746 res!26094) b!30373))

(assert (= (and b!30373 res!26095) b!30372))

(assert (= (and b!30372 res!26093) b!30374))

(declare-fun m!44365 () Bool)

(assert (=> b!30372 m!44365))

(declare-fun m!44367 () Bool)

(assert (=> b!30374 m!44367))

(assert (=> b!30374 m!43563))

(assert (=> b!30374 m!43557))

(declare-fun m!44369 () Bool)

(assert (=> d!8746 m!44369))

(assert (=> d!8746 m!44199))

(assert (=> d!8746 m!44197))

(assert (=> d!8746 m!44337))

(assert (=> d!8746 m!43565))

(declare-fun m!44371 () Bool)

(assert (=> d!8746 m!44371))

(declare-fun m!44373 () Bool)

(assert (=> d!8746 m!44373))

(assert (=> d!8746 m!44343))

(declare-fun m!44375 () Bool)

(assert (=> d!8746 m!44375))

(declare-fun m!44377 () Bool)

(assert (=> d!8746 m!44377))

(declare-fun m!44379 () Bool)

(assert (=> d!8746 m!44379))

(assert (=> b!30371 m!43557))

(declare-fun m!44381 () Bool)

(assert (=> b!30371 m!44381))

(declare-fun m!44383 () Bool)

(assert (=> b!30371 m!44383))

(declare-fun m!44385 () Bool)

(assert (=> b!30373 m!44385))

(assert (=> b!29953 d!8746))

(declare-fun d!8748 () Bool)

(assert (=> d!8748 (= (array_inv!736 srcBuffer!2) (bvsge (size!775 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!6374 d!8748))

(declare-fun d!8750 () Bool)

(assert (=> d!8750 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2441 thiss!1379) (currentByte!2446 thiss!1379) (size!775 (buf!1103 thiss!1379))))))

(declare-fun bs!2451 () Bool)

(assert (= bs!2451 d!8750))

(declare-fun m!44387 () Bool)

(assert (=> bs!2451 m!44387))

(assert (=> start!6374 d!8750))

(declare-fun d!8752 () Bool)

(declare-fun e!20240 () Bool)

(assert (=> d!8752 e!20240))

(declare-fun res!26109 () Bool)

(assert (=> d!8752 (=> (not res!26109) (not e!20240))))

(declare-fun lt!44162 () (_ BitVec 64))

(declare-fun lt!44164 () (_ BitVec 64))

(declare-fun lt!44163 () (_ BitVec 64))

(assert (=> d!8752 (= res!26109 (= lt!44164 (bvsub lt!44163 lt!44162)))))

(assert (=> d!8752 (or (= (bvand lt!44163 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!44162 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!44163 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!44163 lt!44162) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8752 (= lt!44162 (remainingBits!0 ((_ sign_extend 32) (size!775 (buf!1103 (_2!1672 lt!43242)))) ((_ sign_extend 32) (currentByte!2446 (_2!1672 lt!43242))) ((_ sign_extend 32) (currentBit!2441 (_2!1672 lt!43242)))))))

(declare-fun lt!44160 () (_ BitVec 64))

(declare-fun lt!44159 () (_ BitVec 64))

(assert (=> d!8752 (= lt!44163 (bvmul lt!44160 lt!44159))))

(assert (=> d!8752 (or (= lt!44160 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!44159 (bvsdiv (bvmul lt!44160 lt!44159) lt!44160)))))

(assert (=> d!8752 (= lt!44159 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8752 (= lt!44160 ((_ sign_extend 32) (size!775 (buf!1103 (_2!1672 lt!43242)))))))

(assert (=> d!8752 (= lt!44164 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2446 (_2!1672 lt!43242))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2441 (_2!1672 lt!43242)))))))

(assert (=> d!8752 (invariant!0 (currentBit!2441 (_2!1672 lt!43242)) (currentByte!2446 (_2!1672 lt!43242)) (size!775 (buf!1103 (_2!1672 lt!43242))))))

(assert (=> d!8752 (= (bitIndex!0 (size!775 (buf!1103 (_2!1672 lt!43242))) (currentByte!2446 (_2!1672 lt!43242)) (currentBit!2441 (_2!1672 lt!43242))) lt!44164)))

(declare-fun b!30388 () Bool)

(declare-fun res!26108 () Bool)

(assert (=> b!30388 (=> (not res!26108) (not e!20240))))

(assert (=> b!30388 (= res!26108 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!44164))))

(declare-fun b!30389 () Bool)

(declare-fun lt!44161 () (_ BitVec 64))

(assert (=> b!30389 (= e!20240 (bvsle lt!44164 (bvmul lt!44161 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!30389 (or (= lt!44161 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!44161 #b0000000000000000000000000000000000000000000000000000000000001000) lt!44161)))))

(assert (=> b!30389 (= lt!44161 ((_ sign_extend 32) (size!775 (buf!1103 (_2!1672 lt!43242)))))))

(assert (= (and d!8752 res!26109) b!30388))

(assert (= (and b!30388 res!26108) b!30389))

(declare-fun m!44415 () Bool)

(assert (=> d!8752 m!44415))

(assert (=> d!8752 m!43541))

(assert (=> b!29947 d!8752))

(declare-fun d!8760 () Bool)

(declare-fun res!26111 () Bool)

(declare-fun e!20241 () Bool)

(assert (=> d!8760 (=> (not res!26111) (not e!20241))))

(assert (=> d!8760 (= res!26111 (= (size!775 (buf!1103 thiss!1379)) (size!775 (buf!1103 (_2!1672 lt!43242)))))))

(assert (=> d!8760 (= (isPrefixOf!0 thiss!1379 (_2!1672 lt!43242)) e!20241)))

(declare-fun b!30390 () Bool)

(declare-fun res!26112 () Bool)

(assert (=> b!30390 (=> (not res!26112) (not e!20241))))

(assert (=> b!30390 (= res!26112 (bvsle (bitIndex!0 (size!775 (buf!1103 thiss!1379)) (currentByte!2446 thiss!1379) (currentBit!2441 thiss!1379)) (bitIndex!0 (size!775 (buf!1103 (_2!1672 lt!43242))) (currentByte!2446 (_2!1672 lt!43242)) (currentBit!2441 (_2!1672 lt!43242)))))))

(declare-fun b!30391 () Bool)

(declare-fun e!20242 () Bool)

(assert (=> b!30391 (= e!20241 e!20242)))

(declare-fun res!26110 () Bool)

(assert (=> b!30391 (=> res!26110 e!20242)))

(assert (=> b!30391 (= res!26110 (= (size!775 (buf!1103 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!30392 () Bool)

(assert (=> b!30392 (= e!20242 (arrayBitRangesEq!0 (buf!1103 thiss!1379) (buf!1103 (_2!1672 lt!43242)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!775 (buf!1103 thiss!1379)) (currentByte!2446 thiss!1379) (currentBit!2441 thiss!1379))))))

(assert (= (and d!8760 res!26111) b!30390))

(assert (= (and b!30390 res!26112) b!30391))

(assert (= (and b!30391 (not res!26110)) b!30392))

(assert (=> b!30390 m!43585))

(assert (=> b!30390 m!43557))

(assert (=> b!30392 m!43585))

(assert (=> b!30392 m!43585))

(declare-fun m!44417 () Bool)

(assert (=> b!30392 m!44417))

(assert (=> b!29957 d!8760))

(declare-fun d!8762 () Bool)

(assert (=> d!8762 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!775 (buf!1103 (_2!1672 lt!43242)))) ((_ sign_extend 32) (currentByte!2446 (_2!1672 lt!43242))) ((_ sign_extend 32) (currentBit!2441 (_2!1672 lt!43242))) lt!43257) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!775 (buf!1103 (_2!1672 lt!43242)))) ((_ sign_extend 32) (currentByte!2446 (_2!1672 lt!43242))) ((_ sign_extend 32) (currentBit!2441 (_2!1672 lt!43242)))) lt!43257))))

(declare-fun bs!2452 () Bool)

(assert (= bs!2452 d!8762))

(assert (=> bs!2452 m!44415))

(assert (=> b!29957 d!8762))

(declare-fun d!8764 () Bool)

(declare-fun e!20245 () Bool)

(assert (=> d!8764 e!20245))

(declare-fun res!26115 () Bool)

(assert (=> d!8764 (=> (not res!26115) (not e!20245))))

(assert (=> d!8764 (= res!26115 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!44167 () Unit!2319)

(declare-fun choose!27 (BitStream!1366 BitStream!1366 (_ BitVec 64) (_ BitVec 64)) Unit!2319)

(assert (=> d!8764 (= lt!44167 (choose!27 thiss!1379 (_2!1672 lt!43242) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!8764 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!8764 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1672 lt!43242) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!44167)))

(declare-fun b!30395 () Bool)

(assert (=> b!30395 (= e!20245 (validate_offset_bits!1 ((_ sign_extend 32) (size!775 (buf!1103 (_2!1672 lt!43242)))) ((_ sign_extend 32) (currentByte!2446 (_2!1672 lt!43242))) ((_ sign_extend 32) (currentBit!2441 (_2!1672 lt!43242))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!8764 res!26115) b!30395))

(declare-fun m!44419 () Bool)

(assert (=> d!8764 m!44419))

(declare-fun m!44421 () Bool)

(assert (=> b!30395 m!44421))

(assert (=> b!29957 d!8764))

(declare-fun b!30413 () Bool)

(declare-fun res!26135 () Bool)

(declare-fun e!20256 () Bool)

(assert (=> b!30413 (=> (not res!26135) (not e!20256))))

(declare-fun lt!44193 () tuple2!3170)

(assert (=> b!30413 (= res!26135 (isPrefixOf!0 thiss!1379 (_2!1672 lt!44193)))))

(declare-fun b!30414 () Bool)

(declare-fun e!20255 () Bool)

(declare-fun e!20254 () Bool)

(assert (=> b!30414 (= e!20255 e!20254)))

(declare-fun res!26138 () Bool)

(assert (=> b!30414 (=> (not res!26138) (not e!20254))))

(declare-datatypes ((tuple2!3196 0))(
  ( (tuple2!3197 (_1!1685 BitStream!1366) (_2!1685 Bool)) )
))
(declare-fun lt!44203 () tuple2!3196)

(declare-fun lt!44197 () tuple2!3170)

(declare-fun lt!44195 () (_ BitVec 8))

(assert (=> b!30414 (= res!26138 (and (= (_2!1685 lt!44203) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1238 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!44195)) #b00000000000000000000000000000000))) (= (_1!1685 lt!44203) (_2!1672 lt!44197))))))

(declare-fun lt!44201 () tuple2!3190)

(declare-fun lt!44200 () BitStream!1366)

(assert (=> b!30414 (= lt!44201 (readBits!0 lt!44200 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1366) tuple2!3196)

(assert (=> b!30414 (= lt!44203 (readBitPure!0 lt!44200))))

(declare-fun readerFrom!0 (BitStream!1366 (_ BitVec 32) (_ BitVec 32)) BitStream!1366)

(assert (=> b!30414 (= lt!44200 (readerFrom!0 (_2!1672 lt!44197) (currentBit!2441 thiss!1379) (currentByte!2446 thiss!1379)))))

(declare-fun b!30415 () Bool)

(assert (=> b!30415 (= e!20254 (= (bitIndex!0 (size!775 (buf!1103 (_1!1685 lt!44203))) (currentByte!2446 (_1!1685 lt!44203)) (currentBit!2441 (_1!1685 lt!44203))) (bitIndex!0 (size!775 (buf!1103 (_2!1672 lt!44197))) (currentByte!2446 (_2!1672 lt!44197)) (currentBit!2441 (_2!1672 lt!44197)))))))

(declare-fun d!8766 () Bool)

(assert (=> d!8766 e!20255))

(declare-fun res!26134 () Bool)

(assert (=> d!8766 (=> (not res!26134) (not e!20255))))

(assert (=> d!8766 (= res!26134 (= (size!775 (buf!1103 (_2!1672 lt!44197))) (size!775 (buf!1103 thiss!1379))))))

(declare-fun lt!44194 () array!1778)

(assert (=> d!8766 (= lt!44195 (select (arr!1238 lt!44194) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!8766 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!775 lt!44194)))))

(assert (=> d!8766 (= lt!44194 (array!1779 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!44196 () tuple2!3170)

(assert (=> d!8766 (= lt!44197 (tuple2!3171 (_1!1672 lt!44196) (_2!1672 lt!44196)))))

(assert (=> d!8766 (= lt!44196 lt!44193)))

(assert (=> d!8766 e!20256))

(declare-fun res!26137 () Bool)

(assert (=> d!8766 (=> (not res!26137) (not e!20256))))

(assert (=> d!8766 (= res!26137 (= (size!775 (buf!1103 thiss!1379)) (size!775 (buf!1103 (_2!1672 lt!44193)))))))

(declare-fun lt!44199 () Bool)

(declare-fun appendBit!0 (BitStream!1366 Bool) tuple2!3170)

(assert (=> d!8766 (= lt!44193 (appendBit!0 thiss!1379 lt!44199))))

(assert (=> d!8766 (= lt!44199 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1238 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!8766 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!8766 (= (appendBitFromByte!0 thiss!1379 (select (arr!1238 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!44197)))

(declare-fun b!30416 () Bool)

(declare-fun e!20257 () Bool)

(assert (=> b!30416 (= e!20256 e!20257)))

(declare-fun res!26136 () Bool)

(assert (=> b!30416 (=> (not res!26136) (not e!20257))))

(declare-fun lt!44202 () tuple2!3196)

(assert (=> b!30416 (= res!26136 (and (= (_2!1685 lt!44202) lt!44199) (= (_1!1685 lt!44202) (_2!1672 lt!44193))))))

(assert (=> b!30416 (= lt!44202 (readBitPure!0 (readerFrom!0 (_2!1672 lt!44193) (currentBit!2441 thiss!1379) (currentByte!2446 thiss!1379))))))

(declare-fun b!30417 () Bool)

(declare-fun res!26133 () Bool)

(assert (=> b!30417 (=> (not res!26133) (not e!20256))))

(assert (=> b!30417 (= res!26133 (= (bitIndex!0 (size!775 (buf!1103 (_2!1672 lt!44193))) (currentByte!2446 (_2!1672 lt!44193)) (currentBit!2441 (_2!1672 lt!44193))) (bvadd (bitIndex!0 (size!775 (buf!1103 thiss!1379)) (currentByte!2446 thiss!1379) (currentBit!2441 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!30418 () Bool)

(assert (=> b!30418 (= e!20257 (= (bitIndex!0 (size!775 (buf!1103 (_1!1685 lt!44202))) (currentByte!2446 (_1!1685 lt!44202)) (currentBit!2441 (_1!1685 lt!44202))) (bitIndex!0 (size!775 (buf!1103 (_2!1672 lt!44193))) (currentByte!2446 (_2!1672 lt!44193)) (currentBit!2441 (_2!1672 lt!44193)))))))

(declare-fun b!30419 () Bool)

(declare-fun res!26132 () Bool)

(assert (=> b!30419 (=> (not res!26132) (not e!20255))))

(assert (=> b!30419 (= res!26132 (isPrefixOf!0 thiss!1379 (_2!1672 lt!44197)))))

(declare-fun b!30420 () Bool)

(declare-fun res!26139 () Bool)

(assert (=> b!30420 (=> (not res!26139) (not e!20255))))

(declare-fun lt!44192 () (_ BitVec 64))

(declare-fun lt!44198 () (_ BitVec 64))

(assert (=> b!30420 (= res!26139 (= (bitIndex!0 (size!775 (buf!1103 (_2!1672 lt!44197))) (currentByte!2446 (_2!1672 lt!44197)) (currentBit!2441 (_2!1672 lt!44197))) (bvadd lt!44198 lt!44192)))))

(assert (=> b!30420 (or (not (= (bvand lt!44198 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!44192 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!44198 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!44198 lt!44192) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30420 (= lt!44192 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!30420 (= lt!44198 (bitIndex!0 (size!775 (buf!1103 thiss!1379)) (currentByte!2446 thiss!1379) (currentBit!2441 thiss!1379)))))

(assert (= (and d!8766 res!26137) b!30417))

(assert (= (and b!30417 res!26133) b!30413))

(assert (= (and b!30413 res!26135) b!30416))

(assert (= (and b!30416 res!26136) b!30418))

(assert (= (and d!8766 res!26134) b!30420))

(assert (= (and b!30420 res!26139) b!30419))

(assert (= (and b!30419 res!26132) b!30414))

(assert (= (and b!30414 res!26138) b!30415))

(declare-fun m!44423 () Bool)

(assert (=> b!30417 m!44423))

(assert (=> b!30417 m!43585))

(declare-fun m!44425 () Bool)

(assert (=> b!30415 m!44425))

(declare-fun m!44427 () Bool)

(assert (=> b!30415 m!44427))

(declare-fun m!44429 () Bool)

(assert (=> b!30414 m!44429))

(declare-fun m!44431 () Bool)

(assert (=> b!30414 m!44431))

(declare-fun m!44433 () Bool)

(assert (=> b!30414 m!44433))

(declare-fun m!44435 () Bool)

(assert (=> b!30419 m!44435))

(declare-fun m!44437 () Bool)

(assert (=> b!30413 m!44437))

(declare-fun m!44439 () Bool)

(assert (=> d!8766 m!44439))

(declare-fun m!44441 () Bool)

(assert (=> d!8766 m!44441))

(declare-fun m!44443 () Bool)

(assert (=> d!8766 m!44443))

(declare-fun m!44445 () Bool)

(assert (=> b!30416 m!44445))

(assert (=> b!30416 m!44445))

(declare-fun m!44447 () Bool)

(assert (=> b!30416 m!44447))

(assert (=> b!30420 m!44427))

(assert (=> b!30420 m!43585))

(declare-fun m!44449 () Bool)

(assert (=> b!30418 m!44449))

(assert (=> b!30418 m!44423))

(assert (=> b!29957 d!8766))

(declare-fun d!8768 () Bool)

(declare-fun e!20258 () Bool)

(assert (=> d!8768 e!20258))

(declare-fun res!26141 () Bool)

(assert (=> d!8768 (=> (not res!26141) (not e!20258))))

(declare-fun lt!44208 () (_ BitVec 64))

(declare-fun lt!44207 () (_ BitVec 64))

(declare-fun lt!44209 () (_ BitVec 64))

(assert (=> d!8768 (= res!26141 (= lt!44209 (bvsub lt!44208 lt!44207)))))

(assert (=> d!8768 (or (= (bvand lt!44208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!44207 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!44208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!44208 lt!44207) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8768 (= lt!44207 (remainingBits!0 ((_ sign_extend 32) (size!775 (buf!1103 (_2!1672 lt!43248)))) ((_ sign_extend 32) (currentByte!2446 (_2!1672 lt!43248))) ((_ sign_extend 32) (currentBit!2441 (_2!1672 lt!43248)))))))

(declare-fun lt!44205 () (_ BitVec 64))

(declare-fun lt!44204 () (_ BitVec 64))

(assert (=> d!8768 (= lt!44208 (bvmul lt!44205 lt!44204))))

(assert (=> d!8768 (or (= lt!44205 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!44204 (bvsdiv (bvmul lt!44205 lt!44204) lt!44205)))))

(assert (=> d!8768 (= lt!44204 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8768 (= lt!44205 ((_ sign_extend 32) (size!775 (buf!1103 (_2!1672 lt!43248)))))))

(assert (=> d!8768 (= lt!44209 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2446 (_2!1672 lt!43248))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2441 (_2!1672 lt!43248)))))))

(assert (=> d!8768 (invariant!0 (currentBit!2441 (_2!1672 lt!43248)) (currentByte!2446 (_2!1672 lt!43248)) (size!775 (buf!1103 (_2!1672 lt!43248))))))

(assert (=> d!8768 (= (bitIndex!0 (size!775 (buf!1103 (_2!1672 lt!43248))) (currentByte!2446 (_2!1672 lt!43248)) (currentBit!2441 (_2!1672 lt!43248))) lt!44209)))

(declare-fun b!30421 () Bool)

(declare-fun res!26140 () Bool)

(assert (=> b!30421 (=> (not res!26140) (not e!20258))))

(assert (=> b!30421 (= res!26140 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!44209))))

(declare-fun b!30422 () Bool)

(declare-fun lt!44206 () (_ BitVec 64))

(assert (=> b!30422 (= e!20258 (bvsle lt!44209 (bvmul lt!44206 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!30422 (or (= lt!44206 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!44206 #b0000000000000000000000000000000000000000000000000000000000001000) lt!44206)))))

(assert (=> b!30422 (= lt!44206 ((_ sign_extend 32) (size!775 (buf!1103 (_2!1672 lt!43248)))))))

(assert (= (and d!8768 res!26141) b!30421))

(assert (= (and b!30421 res!26140) b!30422))

(declare-fun m!44451 () Bool)

(assert (=> d!8768 m!44451))

(assert (=> d!8768 m!43579))

(assert (=> b!29946 d!8768))

(declare-fun d!8770 () Bool)

(declare-fun size!779 (List!384) Int)

(assert (=> d!8770 (= (length!110 lt!43247) (size!779 lt!43247))))

(declare-fun bs!2453 () Bool)

(assert (= bs!2453 d!8770))

(declare-fun m!44453 () Bool)

(assert (=> bs!2453 m!44453))

(assert (=> b!29956 d!8770))

(declare-fun d!8772 () Bool)

(assert (=> d!8772 (= (invariant!0 (currentBit!2441 (_2!1672 lt!43248)) (currentByte!2446 (_2!1672 lt!43248)) (size!775 (buf!1103 (_2!1672 lt!43248)))) (and (bvsge (currentBit!2441 (_2!1672 lt!43248)) #b00000000000000000000000000000000) (bvslt (currentBit!2441 (_2!1672 lt!43248)) #b00000000000000000000000000001000) (bvsge (currentByte!2446 (_2!1672 lt!43248)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2446 (_2!1672 lt!43248)) (size!775 (buf!1103 (_2!1672 lt!43248)))) (and (= (currentBit!2441 (_2!1672 lt!43248)) #b00000000000000000000000000000000) (= (currentByte!2446 (_2!1672 lt!43248)) (size!775 (buf!1103 (_2!1672 lt!43248))))))))))

(assert (=> b!29945 d!8772))

(declare-fun d!8774 () Bool)

(declare-fun res!26143 () Bool)

(declare-fun e!20259 () Bool)

(assert (=> d!8774 (=> (not res!26143) (not e!20259))))

(assert (=> d!8774 (= res!26143 (= (size!775 (buf!1103 thiss!1379)) (size!775 (buf!1103 thiss!1379))))))

(assert (=> d!8774 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!20259)))

(declare-fun b!30423 () Bool)

(declare-fun res!26144 () Bool)

(assert (=> b!30423 (=> (not res!26144) (not e!20259))))

(assert (=> b!30423 (= res!26144 (bvsle (bitIndex!0 (size!775 (buf!1103 thiss!1379)) (currentByte!2446 thiss!1379) (currentBit!2441 thiss!1379)) (bitIndex!0 (size!775 (buf!1103 thiss!1379)) (currentByte!2446 thiss!1379) (currentBit!2441 thiss!1379))))))

(declare-fun b!30424 () Bool)

(declare-fun e!20260 () Bool)

(assert (=> b!30424 (= e!20259 e!20260)))

(declare-fun res!26142 () Bool)

(assert (=> b!30424 (=> res!26142 e!20260)))

(assert (=> b!30424 (= res!26142 (= (size!775 (buf!1103 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!30425 () Bool)

(assert (=> b!30425 (= e!20260 (arrayBitRangesEq!0 (buf!1103 thiss!1379) (buf!1103 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!775 (buf!1103 thiss!1379)) (currentByte!2446 thiss!1379) (currentBit!2441 thiss!1379))))))

(assert (= (and d!8774 res!26143) b!30423))

(assert (= (and b!30423 res!26144) b!30424))

(assert (= (and b!30424 (not res!26142)) b!30425))

(assert (=> b!30423 m!43585))

(assert (=> b!30423 m!43585))

(assert (=> b!30425 m!43585))

(assert (=> b!30425 m!43585))

(declare-fun m!44455 () Bool)

(assert (=> b!30425 m!44455))

(assert (=> b!29949 d!8774))

(declare-fun d!8776 () Bool)

(assert (=> d!8776 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!44212 () Unit!2319)

(declare-fun choose!11 (BitStream!1366) Unit!2319)

(assert (=> d!8776 (= lt!44212 (choose!11 thiss!1379))))

(assert (=> d!8776 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!44212)))

(declare-fun bs!2455 () Bool)

(assert (= bs!2455 d!8776))

(assert (=> bs!2455 m!43581))

(declare-fun m!44457 () Bool)

(assert (=> bs!2455 m!44457))

(assert (=> b!29949 d!8776))

(declare-fun d!8778 () Bool)

(declare-fun e!20261 () Bool)

(assert (=> d!8778 e!20261))

(declare-fun res!26146 () Bool)

(assert (=> d!8778 (=> (not res!26146) (not e!20261))))

(declare-fun lt!44216 () (_ BitVec 64))

(declare-fun lt!44218 () (_ BitVec 64))

(declare-fun lt!44217 () (_ BitVec 64))

(assert (=> d!8778 (= res!26146 (= lt!44218 (bvsub lt!44217 lt!44216)))))

(assert (=> d!8778 (or (= (bvand lt!44217 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!44216 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!44217 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!44217 lt!44216) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8778 (= lt!44216 (remainingBits!0 ((_ sign_extend 32) (size!775 (buf!1103 thiss!1379))) ((_ sign_extend 32) (currentByte!2446 thiss!1379)) ((_ sign_extend 32) (currentBit!2441 thiss!1379))))))

(declare-fun lt!44214 () (_ BitVec 64))

(declare-fun lt!44213 () (_ BitVec 64))

(assert (=> d!8778 (= lt!44217 (bvmul lt!44214 lt!44213))))

(assert (=> d!8778 (or (= lt!44214 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!44213 (bvsdiv (bvmul lt!44214 lt!44213) lt!44214)))))

(assert (=> d!8778 (= lt!44213 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8778 (= lt!44214 ((_ sign_extend 32) (size!775 (buf!1103 thiss!1379))))))

(assert (=> d!8778 (= lt!44218 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2446 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2441 thiss!1379))))))

(assert (=> d!8778 (invariant!0 (currentBit!2441 thiss!1379) (currentByte!2446 thiss!1379) (size!775 (buf!1103 thiss!1379)))))

(assert (=> d!8778 (= (bitIndex!0 (size!775 (buf!1103 thiss!1379)) (currentByte!2446 thiss!1379) (currentBit!2441 thiss!1379)) lt!44218)))

(declare-fun b!30426 () Bool)

(declare-fun res!26145 () Bool)

(assert (=> b!30426 (=> (not res!26145) (not e!20261))))

(assert (=> b!30426 (= res!26145 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!44218))))

(declare-fun b!30427 () Bool)

(declare-fun lt!44215 () (_ BitVec 64))

(assert (=> b!30427 (= e!20261 (bvsle lt!44218 (bvmul lt!44215 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!30427 (or (= lt!44215 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!44215 #b0000000000000000000000000000000000000000000000000000000000001000) lt!44215)))))

(assert (=> b!30427 (= lt!44215 ((_ sign_extend 32) (size!775 (buf!1103 thiss!1379))))))

(assert (= (and d!8778 res!26146) b!30426))

(assert (= (and b!30426 res!26145) b!30427))

(declare-fun m!44459 () Bool)

(assert (=> d!8778 m!44459))

(assert (=> d!8778 m!44387))

(assert (=> b!29949 d!8778))

(declare-fun d!8780 () Bool)

(assert (=> d!8780 (= (invariant!0 (currentBit!2441 (_2!1672 lt!43242)) (currentByte!2446 (_2!1672 lt!43242)) (size!775 (buf!1103 (_2!1672 lt!43248)))) (and (bvsge (currentBit!2441 (_2!1672 lt!43242)) #b00000000000000000000000000000000) (bvslt (currentBit!2441 (_2!1672 lt!43242)) #b00000000000000000000000000001000) (bvsge (currentByte!2446 (_2!1672 lt!43242)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2446 (_2!1672 lt!43242)) (size!775 (buf!1103 (_2!1672 lt!43248)))) (and (= (currentBit!2441 (_2!1672 lt!43242)) #b00000000000000000000000000000000) (= (currentByte!2446 (_2!1672 lt!43242)) (size!775 (buf!1103 (_2!1672 lt!43248))))))))))

(assert (=> b!29959 d!8780))

(declare-fun d!8782 () Bool)

(assert (=> d!8782 (= (head!221 (byteArrayBitContentToList!0 (_2!1672 lt!43242) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!499 (byteArrayBitContentToList!0 (_2!1672 lt!43242) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!29948 d!8782))

(declare-fun d!8784 () Bool)

(declare-fun c!2023 () Bool)

(assert (=> d!8784 (= c!2023 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!20264 () List!384)

(assert (=> d!8784 (= (byteArrayBitContentToList!0 (_2!1672 lt!43242) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!20264)))

(declare-fun b!30432 () Bool)

(assert (=> b!30432 (= e!20264 Nil!381)))

(declare-fun b!30433 () Bool)

(assert (=> b!30433 (= e!20264 (Cons!380 (not (= (bvand ((_ sign_extend 24) (select (arr!1238 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1672 lt!43242) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!8784 c!2023) b!30432))

(assert (= (and d!8784 (not c!2023)) b!30433))

(assert (=> b!30433 m!43613))

(assert (=> b!30433 m!44443))

(declare-fun m!44461 () Bool)

(assert (=> b!30433 m!44461))

(assert (=> b!29948 d!8784))

(declare-fun d!8786 () Bool)

(assert (=> d!8786 (= (head!221 (bitStreamReadBitsIntoList!0 (_2!1672 lt!43242) (_1!1673 lt!43250) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!499 (bitStreamReadBitsIntoList!0 (_2!1672 lt!43242) (_1!1673 lt!43250) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!29948 d!8786))

(declare-fun lt!44220 () (_ BitVec 64))

(declare-fun e!20266 () tuple2!3194)

(declare-fun b!30435 () Bool)

(declare-fun lt!44219 () tuple2!3192)

(assert (=> b!30435 (= e!20266 (tuple2!3195 (Cons!380 (_1!1683 lt!44219) (bitStreamReadBitsIntoList!0 (_2!1672 lt!43242) (_2!1683 lt!44219) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!44220))) (_2!1683 lt!44219)))))

(assert (=> b!30435 (= lt!44219 (readBit!0 (_1!1673 lt!43250)))))

(assert (=> b!30435 (= lt!44220 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!30437 () Bool)

(declare-fun e!20265 () Bool)

(declare-fun lt!44221 () List!384)

(assert (=> b!30437 (= e!20265 (> (length!110 lt!44221) 0))))

(declare-fun b!30434 () Bool)

(assert (=> b!30434 (= e!20266 (tuple2!3195 Nil!381 (_1!1673 lt!43250)))))

(declare-fun d!8788 () Bool)

(assert (=> d!8788 e!20265))

(declare-fun c!2025 () Bool)

(assert (=> d!8788 (= c!2025 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8788 (= lt!44221 (_1!1684 e!20266))))

(declare-fun c!2024 () Bool)

(assert (=> d!8788 (= c!2024 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8788 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8788 (= (bitStreamReadBitsIntoList!0 (_2!1672 lt!43242) (_1!1673 lt!43250) #b0000000000000000000000000000000000000000000000000000000000000001) lt!44221)))

(declare-fun b!30436 () Bool)

(assert (=> b!30436 (= e!20265 (isEmpty!80 lt!44221))))

(assert (= (and d!8788 c!2024) b!30434))

(assert (= (and d!8788 (not c!2024)) b!30435))

(assert (= (and d!8788 c!2025) b!30436))

(assert (= (and d!8788 (not c!2025)) b!30437))

(declare-fun m!44463 () Bool)

(assert (=> b!30435 m!44463))

(declare-fun m!44465 () Bool)

(assert (=> b!30435 m!44465))

(declare-fun m!44467 () Bool)

(assert (=> b!30437 m!44467))

(declare-fun m!44469 () Bool)

(assert (=> b!30436 m!44469))

(assert (=> b!29948 d!8788))

(declare-fun d!8790 () Bool)

(assert (=> d!8790 (= (invariant!0 (currentBit!2441 (_2!1672 lt!43242)) (currentByte!2446 (_2!1672 lt!43242)) (size!775 (buf!1103 (_2!1672 lt!43242)))) (and (bvsge (currentBit!2441 (_2!1672 lt!43242)) #b00000000000000000000000000000000) (bvslt (currentBit!2441 (_2!1672 lt!43242)) #b00000000000000000000000000001000) (bvsge (currentByte!2446 (_2!1672 lt!43242)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2446 (_2!1672 lt!43242)) (size!775 (buf!1103 (_2!1672 lt!43242)))) (and (= (currentBit!2441 (_2!1672 lt!43242)) #b00000000000000000000000000000000) (= (currentByte!2446 (_2!1672 lt!43242)) (size!775 (buf!1103 (_2!1672 lt!43242))))))))))

(assert (=> b!29958 d!8790))

(declare-fun d!8792 () Bool)

(assert (=> d!8792 (= (tail!101 lt!43247) (t!1134 lt!43247))))

(assert (=> b!29952 d!8792))

(declare-fun d!8794 () Bool)

(declare-fun e!20269 () Bool)

(assert (=> d!8794 e!20269))

(declare-fun res!26149 () Bool)

(assert (=> d!8794 (=> (not res!26149) (not e!20269))))

(declare-fun lt!44227 () (_ BitVec 64))

(assert (=> d!8794 (= res!26149 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!44227 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!44227) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!8794 (= lt!44227 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!44226 () Unit!2319)

(declare-fun choose!42 (BitStream!1366 BitStream!1366 BitStream!1366 BitStream!1366 (_ BitVec 64) List!384) Unit!2319)

(assert (=> d!8794 (= lt!44226 (choose!42 (_2!1672 lt!43248) (_2!1672 lt!43248) (_1!1673 lt!43249) (_1!1673 lt!43253) (bvsub to!314 i!635) lt!43247))))

(assert (=> d!8794 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8794 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1672 lt!43248) (_2!1672 lt!43248) (_1!1673 lt!43249) (_1!1673 lt!43253) (bvsub to!314 i!635) lt!43247) lt!44226)))

(declare-fun b!30440 () Bool)

(assert (=> b!30440 (= e!20269 (= (bitStreamReadBitsIntoList!0 (_2!1672 lt!43248) (_1!1673 lt!43253) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!101 lt!43247)))))

(assert (= (and d!8794 res!26149) b!30440))

(declare-fun m!44471 () Bool)

(assert (=> d!8794 m!44471))

(declare-fun m!44473 () Bool)

(assert (=> b!30440 m!44473))

(assert (=> b!30440 m!43603))

(assert (=> b!29952 d!8794))

(declare-fun d!8796 () Bool)

(assert (=> d!8796 (= (bitAt!0 (buf!1103 (_1!1673 lt!43249)) lt!43241) (not (= (bvand ((_ sign_extend 24) (select (arr!1238 (buf!1103 (_1!1673 lt!43249))) ((_ extract 31 0) (bvsdiv lt!43241 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!43241 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2456 () Bool)

(assert (= bs!2456 d!8796))

(declare-fun m!44475 () Bool)

(assert (=> bs!2456 m!44475))

(declare-fun m!44477 () Bool)

(assert (=> bs!2456 m!44477))

(assert (=> b!29951 d!8796))

(declare-fun d!8798 () Bool)

(assert (=> d!8798 (= (bitAt!0 (buf!1103 (_1!1673 lt!43253)) lt!43241) (not (= (bvand ((_ sign_extend 24) (select (arr!1238 (buf!1103 (_1!1673 lt!43253))) ((_ extract 31 0) (bvsdiv lt!43241 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!43241 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2457 () Bool)

(assert (= bs!2457 d!8798))

(declare-fun m!44479 () Bool)

(assert (=> bs!2457 m!44479))

(assert (=> bs!2457 m!44477))

(assert (=> b!29951 d!8798))

(declare-fun d!8800 () Bool)

(assert (=> d!8800 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!775 (buf!1103 thiss!1379))) ((_ sign_extend 32) (currentByte!2446 thiss!1379)) ((_ sign_extend 32) (currentBit!2441 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!775 (buf!1103 thiss!1379))) ((_ sign_extend 32) (currentByte!2446 thiss!1379)) ((_ sign_extend 32) (currentBit!2441 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2458 () Bool)

(assert (= bs!2458 d!8800))

(assert (=> bs!2458 m!44459))

(assert (=> b!29950 d!8800))

(push 1)

(assert (not b!30367))

(assert (not b!30416))

(assert (not b!30330))

(assert (not bm!385))

(assert (not b!30314))

(assert (not b!30307))

(assert (not b!30312))

(assert (not b!30310))

(assert (not b!30395))

(assert (not d!8742))

(assert (not b!30419))

(assert (not b!30328))

(assert (not b!30127))

(assert (not d!8768))

(assert (not d!8752))

(assert (not b!30414))

(assert (not b!30440))

(assert (not d!8750))

(assert (not d!8776))

(assert (not b!30362))

(assert (not d!8800))

(assert (not d!8794))

(assert (not d!8770))

(assert (not b!30331))

(assert (not b!30390))

(assert (not b!30371))

(assert (not b!30129))

(assert (not b!30366))

(assert (not b!30433))

(assert (not b!30353))

(assert (not d!8764))

(assert (not d!8726))

(assert (not b!30420))

(assert (not d!8766))

(assert (not d!8724))

(assert (not d!8740))

(assert (not b!30311))

(assert (not d!8728))

(assert (not b!30392))

(assert (not d!8730))

(assert (not d!8762))

(assert (not b!30354))

(assert (not b!30329))

(assert (not d!8744))

(assert (not b!30415))

(assert (not b!30355))

(assert (not b!30423))

(assert (not b!30317))

(assert (not d!8736))

(assert (not b!30435))

(assert (not b!30425))

(assert (not b!30368))

(assert (not b!30413))

(assert (not b!30309))

(assert (not b!30363))

(assert (not b!30373))

(assert (not d!8778))

(assert (not b!30369))

(assert (not d!8738))

(assert (not d!8746))

(assert (not b!30436))

(assert (not b!30372))

(assert (not b!30418))

(assert (not d!8614))

(assert (not b!30315))

(assert (not b!30361))

(assert (not b!30417))

(assert (not b!30374))

(assert (not b!30437))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

