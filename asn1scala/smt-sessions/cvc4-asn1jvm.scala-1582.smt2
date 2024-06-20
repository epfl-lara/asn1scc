; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45034 () Bool)

(assert start!45034)

(declare-fun b!216920 () Bool)

(declare-fun res!182510 () Bool)

(declare-fun e!147535 () Bool)

(assert (=> b!216920 (=> (not res!182510) (not e!147535))))

(declare-datatypes ((array!10608 0))(
  ( (array!10609 (arr!5589 (Array (_ BitVec 32) (_ BitVec 8))) (size!4659 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8426 0))(
  ( (BitStream!8427 (buf!5200 array!10608) (currentByte!9787 (_ BitVec 32)) (currentBit!9782 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!18510 0))(
  ( (tuple2!18511 (_1!9913 BitStream!8426) (_2!9913 BitStream!8426)) )
))
(declare-fun lt!342962 () tuple2!18510)

(declare-fun lt!342970 () (_ BitVec 64))

(declare-fun lt!342959 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8426 (_ BitVec 64)) BitStream!8426)

(assert (=> b!216920 (= res!182510 (= (_1!9913 lt!342962) (withMovedBitIndex!0 (_2!9913 lt!342962) (bvsub lt!342959 lt!342970))))))

(declare-fun b!216921 () Bool)

(declare-fun res!182513 () Bool)

(declare-fun e!147529 () Bool)

(assert (=> b!216921 (=> (not res!182513) (not e!147529))))

(declare-fun thiss!1204 () BitStream!8426)

(declare-datatypes ((Unit!15437 0))(
  ( (Unit!15438) )
))
(declare-datatypes ((tuple2!18512 0))(
  ( (tuple2!18513 (_1!9914 Unit!15437) (_2!9914 BitStream!8426)) )
))
(declare-fun lt!342982 () tuple2!18512)

(declare-fun isPrefixOf!0 (BitStream!8426 BitStream!8426) Bool)

(assert (=> b!216921 (= res!182513 (isPrefixOf!0 thiss!1204 (_2!9914 lt!342982)))))

(declare-fun b!216922 () Bool)

(declare-fun e!147537 () Bool)

(declare-fun e!147532 () Bool)

(assert (=> b!216922 (= e!147537 (not e!147532))))

(declare-fun res!182522 () Bool)

(assert (=> b!216922 (=> res!182522 e!147532)))

(declare-fun lt!342974 () (_ BitVec 64))

(assert (=> b!216922 (= res!182522 (not (= lt!342974 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!342959))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!216922 (= lt!342974 (bitIndex!0 (size!4659 (buf!5200 (_2!9914 lt!342982))) (currentByte!9787 (_2!9914 lt!342982)) (currentBit!9782 (_2!9914 lt!342982))))))

(assert (=> b!216922 (= lt!342959 (bitIndex!0 (size!4659 (buf!5200 thiss!1204)) (currentByte!9787 thiss!1204) (currentBit!9782 thiss!1204)))))

(declare-fun e!147533 () Bool)

(assert (=> b!216922 e!147533))

(declare-fun res!182509 () Bool)

(assert (=> b!216922 (=> (not res!182509) (not e!147533))))

(assert (=> b!216922 (= res!182509 (= (size!4659 (buf!5200 thiss!1204)) (size!4659 (buf!5200 (_2!9914 lt!342982)))))))

(declare-fun lt!342957 () Bool)

(declare-fun appendBit!0 (BitStream!8426 Bool) tuple2!18512)

(assert (=> b!216922 (= lt!342982 (appendBit!0 thiss!1204 lt!342957))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!342953 () (_ BitVec 64))

(assert (=> b!216922 (= lt!342957 (not (= (bvand v!189 lt!342953) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!216922 (= lt!342953 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!216923 () Bool)

(declare-fun res!182506 () Bool)

(assert (=> b!216923 (=> (not res!182506) (not e!147535))))

(declare-fun lt!342972 () tuple2!18510)

(assert (=> b!216923 (= res!182506 (= (_1!9913 lt!342972) (withMovedBitIndex!0 (_2!9913 lt!342972) (bvsub lt!342974 lt!342970))))))

(declare-fun b!216924 () Bool)

(declare-fun res!182514 () Bool)

(assert (=> b!216924 (=> (not res!182514) (not e!147537))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!216924 (= res!182514 (not (= i!590 nBits!348)))))

(declare-fun b!216925 () Bool)

(declare-fun e!147543 () Bool)

(declare-datatypes ((tuple2!18514 0))(
  ( (tuple2!18515 (_1!9915 BitStream!8426) (_2!9915 Bool)) )
))
(declare-fun lt!342967 () tuple2!18514)

(declare-fun lt!342973 () tuple2!18514)

(assert (=> b!216925 (= e!147543 (= (_2!9915 lt!342967) (_2!9915 lt!342973)))))

(declare-fun b!216926 () Bool)

(declare-fun e!147539 () Bool)

(declare-fun array_inv!4400 (array!10608) Bool)

(assert (=> b!216926 (= e!147539 (array_inv!4400 (buf!5200 thiss!1204)))))

(declare-fun b!216927 () Bool)

(declare-fun res!182523 () Bool)

(declare-fun e!147538 () Bool)

(assert (=> b!216927 (=> (not res!182523) (not e!147538))))

(declare-datatypes ((tuple2!18516 0))(
  ( (tuple2!18517 (_1!9916 BitStream!8426) (_2!9916 (_ BitVec 64))) )
))
(declare-fun lt!342980 () tuple2!18516)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!216927 (= res!182523 (= (_2!9916 lt!342980) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun b!216928 () Bool)

(declare-fun res!182515 () Bool)

(declare-fun e!147528 () Bool)

(assert (=> b!216928 (=> res!182515 e!147528)))

(assert (=> b!216928 (= res!182515 (not (= (bitIndex!0 (size!4659 (buf!5200 (_1!9916 lt!342980))) (currentByte!9787 (_1!9916 lt!342980)) (currentBit!9782 (_1!9916 lt!342980))) (bitIndex!0 (size!4659 (buf!5200 (_2!9913 lt!342962))) (currentByte!9787 (_2!9913 lt!342962)) (currentBit!9782 (_2!9913 lt!342962))))))))

(declare-fun b!216929 () Bool)

(declare-fun e!147542 () Bool)

(declare-fun e!147531 () Bool)

(assert (=> b!216929 (= e!147542 e!147531)))

(declare-fun res!182505 () Bool)

(assert (=> b!216929 (=> res!182505 e!147531)))

(declare-fun lt!342983 () (_ BitVec 64))

(assert (=> b!216929 (= res!182505 (not (= lt!342970 (bvsub lt!342983 ((_ sign_extend 32) i!590)))))))

(assert (=> b!216929 (= lt!342983 (bvadd lt!342959 ((_ sign_extend 32) nBits!348)))))

(declare-fun b!216930 () Bool)

(declare-fun e!147536 () Bool)

(assert (=> b!216930 (= e!147531 e!147536)))

(declare-fun res!182507 () Bool)

(assert (=> b!216930 (=> res!182507 e!147536)))

(declare-fun lt!342965 () tuple2!18516)

(assert (=> b!216930 (= res!182507 (not (= (_1!9916 lt!342965) (_2!9913 lt!342972))))))

(declare-fun lt!342964 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8426 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18516)

(assert (=> b!216930 (= lt!342965 (readNBitsLSBFirstsLoopPure!0 (_1!9913 lt!342972) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!342964))))

(declare-fun lt!342968 () tuple2!18512)

(declare-fun lt!342978 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!216930 (validate_offset_bits!1 ((_ sign_extend 32) (size!4659 (buf!5200 (_2!9914 lt!342968)))) ((_ sign_extend 32) (currentByte!9787 (_2!9914 lt!342982))) ((_ sign_extend 32) (currentBit!9782 (_2!9914 lt!342982))) lt!342978)))

(declare-fun lt!342956 () Unit!15437)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8426 array!10608 (_ BitVec 64)) Unit!15437)

(assert (=> b!216930 (= lt!342956 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9914 lt!342982) (buf!5200 (_2!9914 lt!342968)) lt!342978))))

(assert (=> b!216930 (= lt!342978 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!342981 () (_ BitVec 64))

(declare-fun lt!342963 () tuple2!18514)

(assert (=> b!216930 (= lt!342964 (bvor lt!342981 (ite (_2!9915 lt!342963) lt!342953 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216930 (= lt!342980 (readNBitsLSBFirstsLoopPure!0 (_1!9913 lt!342962) nBits!348 i!590 lt!342981))))

(declare-fun lt!342958 () (_ BitVec 64))

(assert (=> b!216930 (validate_offset_bits!1 ((_ sign_extend 32) (size!4659 (buf!5200 (_2!9914 lt!342968)))) ((_ sign_extend 32) (currentByte!9787 thiss!1204)) ((_ sign_extend 32) (currentBit!9782 thiss!1204)) lt!342958)))

(declare-fun lt!342955 () Unit!15437)

(assert (=> b!216930 (= lt!342955 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5200 (_2!9914 lt!342968)) lt!342958))))

(assert (=> b!216930 (= lt!342981 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!216930 (= (_2!9915 lt!342963) lt!342957)))

(declare-fun readBitPure!0 (BitStream!8426) tuple2!18514)

(assert (=> b!216930 (= lt!342963 (readBitPure!0 (_1!9913 lt!342962)))))

(declare-fun reader!0 (BitStream!8426 BitStream!8426) tuple2!18510)

(assert (=> b!216930 (= lt!342972 (reader!0 (_2!9914 lt!342982) (_2!9914 lt!342968)))))

(assert (=> b!216930 (= lt!342962 (reader!0 thiss!1204 (_2!9914 lt!342968)))))

(assert (=> b!216930 e!147543))

(declare-fun res!182521 () Bool)

(assert (=> b!216930 (=> (not res!182521) (not e!147543))))

(assert (=> b!216930 (= res!182521 (= (bitIndex!0 (size!4659 (buf!5200 (_1!9915 lt!342967))) (currentByte!9787 (_1!9915 lt!342967)) (currentBit!9782 (_1!9915 lt!342967))) (bitIndex!0 (size!4659 (buf!5200 (_1!9915 lt!342973))) (currentByte!9787 (_1!9915 lt!342973)) (currentBit!9782 (_1!9915 lt!342973)))))))

(declare-fun lt!342977 () Unit!15437)

(declare-fun lt!342960 () BitStream!8426)

(declare-fun readBitPrefixLemma!0 (BitStream!8426 BitStream!8426) Unit!15437)

(assert (=> b!216930 (= lt!342977 (readBitPrefixLemma!0 lt!342960 (_2!9914 lt!342968)))))

(assert (=> b!216930 (= lt!342973 (readBitPure!0 (BitStream!8427 (buf!5200 (_2!9914 lt!342968)) (currentByte!9787 thiss!1204) (currentBit!9782 thiss!1204))))))

(assert (=> b!216930 (= lt!342967 (readBitPure!0 lt!342960))))

(declare-fun e!147530 () Bool)

(assert (=> b!216930 e!147530))

(declare-fun res!182516 () Bool)

(assert (=> b!216930 (=> (not res!182516) (not e!147530))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!216930 (= res!182516 (invariant!0 (currentBit!9782 thiss!1204) (currentByte!9787 thiss!1204) (size!4659 (buf!5200 (_2!9914 lt!342982)))))))

(assert (=> b!216930 (= lt!342960 (BitStream!8427 (buf!5200 (_2!9914 lt!342982)) (currentByte!9787 thiss!1204) (currentBit!9782 thiss!1204)))))

(declare-fun b!216931 () Bool)

(declare-fun e!147540 () Bool)

(declare-fun lt!342954 () tuple2!18514)

(declare-fun lt!342976 () (_ BitVec 64))

(assert (=> b!216931 (= e!147540 (= (bitIndex!0 (size!4659 (buf!5200 (_1!9915 lt!342954))) (currentByte!9787 (_1!9915 lt!342954)) (currentBit!9782 (_1!9915 lt!342954))) lt!342976))))

(declare-fun b!216932 () Bool)

(assert (=> b!216932 (= e!147536 e!147528)))

(declare-fun res!182508 () Bool)

(assert (=> b!216932 (=> res!182508 e!147528)))

(declare-fun lt!342971 () BitStream!8426)

(assert (=> b!216932 (= res!182508 (not (= (_1!9913 lt!342972) lt!342971)))))

(assert (=> b!216932 e!147535))

(declare-fun res!182519 () Bool)

(assert (=> b!216932 (=> (not res!182519) (not e!147535))))

(declare-fun lt!342975 () tuple2!18516)

(assert (=> b!216932 (= res!182519 (and (= (_2!9916 lt!342980) (_2!9916 lt!342975)) (= (_1!9916 lt!342980) (_1!9916 lt!342975))))))

(declare-fun lt!342979 () Unit!15437)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8426 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15437)

(assert (=> b!216932 (= lt!342979 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9913 lt!342962) nBits!348 i!590 lt!342981))))

(assert (=> b!216932 (= lt!342975 (readNBitsLSBFirstsLoopPure!0 lt!342971 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!342964))))

(assert (=> b!216932 (= lt!342971 (withMovedBitIndex!0 (_1!9913 lt!342962) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun res!182504 () Bool)

(declare-fun e!147541 () Bool)

(assert (=> start!45034 (=> (not res!182504) (not e!147541))))

(assert (=> start!45034 (= res!182504 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!45034 e!147541))

(assert (=> start!45034 true))

(declare-fun inv!12 (BitStream!8426) Bool)

(assert (=> start!45034 (and (inv!12 thiss!1204) e!147539)))

(declare-fun b!216933 () Bool)

(assert (=> b!216933 (= e!147541 e!147537)))

(declare-fun res!182528 () Bool)

(assert (=> b!216933 (=> (not res!182528) (not e!147537))))

(assert (=> b!216933 (= res!182528 (validate_offset_bits!1 ((_ sign_extend 32) (size!4659 (buf!5200 thiss!1204))) ((_ sign_extend 32) (currentByte!9787 thiss!1204)) ((_ sign_extend 32) (currentBit!9782 thiss!1204)) lt!342958))))

(assert (=> b!216933 (= lt!342958 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!216934 () Bool)

(declare-fun res!182524 () Bool)

(assert (=> b!216934 (=> (not res!182524) (not e!147537))))

(assert (=> b!216934 (= res!182524 (invariant!0 (currentBit!9782 thiss!1204) (currentByte!9787 thiss!1204) (size!4659 (buf!5200 thiss!1204))))))

(declare-fun b!216935 () Bool)

(assert (=> b!216935 (= e!147532 e!147542)))

(declare-fun res!182527 () Bool)

(assert (=> b!216935 (=> res!182527 e!147542)))

(assert (=> b!216935 (= res!182527 (not (= lt!342970 (bvsub (bvsub (bvadd lt!342974 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!216935 (= lt!342970 (bitIndex!0 (size!4659 (buf!5200 (_2!9914 lt!342968))) (currentByte!9787 (_2!9914 lt!342968)) (currentBit!9782 (_2!9914 lt!342968))))))

(assert (=> b!216935 (isPrefixOf!0 thiss!1204 (_2!9914 lt!342968))))

(declare-fun lt!342961 () Unit!15437)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8426 BitStream!8426 BitStream!8426) Unit!15437)

(assert (=> b!216935 (= lt!342961 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9914 lt!342982) (_2!9914 lt!342968)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8426 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18512)

(assert (=> b!216935 (= lt!342968 (appendBitsLSBFirstLoopTR!0 (_2!9914 lt!342982) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!216936 () Bool)

(assert (=> b!216936 (= e!147535 (and (= lt!342959 (bvsub lt!342974 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9913 lt!342972) lt!342971)) (= (_2!9916 lt!342980) (_2!9916 lt!342965)))))))

(declare-fun b!216937 () Bool)

(declare-fun res!182525 () Bool)

(assert (=> b!216937 (=> res!182525 e!147542)))

(assert (=> b!216937 (= res!182525 (not (= (size!4659 (buf!5200 (_2!9914 lt!342968))) (size!4659 (buf!5200 thiss!1204)))))))

(declare-fun b!216938 () Bool)

(declare-fun res!182517 () Bool)

(assert (=> b!216938 (=> res!182517 e!147531)))

(assert (=> b!216938 (= res!182517 (not (isPrefixOf!0 (_2!9914 lt!342982) (_2!9914 lt!342968))))))

(declare-fun b!216939 () Bool)

(assert (=> b!216939 (= e!147533 e!147529)))

(declare-fun res!182511 () Bool)

(assert (=> b!216939 (=> (not res!182511) (not e!147529))))

(declare-fun lt!342966 () (_ BitVec 64))

(assert (=> b!216939 (= res!182511 (= lt!342976 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!342966)))))

(assert (=> b!216939 (= lt!342976 (bitIndex!0 (size!4659 (buf!5200 (_2!9914 lt!342982))) (currentByte!9787 (_2!9914 lt!342982)) (currentBit!9782 (_2!9914 lt!342982))))))

(assert (=> b!216939 (= lt!342966 (bitIndex!0 (size!4659 (buf!5200 thiss!1204)) (currentByte!9787 thiss!1204) (currentBit!9782 thiss!1204)))))

(declare-fun b!216940 () Bool)

(assert (=> b!216940 (= e!147529 e!147540)))

(declare-fun res!182512 () Bool)

(assert (=> b!216940 (=> (not res!182512) (not e!147540))))

(assert (=> b!216940 (= res!182512 (and (= (_2!9915 lt!342954) lt!342957) (= (_1!9915 lt!342954) (_2!9914 lt!342982))))))

(declare-fun readerFrom!0 (BitStream!8426 (_ BitVec 32) (_ BitVec 32)) BitStream!8426)

(assert (=> b!216940 (= lt!342954 (readBitPure!0 (readerFrom!0 (_2!9914 lt!342982) (currentBit!9782 thiss!1204) (currentByte!9787 thiss!1204))))))

(declare-fun b!216941 () Bool)

(assert (=> b!216941 (= e!147538 (= (_1!9916 lt!342980) (_2!9913 lt!342962)))))

(declare-fun b!216942 () Bool)

(declare-fun res!182526 () Bool)

(assert (=> b!216942 (=> res!182526 e!147542)))

(assert (=> b!216942 (= res!182526 (not (invariant!0 (currentBit!9782 (_2!9914 lt!342968)) (currentByte!9787 (_2!9914 lt!342968)) (size!4659 (buf!5200 (_2!9914 lt!342968))))))))

(declare-fun b!216943 () Bool)

(declare-fun res!182520 () Bool)

(assert (=> b!216943 (=> res!182520 e!147531)))

(assert (=> b!216943 (= res!182520 (not (isPrefixOf!0 thiss!1204 (_2!9914 lt!342982))))))

(declare-fun b!216944 () Bool)

(assert (=> b!216944 (= e!147530 (invariant!0 (currentBit!9782 thiss!1204) (currentByte!9787 thiss!1204) (size!4659 (buf!5200 (_2!9914 lt!342968)))))))

(declare-fun b!216945 () Bool)

(declare-fun lt!342969 () (_ BitVec 64))

(assert (=> b!216945 (= e!147528 (or (not (= lt!342969 (bvand ((_ sign_extend 32) nBits!348) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!342969 (bvand lt!342983 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!216945 (= lt!342969 (bvand lt!342959 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!216945 e!147538))

(declare-fun res!182518 () Bool)

(assert (=> b!216945 (=> (not res!182518) (not e!147538))))

(assert (=> b!216945 (= res!182518 (= (size!4659 (buf!5200 thiss!1204)) (size!4659 (buf!5200 (_2!9914 lt!342968)))))))

(assert (= (and start!45034 res!182504) b!216933))

(assert (= (and b!216933 res!182528) b!216934))

(assert (= (and b!216934 res!182524) b!216924))

(assert (= (and b!216924 res!182514) b!216922))

(assert (= (and b!216922 res!182509) b!216939))

(assert (= (and b!216939 res!182511) b!216921))

(assert (= (and b!216921 res!182513) b!216940))

(assert (= (and b!216940 res!182512) b!216931))

(assert (= (and b!216922 (not res!182522)) b!216935))

(assert (= (and b!216935 (not res!182527)) b!216942))

(assert (= (and b!216942 (not res!182526)) b!216937))

(assert (= (and b!216937 (not res!182525)) b!216929))

(assert (= (and b!216929 (not res!182505)) b!216938))

(assert (= (and b!216938 (not res!182517)) b!216943))

(assert (= (and b!216943 (not res!182520)) b!216930))

(assert (= (and b!216930 res!182516) b!216944))

(assert (= (and b!216930 res!182521) b!216925))

(assert (= (and b!216930 (not res!182507)) b!216932))

(assert (= (and b!216932 res!182519) b!216920))

(assert (= (and b!216920 res!182510) b!216923))

(assert (= (and b!216923 res!182506) b!216936))

(assert (= (and b!216932 (not res!182508)) b!216928))

(assert (= (and b!216928 (not res!182515)) b!216945))

(assert (= (and b!216945 res!182518) b!216927))

(assert (= (and b!216927 res!182523) b!216941))

(assert (= start!45034 b!216926))

(declare-fun m!334575 () Bool)

(assert (=> b!216920 m!334575))

(declare-fun m!334577 () Bool)

(assert (=> start!45034 m!334577))

(declare-fun m!334579 () Bool)

(assert (=> b!216923 m!334579))

(declare-fun m!334581 () Bool)

(assert (=> b!216935 m!334581))

(declare-fun m!334583 () Bool)

(assert (=> b!216935 m!334583))

(declare-fun m!334585 () Bool)

(assert (=> b!216935 m!334585))

(declare-fun m!334587 () Bool)

(assert (=> b!216935 m!334587))

(declare-fun m!334589 () Bool)

(assert (=> b!216926 m!334589))

(declare-fun m!334591 () Bool)

(assert (=> b!216938 m!334591))

(declare-fun m!334593 () Bool)

(assert (=> b!216933 m!334593))

(declare-fun m!334595 () Bool)

(assert (=> b!216944 m!334595))

(declare-fun m!334597 () Bool)

(assert (=> b!216943 m!334597))

(declare-fun m!334599 () Bool)

(assert (=> b!216939 m!334599))

(declare-fun m!334601 () Bool)

(assert (=> b!216939 m!334601))

(declare-fun m!334603 () Bool)

(assert (=> b!216930 m!334603))

(declare-fun m!334605 () Bool)

(assert (=> b!216930 m!334605))

(declare-fun m!334607 () Bool)

(assert (=> b!216930 m!334607))

(declare-fun m!334609 () Bool)

(assert (=> b!216930 m!334609))

(declare-fun m!334611 () Bool)

(assert (=> b!216930 m!334611))

(declare-fun m!334613 () Bool)

(assert (=> b!216930 m!334613))

(declare-fun m!334615 () Bool)

(assert (=> b!216930 m!334615))

(declare-fun m!334617 () Bool)

(assert (=> b!216930 m!334617))

(declare-fun m!334619 () Bool)

(assert (=> b!216930 m!334619))

(declare-fun m!334621 () Bool)

(assert (=> b!216930 m!334621))

(declare-fun m!334623 () Bool)

(assert (=> b!216930 m!334623))

(declare-fun m!334625 () Bool)

(assert (=> b!216930 m!334625))

(declare-fun m!334627 () Bool)

(assert (=> b!216930 m!334627))

(declare-fun m!334629 () Bool)

(assert (=> b!216930 m!334629))

(declare-fun m!334631 () Bool)

(assert (=> b!216930 m!334631))

(declare-fun m!334633 () Bool)

(assert (=> b!216930 m!334633))

(declare-fun m!334635 () Bool)

(assert (=> b!216931 m!334635))

(declare-fun m!334637 () Bool)

(assert (=> b!216932 m!334637))

(declare-fun m!334639 () Bool)

(assert (=> b!216932 m!334639))

(declare-fun m!334641 () Bool)

(assert (=> b!216932 m!334641))

(assert (=> b!216922 m!334599))

(assert (=> b!216922 m!334601))

(declare-fun m!334643 () Bool)

(assert (=> b!216922 m!334643))

(declare-fun m!334645 () Bool)

(assert (=> b!216927 m!334645))

(assert (=> b!216921 m!334597))

(declare-fun m!334647 () Bool)

(assert (=> b!216928 m!334647))

(declare-fun m!334649 () Bool)

(assert (=> b!216928 m!334649))

(declare-fun m!334651 () Bool)

(assert (=> b!216940 m!334651))

(assert (=> b!216940 m!334651))

(declare-fun m!334653 () Bool)

(assert (=> b!216940 m!334653))

(declare-fun m!334655 () Bool)

(assert (=> b!216942 m!334655))

(declare-fun m!334657 () Bool)

(assert (=> b!216934 m!334657))

(push 1)

(assert (not b!216926))

(assert (not b!216942))

(assert (not b!216928))

(assert (not b!216934))

(assert (not b!216920))

(assert (not b!216923))

(assert (not b!216931))

(assert (not b!216927))

(assert (not b!216922))

(assert (not b!216921))

(assert (not b!216944))

(assert (not b!216938))

(assert (not b!216940))

(assert (not b!216939))

(assert (not b!216930))

(assert (not start!45034))

(assert (not b!216935))

(assert (not b!216933))

(assert (not b!216932))

(assert (not b!216943))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!73577 () Bool)

(declare-datatypes ((tuple2!18522 0))(
  ( (tuple2!18523 (_1!9919 Bool) (_2!9919 BitStream!8426)) )
))
(declare-fun lt!343176 () tuple2!18522)

(declare-fun readBit!0 (BitStream!8426) tuple2!18522)

(assert (=> d!73577 (= lt!343176 (readBit!0 (readerFrom!0 (_2!9914 lt!342982) (currentBit!9782 thiss!1204) (currentByte!9787 thiss!1204))))))

(assert (=> d!73577 (= (readBitPure!0 (readerFrom!0 (_2!9914 lt!342982) (currentBit!9782 thiss!1204) (currentByte!9787 thiss!1204))) (tuple2!18515 (_2!9919 lt!343176) (_1!9919 lt!343176)))))

(declare-fun bs!17969 () Bool)

(assert (= bs!17969 d!73577))

(assert (=> bs!17969 m!334651))

(declare-fun m!334809 () Bool)

(assert (=> bs!17969 m!334809))

(assert (=> b!216940 d!73577))

(declare-fun d!73579 () Bool)

(declare-fun e!147597 () Bool)

(assert (=> d!73579 e!147597))

(declare-fun res!182611 () Bool)

(assert (=> d!73579 (=> (not res!182611) (not e!147597))))

(assert (=> d!73579 (= res!182611 (invariant!0 (currentBit!9782 (_2!9914 lt!342982)) (currentByte!9787 (_2!9914 lt!342982)) (size!4659 (buf!5200 (_2!9914 lt!342982)))))))

(assert (=> d!73579 (= (readerFrom!0 (_2!9914 lt!342982) (currentBit!9782 thiss!1204) (currentByte!9787 thiss!1204)) (BitStream!8427 (buf!5200 (_2!9914 lt!342982)) (currentByte!9787 thiss!1204) (currentBit!9782 thiss!1204)))))

(declare-fun b!217034 () Bool)

(assert (=> b!217034 (= e!147597 (invariant!0 (currentBit!9782 thiss!1204) (currentByte!9787 thiss!1204) (size!4659 (buf!5200 (_2!9914 lt!342982)))))))

(assert (= (and d!73579 res!182611) b!217034))

(declare-fun m!334815 () Bool)

(assert (=> d!73579 m!334815))

(assert (=> b!217034 m!334629))

(assert (=> b!216940 d!73579))

(declare-fun d!73583 () Bool)

(declare-fun e!147601 () Bool)

(assert (=> d!73583 e!147601))

(declare-fun res!182615 () Bool)

(assert (=> d!73583 (=> (not res!182615) (not e!147601))))

(declare-fun lt!343201 () tuple2!18514)

(declare-fun lt!343199 () tuple2!18514)

(assert (=> d!73583 (= res!182615 (= (bitIndex!0 (size!4659 (buf!5200 (_1!9915 lt!343201))) (currentByte!9787 (_1!9915 lt!343201)) (currentBit!9782 (_1!9915 lt!343201))) (bitIndex!0 (size!4659 (buf!5200 (_1!9915 lt!343199))) (currentByte!9787 (_1!9915 lt!343199)) (currentBit!9782 (_1!9915 lt!343199)))))))

(declare-fun lt!343198 () Unit!15437)

(declare-fun lt!343200 () BitStream!8426)

(declare-fun choose!50 (BitStream!8426 BitStream!8426 BitStream!8426 tuple2!18514 tuple2!18514 BitStream!8426 Bool tuple2!18514 tuple2!18514 BitStream!8426 Bool) Unit!15437)

(assert (=> d!73583 (= lt!343198 (choose!50 lt!342960 (_2!9914 lt!342968) lt!343200 lt!343201 (tuple2!18515 (_1!9915 lt!343201) (_2!9915 lt!343201)) (_1!9915 lt!343201) (_2!9915 lt!343201) lt!343199 (tuple2!18515 (_1!9915 lt!343199) (_2!9915 lt!343199)) (_1!9915 lt!343199) (_2!9915 lt!343199)))))

(assert (=> d!73583 (= lt!343199 (readBitPure!0 lt!343200))))

(assert (=> d!73583 (= lt!343201 (readBitPure!0 lt!342960))))

(assert (=> d!73583 (= lt!343200 (BitStream!8427 (buf!5200 (_2!9914 lt!342968)) (currentByte!9787 lt!342960) (currentBit!9782 lt!342960)))))

(assert (=> d!73583 (invariant!0 (currentBit!9782 lt!342960) (currentByte!9787 lt!342960) (size!4659 (buf!5200 (_2!9914 lt!342968))))))

(assert (=> d!73583 (= (readBitPrefixLemma!0 lt!342960 (_2!9914 lt!342968)) lt!343198)))

(declare-fun b!217038 () Bool)

(assert (=> b!217038 (= e!147601 (= (_2!9915 lt!343201) (_2!9915 lt!343199)))))

(assert (= (and d!73583 res!182615) b!217038))

(declare-fun m!334827 () Bool)

(assert (=> d!73583 m!334827))

(assert (=> d!73583 m!334611))

(declare-fun m!334829 () Bool)

(assert (=> d!73583 m!334829))

(declare-fun m!334831 () Bool)

(assert (=> d!73583 m!334831))

(declare-fun m!334833 () Bool)

(assert (=> d!73583 m!334833))

(declare-fun m!334835 () Bool)

(assert (=> d!73583 m!334835))

(assert (=> b!216930 d!73583))

(declare-fun d!73591 () Bool)

(assert (=> d!73591 (validate_offset_bits!1 ((_ sign_extend 32) (size!4659 (buf!5200 (_2!9914 lt!342968)))) ((_ sign_extend 32) (currentByte!9787 thiss!1204)) ((_ sign_extend 32) (currentBit!9782 thiss!1204)) lt!342958)))

(declare-fun lt!343206 () Unit!15437)

(declare-fun choose!9 (BitStream!8426 array!10608 (_ BitVec 64) BitStream!8426) Unit!15437)

(assert (=> d!73591 (= lt!343206 (choose!9 thiss!1204 (buf!5200 (_2!9914 lt!342968)) lt!342958 (BitStream!8427 (buf!5200 (_2!9914 lt!342968)) (currentByte!9787 thiss!1204) (currentBit!9782 thiss!1204))))))

(assert (=> d!73591 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5200 (_2!9914 lt!342968)) lt!342958) lt!343206)))

(declare-fun bs!17972 () Bool)

(assert (= bs!17972 d!73591))

(assert (=> bs!17972 m!334625))

(declare-fun m!334837 () Bool)

(assert (=> bs!17972 m!334837))

(assert (=> b!216930 d!73591))

(declare-fun d!73593 () Bool)

(declare-fun e!147609 () Bool)

(assert (=> d!73593 e!147609))

(declare-fun res!182629 () Bool)

(assert (=> d!73593 (=> (not res!182629) (not e!147609))))

(declare-fun lt!343241 () (_ BitVec 64))

(declare-fun lt!343243 () (_ BitVec 64))

(declare-fun lt!343240 () (_ BitVec 64))

(assert (=> d!73593 (= res!182629 (= lt!343241 (bvsub lt!343243 lt!343240)))))

(assert (=> d!73593 (or (= (bvand lt!343243 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343240 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!343243 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!343243 lt!343240) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!73593 (= lt!343240 (remainingBits!0 ((_ sign_extend 32) (size!4659 (buf!5200 (_1!9915 lt!342973)))) ((_ sign_extend 32) (currentByte!9787 (_1!9915 lt!342973))) ((_ sign_extend 32) (currentBit!9782 (_1!9915 lt!342973)))))))

(declare-fun lt!343238 () (_ BitVec 64))

(declare-fun lt!343239 () (_ BitVec 64))

(assert (=> d!73593 (= lt!343243 (bvmul lt!343238 lt!343239))))

(assert (=> d!73593 (or (= lt!343238 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!343239 (bvsdiv (bvmul lt!343238 lt!343239) lt!343238)))))

(assert (=> d!73593 (= lt!343239 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73593 (= lt!343238 ((_ sign_extend 32) (size!4659 (buf!5200 (_1!9915 lt!342973)))))))

(assert (=> d!73593 (= lt!343241 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9787 (_1!9915 lt!342973))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9782 (_1!9915 lt!342973)))))))

(assert (=> d!73593 (invariant!0 (currentBit!9782 (_1!9915 lt!342973)) (currentByte!9787 (_1!9915 lt!342973)) (size!4659 (buf!5200 (_1!9915 lt!342973))))))

(assert (=> d!73593 (= (bitIndex!0 (size!4659 (buf!5200 (_1!9915 lt!342973))) (currentByte!9787 (_1!9915 lt!342973)) (currentBit!9782 (_1!9915 lt!342973))) lt!343241)))

(declare-fun b!217052 () Bool)

(declare-fun res!182630 () Bool)

(assert (=> b!217052 (=> (not res!182630) (not e!147609))))

(assert (=> b!217052 (= res!182630 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!343241))))

(declare-fun b!217053 () Bool)

(declare-fun lt!343242 () (_ BitVec 64))

(assert (=> b!217053 (= e!147609 (bvsle lt!343241 (bvmul lt!343242 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217053 (or (= lt!343242 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!343242 #b0000000000000000000000000000000000000000000000000000000000001000) lt!343242)))))

(assert (=> b!217053 (= lt!343242 ((_ sign_extend 32) (size!4659 (buf!5200 (_1!9915 lt!342973)))))))

(assert (= (and d!73593 res!182629) b!217052))

(assert (= (and b!217052 res!182630) b!217053))

(declare-fun m!334845 () Bool)

(assert (=> d!73593 m!334845))

(declare-fun m!334847 () Bool)

(assert (=> d!73593 m!334847))

(assert (=> b!216930 d!73593))

(declare-fun d!73601 () Bool)

(assert (=> d!73601 (validate_offset_bits!1 ((_ sign_extend 32) (size!4659 (buf!5200 (_2!9914 lt!342968)))) ((_ sign_extend 32) (currentByte!9787 (_2!9914 lt!342982))) ((_ sign_extend 32) (currentBit!9782 (_2!9914 lt!342982))) lt!342978)))

(declare-fun lt!343244 () Unit!15437)

(assert (=> d!73601 (= lt!343244 (choose!9 (_2!9914 lt!342982) (buf!5200 (_2!9914 lt!342968)) lt!342978 (BitStream!8427 (buf!5200 (_2!9914 lt!342968)) (currentByte!9787 (_2!9914 lt!342982)) (currentBit!9782 (_2!9914 lt!342982)))))))

(assert (=> d!73601 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9914 lt!342982) (buf!5200 (_2!9914 lt!342968)) lt!342978) lt!343244)))

(declare-fun bs!17974 () Bool)

(assert (= bs!17974 d!73601))

(assert (=> bs!17974 m!334609))

(declare-fun m!334849 () Bool)

(assert (=> bs!17974 m!334849))

(assert (=> b!216930 d!73601))

(declare-fun d!73603 () Bool)

(assert (=> d!73603 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4659 (buf!5200 (_2!9914 lt!342968)))) ((_ sign_extend 32) (currentByte!9787 thiss!1204)) ((_ sign_extend 32) (currentBit!9782 thiss!1204)) lt!342958) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4659 (buf!5200 (_2!9914 lt!342968)))) ((_ sign_extend 32) (currentByte!9787 thiss!1204)) ((_ sign_extend 32) (currentBit!9782 thiss!1204))) lt!342958))))

(declare-fun bs!17975 () Bool)

(assert (= bs!17975 d!73603))

(declare-fun m!334851 () Bool)

(assert (=> bs!17975 m!334851))

(assert (=> b!216930 d!73603))

(declare-fun d!73605 () Bool)

(declare-fun e!147610 () Bool)

(assert (=> d!73605 e!147610))

(declare-fun res!182631 () Bool)

(assert (=> d!73605 (=> (not res!182631) (not e!147610))))

(declare-fun lt!343250 () (_ BitVec 64))

(declare-fun lt!343248 () (_ BitVec 64))

(declare-fun lt!343247 () (_ BitVec 64))

(assert (=> d!73605 (= res!182631 (= lt!343248 (bvsub lt!343250 lt!343247)))))

(assert (=> d!73605 (or (= (bvand lt!343250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343247 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!343250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!343250 lt!343247) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73605 (= lt!343247 (remainingBits!0 ((_ sign_extend 32) (size!4659 (buf!5200 (_1!9915 lt!342967)))) ((_ sign_extend 32) (currentByte!9787 (_1!9915 lt!342967))) ((_ sign_extend 32) (currentBit!9782 (_1!9915 lt!342967)))))))

(declare-fun lt!343245 () (_ BitVec 64))

(declare-fun lt!343246 () (_ BitVec 64))

(assert (=> d!73605 (= lt!343250 (bvmul lt!343245 lt!343246))))

(assert (=> d!73605 (or (= lt!343245 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!343246 (bvsdiv (bvmul lt!343245 lt!343246) lt!343245)))))

(assert (=> d!73605 (= lt!343246 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73605 (= lt!343245 ((_ sign_extend 32) (size!4659 (buf!5200 (_1!9915 lt!342967)))))))

(assert (=> d!73605 (= lt!343248 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9787 (_1!9915 lt!342967))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9782 (_1!9915 lt!342967)))))))

(assert (=> d!73605 (invariant!0 (currentBit!9782 (_1!9915 lt!342967)) (currentByte!9787 (_1!9915 lt!342967)) (size!4659 (buf!5200 (_1!9915 lt!342967))))))

(assert (=> d!73605 (= (bitIndex!0 (size!4659 (buf!5200 (_1!9915 lt!342967))) (currentByte!9787 (_1!9915 lt!342967)) (currentBit!9782 (_1!9915 lt!342967))) lt!343248)))

(declare-fun b!217054 () Bool)

(declare-fun res!182632 () Bool)

(assert (=> b!217054 (=> (not res!182632) (not e!147610))))

(assert (=> b!217054 (= res!182632 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!343248))))

(declare-fun b!217055 () Bool)

(declare-fun lt!343249 () (_ BitVec 64))

(assert (=> b!217055 (= e!147610 (bvsle lt!343248 (bvmul lt!343249 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217055 (or (= lt!343249 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!343249 #b0000000000000000000000000000000000000000000000000000000000001000) lt!343249)))))

(assert (=> b!217055 (= lt!343249 ((_ sign_extend 32) (size!4659 (buf!5200 (_1!9915 lt!342967)))))))

(assert (= (and d!73605 res!182631) b!217054))

(assert (= (and b!217054 res!182632) b!217055))

(declare-fun m!334853 () Bool)

(assert (=> d!73605 m!334853))

(declare-fun m!334855 () Bool)

(assert (=> d!73605 m!334855))

(assert (=> b!216930 d!73605))

(declare-fun d!73607 () Bool)

(assert (=> d!73607 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4659 (buf!5200 (_2!9914 lt!342968)))) ((_ sign_extend 32) (currentByte!9787 (_2!9914 lt!342982))) ((_ sign_extend 32) (currentBit!9782 (_2!9914 lt!342982))) lt!342978) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4659 (buf!5200 (_2!9914 lt!342968)))) ((_ sign_extend 32) (currentByte!9787 (_2!9914 lt!342982))) ((_ sign_extend 32) (currentBit!9782 (_2!9914 lt!342982)))) lt!342978))))

(declare-fun bs!17976 () Bool)

(assert (= bs!17976 d!73607))

(declare-fun m!334857 () Bool)

(assert (=> bs!17976 m!334857))

(assert (=> b!216930 d!73607))

(declare-fun b!217066 () Bool)

(declare-fun res!182639 () Bool)

(declare-fun e!147615 () Bool)

(assert (=> b!217066 (=> (not res!182639) (not e!147615))))

(declare-fun lt!343306 () tuple2!18510)

(assert (=> b!217066 (= res!182639 (isPrefixOf!0 (_1!9913 lt!343306) (_2!9914 lt!342982)))))

(declare-fun d!73609 () Bool)

(assert (=> d!73609 e!147615))

(declare-fun res!182641 () Bool)

(assert (=> d!73609 (=> (not res!182641) (not e!147615))))

(assert (=> d!73609 (= res!182641 (isPrefixOf!0 (_1!9913 lt!343306) (_2!9913 lt!343306)))))

(declare-fun lt!343304 () BitStream!8426)

(assert (=> d!73609 (= lt!343306 (tuple2!18511 lt!343304 (_2!9914 lt!342968)))))

(declare-fun lt!343302 () Unit!15437)

(declare-fun lt!343308 () Unit!15437)

(assert (=> d!73609 (= lt!343302 lt!343308)))

(assert (=> d!73609 (isPrefixOf!0 lt!343304 (_2!9914 lt!342968))))

(assert (=> d!73609 (= lt!343308 (lemmaIsPrefixTransitive!0 lt!343304 (_2!9914 lt!342968) (_2!9914 lt!342968)))))

(declare-fun lt!343297 () Unit!15437)

(declare-fun lt!343296 () Unit!15437)

(assert (=> d!73609 (= lt!343297 lt!343296)))

(assert (=> d!73609 (isPrefixOf!0 lt!343304 (_2!9914 lt!342968))))

(assert (=> d!73609 (= lt!343296 (lemmaIsPrefixTransitive!0 lt!343304 (_2!9914 lt!342982) (_2!9914 lt!342968)))))

(declare-fun lt!343303 () Unit!15437)

(declare-fun e!147616 () Unit!15437)

(assert (=> d!73609 (= lt!343303 e!147616)))

(declare-fun c!10605 () Bool)

(assert (=> d!73609 (= c!10605 (not (= (size!4659 (buf!5200 (_2!9914 lt!342982))) #b00000000000000000000000000000000)))))

(declare-fun lt!343305 () Unit!15437)

(declare-fun lt!343300 () Unit!15437)

(assert (=> d!73609 (= lt!343305 lt!343300)))

(assert (=> d!73609 (isPrefixOf!0 (_2!9914 lt!342968) (_2!9914 lt!342968))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8426) Unit!15437)

(assert (=> d!73609 (= lt!343300 (lemmaIsPrefixRefl!0 (_2!9914 lt!342968)))))

(declare-fun lt!343291 () Unit!15437)

(declare-fun lt!343307 () Unit!15437)

(assert (=> d!73609 (= lt!343291 lt!343307)))

(assert (=> d!73609 (= lt!343307 (lemmaIsPrefixRefl!0 (_2!9914 lt!342968)))))

(declare-fun lt!343298 () Unit!15437)

(declare-fun lt!343309 () Unit!15437)

(assert (=> d!73609 (= lt!343298 lt!343309)))

(assert (=> d!73609 (isPrefixOf!0 lt!343304 lt!343304)))

(assert (=> d!73609 (= lt!343309 (lemmaIsPrefixRefl!0 lt!343304))))

(declare-fun lt!343293 () Unit!15437)

(declare-fun lt!343292 () Unit!15437)

(assert (=> d!73609 (= lt!343293 lt!343292)))

(assert (=> d!73609 (isPrefixOf!0 (_2!9914 lt!342982) (_2!9914 lt!342982))))

(assert (=> d!73609 (= lt!343292 (lemmaIsPrefixRefl!0 (_2!9914 lt!342982)))))

(assert (=> d!73609 (= lt!343304 (BitStream!8427 (buf!5200 (_2!9914 lt!342968)) (currentByte!9787 (_2!9914 lt!342982)) (currentBit!9782 (_2!9914 lt!342982))))))

(assert (=> d!73609 (isPrefixOf!0 (_2!9914 lt!342982) (_2!9914 lt!342968))))

(assert (=> d!73609 (= (reader!0 (_2!9914 lt!342982) (_2!9914 lt!342968)) lt!343306)))

(declare-fun b!217067 () Bool)

(declare-fun lt!343310 () Unit!15437)

(assert (=> b!217067 (= e!147616 lt!343310)))

(declare-fun lt!343301 () (_ BitVec 64))

(assert (=> b!217067 (= lt!343301 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!343294 () (_ BitVec 64))

(assert (=> b!217067 (= lt!343294 (bitIndex!0 (size!4659 (buf!5200 (_2!9914 lt!342982))) (currentByte!9787 (_2!9914 lt!342982)) (currentBit!9782 (_2!9914 lt!342982))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10608 array!10608 (_ BitVec 64) (_ BitVec 64)) Unit!15437)

(assert (=> b!217067 (= lt!343310 (arrayBitRangesEqSymmetric!0 (buf!5200 (_2!9914 lt!342982)) (buf!5200 (_2!9914 lt!342968)) lt!343301 lt!343294))))

(declare-fun arrayBitRangesEq!0 (array!10608 array!10608 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!217067 (arrayBitRangesEq!0 (buf!5200 (_2!9914 lt!342968)) (buf!5200 (_2!9914 lt!342982)) lt!343301 lt!343294)))

(declare-fun b!217068 () Bool)

(declare-fun Unit!15460 () Unit!15437)

(assert (=> b!217068 (= e!147616 Unit!15460)))

(declare-fun lt!343299 () (_ BitVec 64))

(declare-fun b!217069 () Bool)

(declare-fun lt!343295 () (_ BitVec 64))

(assert (=> b!217069 (= e!147615 (= (_1!9913 lt!343306) (withMovedBitIndex!0 (_2!9913 lt!343306) (bvsub lt!343295 lt!343299))))))

(assert (=> b!217069 (or (= (bvand lt!343295 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343299 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!343295 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!343295 lt!343299) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217069 (= lt!343299 (bitIndex!0 (size!4659 (buf!5200 (_2!9914 lt!342968))) (currentByte!9787 (_2!9914 lt!342968)) (currentBit!9782 (_2!9914 lt!342968))))))

(assert (=> b!217069 (= lt!343295 (bitIndex!0 (size!4659 (buf!5200 (_2!9914 lt!342982))) (currentByte!9787 (_2!9914 lt!342982)) (currentBit!9782 (_2!9914 lt!342982))))))

(declare-fun b!217070 () Bool)

(declare-fun res!182640 () Bool)

(assert (=> b!217070 (=> (not res!182640) (not e!147615))))

(assert (=> b!217070 (= res!182640 (isPrefixOf!0 (_2!9913 lt!343306) (_2!9914 lt!342968)))))

(assert (= (and d!73609 c!10605) b!217067))

(assert (= (and d!73609 (not c!10605)) b!217068))

(assert (= (and d!73609 res!182641) b!217066))

(assert (= (and b!217066 res!182639) b!217070))

(assert (= (and b!217070 res!182640) b!217069))

(declare-fun m!334859 () Bool)

(assert (=> b!217069 m!334859))

(assert (=> b!217069 m!334581))

(assert (=> b!217069 m!334599))

(assert (=> b!217067 m!334599))

(declare-fun m!334861 () Bool)

(assert (=> b!217067 m!334861))

(declare-fun m!334863 () Bool)

(assert (=> b!217067 m!334863))

(declare-fun m!334865 () Bool)

(assert (=> d!73609 m!334865))

(declare-fun m!334867 () Bool)

(assert (=> d!73609 m!334867))

(declare-fun m!334869 () Bool)

(assert (=> d!73609 m!334869))

(declare-fun m!334871 () Bool)

(assert (=> d!73609 m!334871))

(assert (=> d!73609 m!334591))

(declare-fun m!334873 () Bool)

(assert (=> d!73609 m!334873))

(declare-fun m!334875 () Bool)

(assert (=> d!73609 m!334875))

(declare-fun m!334877 () Bool)

(assert (=> d!73609 m!334877))

(declare-fun m!334879 () Bool)

(assert (=> d!73609 m!334879))

(declare-fun m!334881 () Bool)

(assert (=> d!73609 m!334881))

(declare-fun m!334883 () Bool)

(assert (=> d!73609 m!334883))

(declare-fun m!334885 () Bool)

(assert (=> b!217066 m!334885))

(declare-fun m!334887 () Bool)

(assert (=> b!217070 m!334887))

(assert (=> b!216930 d!73609))

(declare-fun d!73611 () Bool)

(assert (=> d!73611 (= (invariant!0 (currentBit!9782 thiss!1204) (currentByte!9787 thiss!1204) (size!4659 (buf!5200 (_2!9914 lt!342982)))) (and (bvsge (currentBit!9782 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9782 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9787 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9787 thiss!1204) (size!4659 (buf!5200 (_2!9914 lt!342982)))) (and (= (currentBit!9782 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9787 thiss!1204) (size!4659 (buf!5200 (_2!9914 lt!342982))))))))))

(assert (=> b!216930 d!73611))

(declare-datatypes ((tuple2!18528 0))(
  ( (tuple2!18529 (_1!9922 (_ BitVec 64)) (_2!9922 BitStream!8426)) )
))
(declare-fun lt!343313 () tuple2!18528)

(declare-fun d!73613 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8426 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18528)

(assert (=> d!73613 (= lt!343313 (readNBitsLSBFirstsLoop!0 (_1!9913 lt!342972) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!342964))))

(assert (=> d!73613 (= (readNBitsLSBFirstsLoopPure!0 (_1!9913 lt!342972) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!342964) (tuple2!18517 (_2!9922 lt!343313) (_1!9922 lt!343313)))))

(declare-fun bs!17977 () Bool)

(assert (= bs!17977 d!73613))

(declare-fun m!334889 () Bool)

(assert (=> bs!17977 m!334889))

(assert (=> b!216930 d!73613))

(declare-fun d!73615 () Bool)

(declare-fun lt!343314 () tuple2!18522)

(assert (=> d!73615 (= lt!343314 (readBit!0 (_1!9913 lt!342962)))))

(assert (=> d!73615 (= (readBitPure!0 (_1!9913 lt!342962)) (tuple2!18515 (_2!9919 lt!343314) (_1!9919 lt!343314)))))

(declare-fun bs!17978 () Bool)

(assert (= bs!17978 d!73615))

(declare-fun m!334891 () Bool)

(assert (=> bs!17978 m!334891))

(assert (=> b!216930 d!73615))

(declare-fun d!73617 () Bool)

(assert (=> d!73617 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!216930 d!73617))

(declare-fun d!73619 () Bool)

(declare-fun lt!343315 () tuple2!18522)

(assert (=> d!73619 (= lt!343315 (readBit!0 (BitStream!8427 (buf!5200 (_2!9914 lt!342968)) (currentByte!9787 thiss!1204) (currentBit!9782 thiss!1204))))))

(assert (=> d!73619 (= (readBitPure!0 (BitStream!8427 (buf!5200 (_2!9914 lt!342968)) (currentByte!9787 thiss!1204) (currentBit!9782 thiss!1204))) (tuple2!18515 (_2!9919 lt!343315) (_1!9919 lt!343315)))))

(declare-fun bs!17979 () Bool)

(assert (= bs!17979 d!73619))

(declare-fun m!334893 () Bool)

(assert (=> bs!17979 m!334893))

(assert (=> b!216930 d!73619))

(declare-fun b!217071 () Bool)

(declare-fun res!182642 () Bool)

(declare-fun e!147617 () Bool)

(assert (=> b!217071 (=> (not res!182642) (not e!147617))))

(declare-fun lt!343331 () tuple2!18510)

(assert (=> b!217071 (= res!182642 (isPrefixOf!0 (_1!9913 lt!343331) thiss!1204))))

(declare-fun d!73621 () Bool)

(assert (=> d!73621 e!147617))

(declare-fun res!182644 () Bool)

(assert (=> d!73621 (=> (not res!182644) (not e!147617))))

(assert (=> d!73621 (= res!182644 (isPrefixOf!0 (_1!9913 lt!343331) (_2!9913 lt!343331)))))

(declare-fun lt!343329 () BitStream!8426)

(assert (=> d!73621 (= lt!343331 (tuple2!18511 lt!343329 (_2!9914 lt!342968)))))

(declare-fun lt!343327 () Unit!15437)

(declare-fun lt!343333 () Unit!15437)

(assert (=> d!73621 (= lt!343327 lt!343333)))

(assert (=> d!73621 (isPrefixOf!0 lt!343329 (_2!9914 lt!342968))))

(assert (=> d!73621 (= lt!343333 (lemmaIsPrefixTransitive!0 lt!343329 (_2!9914 lt!342968) (_2!9914 lt!342968)))))

(declare-fun lt!343322 () Unit!15437)

(declare-fun lt!343321 () Unit!15437)

(assert (=> d!73621 (= lt!343322 lt!343321)))

(assert (=> d!73621 (isPrefixOf!0 lt!343329 (_2!9914 lt!342968))))

(assert (=> d!73621 (= lt!343321 (lemmaIsPrefixTransitive!0 lt!343329 thiss!1204 (_2!9914 lt!342968)))))

(declare-fun lt!343328 () Unit!15437)

(declare-fun e!147618 () Unit!15437)

(assert (=> d!73621 (= lt!343328 e!147618)))

(declare-fun c!10606 () Bool)

(assert (=> d!73621 (= c!10606 (not (= (size!4659 (buf!5200 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!343330 () Unit!15437)

(declare-fun lt!343325 () Unit!15437)

(assert (=> d!73621 (= lt!343330 lt!343325)))

(assert (=> d!73621 (isPrefixOf!0 (_2!9914 lt!342968) (_2!9914 lt!342968))))

(assert (=> d!73621 (= lt!343325 (lemmaIsPrefixRefl!0 (_2!9914 lt!342968)))))

(declare-fun lt!343316 () Unit!15437)

(declare-fun lt!343332 () Unit!15437)

(assert (=> d!73621 (= lt!343316 lt!343332)))

(assert (=> d!73621 (= lt!343332 (lemmaIsPrefixRefl!0 (_2!9914 lt!342968)))))

(declare-fun lt!343323 () Unit!15437)

(declare-fun lt!343334 () Unit!15437)

(assert (=> d!73621 (= lt!343323 lt!343334)))

(assert (=> d!73621 (isPrefixOf!0 lt!343329 lt!343329)))

(assert (=> d!73621 (= lt!343334 (lemmaIsPrefixRefl!0 lt!343329))))

(declare-fun lt!343318 () Unit!15437)

(declare-fun lt!343317 () Unit!15437)

(assert (=> d!73621 (= lt!343318 lt!343317)))

(assert (=> d!73621 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!73621 (= lt!343317 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!73621 (= lt!343329 (BitStream!8427 (buf!5200 (_2!9914 lt!342968)) (currentByte!9787 thiss!1204) (currentBit!9782 thiss!1204)))))

(assert (=> d!73621 (isPrefixOf!0 thiss!1204 (_2!9914 lt!342968))))

(assert (=> d!73621 (= (reader!0 thiss!1204 (_2!9914 lt!342968)) lt!343331)))

(declare-fun b!217072 () Bool)

(declare-fun lt!343335 () Unit!15437)

(assert (=> b!217072 (= e!147618 lt!343335)))

(declare-fun lt!343326 () (_ BitVec 64))

(assert (=> b!217072 (= lt!343326 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!343319 () (_ BitVec 64))

(assert (=> b!217072 (= lt!343319 (bitIndex!0 (size!4659 (buf!5200 thiss!1204)) (currentByte!9787 thiss!1204) (currentBit!9782 thiss!1204)))))

(assert (=> b!217072 (= lt!343335 (arrayBitRangesEqSymmetric!0 (buf!5200 thiss!1204) (buf!5200 (_2!9914 lt!342968)) lt!343326 lt!343319))))

(assert (=> b!217072 (arrayBitRangesEq!0 (buf!5200 (_2!9914 lt!342968)) (buf!5200 thiss!1204) lt!343326 lt!343319)))

(declare-fun b!217073 () Bool)

(declare-fun Unit!15464 () Unit!15437)

(assert (=> b!217073 (= e!147618 Unit!15464)))

(declare-fun b!217074 () Bool)

(declare-fun lt!343324 () (_ BitVec 64))

(declare-fun lt!343320 () (_ BitVec 64))

(assert (=> b!217074 (= e!147617 (= (_1!9913 lt!343331) (withMovedBitIndex!0 (_2!9913 lt!343331) (bvsub lt!343320 lt!343324))))))

(assert (=> b!217074 (or (= (bvand lt!343320 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343324 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!343320 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!343320 lt!343324) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217074 (= lt!343324 (bitIndex!0 (size!4659 (buf!5200 (_2!9914 lt!342968))) (currentByte!9787 (_2!9914 lt!342968)) (currentBit!9782 (_2!9914 lt!342968))))))

(assert (=> b!217074 (= lt!343320 (bitIndex!0 (size!4659 (buf!5200 thiss!1204)) (currentByte!9787 thiss!1204) (currentBit!9782 thiss!1204)))))

(declare-fun b!217075 () Bool)

(declare-fun res!182643 () Bool)

(assert (=> b!217075 (=> (not res!182643) (not e!147617))))

(assert (=> b!217075 (= res!182643 (isPrefixOf!0 (_2!9913 lt!343331) (_2!9914 lt!342968)))))

(assert (= (and d!73621 c!10606) b!217072))

(assert (= (and d!73621 (not c!10606)) b!217073))

(assert (= (and d!73621 res!182644) b!217071))

(assert (= (and b!217071 res!182642) b!217075))

(assert (= (and b!217075 res!182643) b!217074))

(declare-fun m!334895 () Bool)

(assert (=> b!217074 m!334895))

(assert (=> b!217074 m!334581))

(assert (=> b!217074 m!334601))

(assert (=> b!217072 m!334601))

(declare-fun m!334897 () Bool)

(assert (=> b!217072 m!334897))

(declare-fun m!334899 () Bool)

(assert (=> b!217072 m!334899))

(declare-fun m!334901 () Bool)

(assert (=> d!73621 m!334901))

(assert (=> d!73621 m!334867))

(declare-fun m!334903 () Bool)

(assert (=> d!73621 m!334903))

(declare-fun m!334905 () Bool)

(assert (=> d!73621 m!334905))

(assert (=> d!73621 m!334583))

(declare-fun m!334907 () Bool)

(assert (=> d!73621 m!334907))

(declare-fun m!334909 () Bool)

(assert (=> d!73621 m!334909))

(declare-fun m!334911 () Bool)

(assert (=> d!73621 m!334911))

(declare-fun m!334913 () Bool)

(assert (=> d!73621 m!334913))

(declare-fun m!334915 () Bool)

(assert (=> d!73621 m!334915))

(assert (=> d!73621 m!334883))

(declare-fun m!334917 () Bool)

(assert (=> b!217071 m!334917))

(declare-fun m!334919 () Bool)

(assert (=> b!217075 m!334919))

(assert (=> b!216930 d!73621))

(declare-fun d!73623 () Bool)

(declare-fun lt!343336 () tuple2!18522)

(assert (=> d!73623 (= lt!343336 (readBit!0 lt!342960))))

(assert (=> d!73623 (= (readBitPure!0 lt!342960) (tuple2!18515 (_2!9919 lt!343336) (_1!9919 lt!343336)))))

(declare-fun bs!17980 () Bool)

(assert (= bs!17980 d!73623))

(declare-fun m!334921 () Bool)

(assert (=> bs!17980 m!334921))

(assert (=> b!216930 d!73623))

(declare-fun lt!343337 () tuple2!18528)

(declare-fun d!73625 () Bool)

(assert (=> d!73625 (= lt!343337 (readNBitsLSBFirstsLoop!0 (_1!9913 lt!342962) nBits!348 i!590 lt!342981))))

(assert (=> d!73625 (= (readNBitsLSBFirstsLoopPure!0 (_1!9913 lt!342962) nBits!348 i!590 lt!342981) (tuple2!18517 (_2!9922 lt!343337) (_1!9922 lt!343337)))))

(declare-fun bs!17981 () Bool)

(assert (= bs!17981 d!73625))

(declare-fun m!334923 () Bool)

(assert (=> bs!17981 m!334923))

(assert (=> b!216930 d!73625))

(declare-fun d!73627 () Bool)

(declare-fun e!147619 () Bool)

(assert (=> d!73627 e!147619))

(declare-fun res!182645 () Bool)

(assert (=> d!73627 (=> (not res!182645) (not e!147619))))

(declare-fun lt!343343 () (_ BitVec 64))

(declare-fun lt!343341 () (_ BitVec 64))

(declare-fun lt!343340 () (_ BitVec 64))

(assert (=> d!73627 (= res!182645 (= lt!343341 (bvsub lt!343343 lt!343340)))))

(assert (=> d!73627 (or (= (bvand lt!343343 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343340 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!343343 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!343343 lt!343340) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73627 (= lt!343340 (remainingBits!0 ((_ sign_extend 32) (size!4659 (buf!5200 (_2!9914 lt!342982)))) ((_ sign_extend 32) (currentByte!9787 (_2!9914 lt!342982))) ((_ sign_extend 32) (currentBit!9782 (_2!9914 lt!342982)))))))

(declare-fun lt!343338 () (_ BitVec 64))

(declare-fun lt!343339 () (_ BitVec 64))

(assert (=> d!73627 (= lt!343343 (bvmul lt!343338 lt!343339))))

(assert (=> d!73627 (or (= lt!343338 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!343339 (bvsdiv (bvmul lt!343338 lt!343339) lt!343338)))))

(assert (=> d!73627 (= lt!343339 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73627 (= lt!343338 ((_ sign_extend 32) (size!4659 (buf!5200 (_2!9914 lt!342982)))))))

(assert (=> d!73627 (= lt!343341 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9787 (_2!9914 lt!342982))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9782 (_2!9914 lt!342982)))))))

(assert (=> d!73627 (invariant!0 (currentBit!9782 (_2!9914 lt!342982)) (currentByte!9787 (_2!9914 lt!342982)) (size!4659 (buf!5200 (_2!9914 lt!342982))))))

(assert (=> d!73627 (= (bitIndex!0 (size!4659 (buf!5200 (_2!9914 lt!342982))) (currentByte!9787 (_2!9914 lt!342982)) (currentBit!9782 (_2!9914 lt!342982))) lt!343341)))

(declare-fun b!217076 () Bool)

(declare-fun res!182646 () Bool)

(assert (=> b!217076 (=> (not res!182646) (not e!147619))))

(assert (=> b!217076 (= res!182646 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!343341))))

(declare-fun b!217077 () Bool)

(declare-fun lt!343342 () (_ BitVec 64))

(assert (=> b!217077 (= e!147619 (bvsle lt!343341 (bvmul lt!343342 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217077 (or (= lt!343342 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!343342 #b0000000000000000000000000000000000000000000000000000000000001000) lt!343342)))))

(assert (=> b!217077 (= lt!343342 ((_ sign_extend 32) (size!4659 (buf!5200 (_2!9914 lt!342982)))))))

(assert (= (and d!73627 res!182645) b!217076))

(assert (= (and b!217076 res!182646) b!217077))

(declare-fun m!334925 () Bool)

(assert (=> d!73627 m!334925))

(assert (=> d!73627 m!334815))

(assert (=> b!216939 d!73627))

(declare-fun d!73629 () Bool)

(declare-fun e!147620 () Bool)

(assert (=> d!73629 e!147620))

(declare-fun res!182647 () Bool)

(assert (=> d!73629 (=> (not res!182647) (not e!147620))))

(declare-fun lt!343349 () (_ BitVec 64))

(declare-fun lt!343346 () (_ BitVec 64))

(declare-fun lt!343347 () (_ BitVec 64))

(assert (=> d!73629 (= res!182647 (= lt!343347 (bvsub lt!343349 lt!343346)))))

(assert (=> d!73629 (or (= (bvand lt!343349 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343346 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!343349 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!343349 lt!343346) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73629 (= lt!343346 (remainingBits!0 ((_ sign_extend 32) (size!4659 (buf!5200 thiss!1204))) ((_ sign_extend 32) (currentByte!9787 thiss!1204)) ((_ sign_extend 32) (currentBit!9782 thiss!1204))))))

(declare-fun lt!343344 () (_ BitVec 64))

(declare-fun lt!343345 () (_ BitVec 64))

(assert (=> d!73629 (= lt!343349 (bvmul lt!343344 lt!343345))))

(assert (=> d!73629 (or (= lt!343344 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!343345 (bvsdiv (bvmul lt!343344 lt!343345) lt!343344)))))

(assert (=> d!73629 (= lt!343345 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73629 (= lt!343344 ((_ sign_extend 32) (size!4659 (buf!5200 thiss!1204))))))

(assert (=> d!73629 (= lt!343347 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9787 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9782 thiss!1204))))))

(assert (=> d!73629 (invariant!0 (currentBit!9782 thiss!1204) (currentByte!9787 thiss!1204) (size!4659 (buf!5200 thiss!1204)))))

(assert (=> d!73629 (= (bitIndex!0 (size!4659 (buf!5200 thiss!1204)) (currentByte!9787 thiss!1204) (currentBit!9782 thiss!1204)) lt!343347)))

(declare-fun b!217078 () Bool)

(declare-fun res!182648 () Bool)

(assert (=> b!217078 (=> (not res!182648) (not e!147620))))

(assert (=> b!217078 (= res!182648 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!343347))))

(declare-fun b!217079 () Bool)

(declare-fun lt!343348 () (_ BitVec 64))

(assert (=> b!217079 (= e!147620 (bvsle lt!343347 (bvmul lt!343348 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217079 (or (= lt!343348 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!343348 #b0000000000000000000000000000000000000000000000000000000000001000) lt!343348)))))

(assert (=> b!217079 (= lt!343348 ((_ sign_extend 32) (size!4659 (buf!5200 thiss!1204))))))

(assert (= (and d!73629 res!182647) b!217078))

(assert (= (and b!217078 res!182648) b!217079))

(declare-fun m!334927 () Bool)

(assert (=> d!73629 m!334927))

(assert (=> d!73629 m!334657))

(assert (=> b!216939 d!73629))

(declare-fun d!73631 () Bool)

(assert (=> d!73631 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9782 thiss!1204) (currentByte!9787 thiss!1204) (size!4659 (buf!5200 thiss!1204))))))

(declare-fun bs!17982 () Bool)

(assert (= bs!17982 d!73631))

(assert (=> bs!17982 m!334657))

(assert (=> start!45034 d!73631))

(declare-fun d!73633 () Bool)

(declare-fun e!147621 () Bool)

(assert (=> d!73633 e!147621))

(declare-fun res!182649 () Bool)

(assert (=> d!73633 (=> (not res!182649) (not e!147621))))

(declare-fun lt!343355 () (_ BitVec 64))

(declare-fun lt!343352 () (_ BitVec 64))

(declare-fun lt!343353 () (_ BitVec 64))

(assert (=> d!73633 (= res!182649 (= lt!343353 (bvsub lt!343355 lt!343352)))))

(assert (=> d!73633 (or (= (bvand lt!343355 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343352 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!343355 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!343355 lt!343352) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73633 (= lt!343352 (remainingBits!0 ((_ sign_extend 32) (size!4659 (buf!5200 (_1!9916 lt!342980)))) ((_ sign_extend 32) (currentByte!9787 (_1!9916 lt!342980))) ((_ sign_extend 32) (currentBit!9782 (_1!9916 lt!342980)))))))

(declare-fun lt!343350 () (_ BitVec 64))

(declare-fun lt!343351 () (_ BitVec 64))

(assert (=> d!73633 (= lt!343355 (bvmul lt!343350 lt!343351))))

(assert (=> d!73633 (or (= lt!343350 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!343351 (bvsdiv (bvmul lt!343350 lt!343351) lt!343350)))))

(assert (=> d!73633 (= lt!343351 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73633 (= lt!343350 ((_ sign_extend 32) (size!4659 (buf!5200 (_1!9916 lt!342980)))))))

(assert (=> d!73633 (= lt!343353 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9787 (_1!9916 lt!342980))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9782 (_1!9916 lt!342980)))))))

(assert (=> d!73633 (invariant!0 (currentBit!9782 (_1!9916 lt!342980)) (currentByte!9787 (_1!9916 lt!342980)) (size!4659 (buf!5200 (_1!9916 lt!342980))))))

(assert (=> d!73633 (= (bitIndex!0 (size!4659 (buf!5200 (_1!9916 lt!342980))) (currentByte!9787 (_1!9916 lt!342980)) (currentBit!9782 (_1!9916 lt!342980))) lt!343353)))

(declare-fun b!217080 () Bool)

(declare-fun res!182650 () Bool)

(assert (=> b!217080 (=> (not res!182650) (not e!147621))))

(assert (=> b!217080 (= res!182650 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!343353))))

(declare-fun b!217081 () Bool)

(declare-fun lt!343354 () (_ BitVec 64))

(assert (=> b!217081 (= e!147621 (bvsle lt!343353 (bvmul lt!343354 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217081 (or (= lt!343354 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!343354 #b0000000000000000000000000000000000000000000000000000000000001000) lt!343354)))))

(assert (=> b!217081 (= lt!343354 ((_ sign_extend 32) (size!4659 (buf!5200 (_1!9916 lt!342980)))))))

(assert (= (and d!73633 res!182649) b!217080))

(assert (= (and b!217080 res!182650) b!217081))

(declare-fun m!334929 () Bool)

(assert (=> d!73633 m!334929))

(declare-fun m!334931 () Bool)

(assert (=> d!73633 m!334931))

(assert (=> b!216928 d!73633))

(declare-fun d!73635 () Bool)

(declare-fun e!147622 () Bool)

(assert (=> d!73635 e!147622))

(declare-fun res!182651 () Bool)

(assert (=> d!73635 (=> (not res!182651) (not e!147622))))

(declare-fun lt!343359 () (_ BitVec 64))

(declare-fun lt!343358 () (_ BitVec 64))

(declare-fun lt!343361 () (_ BitVec 64))

(assert (=> d!73635 (= res!182651 (= lt!343359 (bvsub lt!343361 lt!343358)))))

(assert (=> d!73635 (or (= (bvand lt!343361 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343358 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!343361 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!343361 lt!343358) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73635 (= lt!343358 (remainingBits!0 ((_ sign_extend 32) (size!4659 (buf!5200 (_2!9913 lt!342962)))) ((_ sign_extend 32) (currentByte!9787 (_2!9913 lt!342962))) ((_ sign_extend 32) (currentBit!9782 (_2!9913 lt!342962)))))))

(declare-fun lt!343356 () (_ BitVec 64))

(declare-fun lt!343357 () (_ BitVec 64))

(assert (=> d!73635 (= lt!343361 (bvmul lt!343356 lt!343357))))

(assert (=> d!73635 (or (= lt!343356 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!343357 (bvsdiv (bvmul lt!343356 lt!343357) lt!343356)))))

(assert (=> d!73635 (= lt!343357 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73635 (= lt!343356 ((_ sign_extend 32) (size!4659 (buf!5200 (_2!9913 lt!342962)))))))

(assert (=> d!73635 (= lt!343359 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9787 (_2!9913 lt!342962))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9782 (_2!9913 lt!342962)))))))

(assert (=> d!73635 (invariant!0 (currentBit!9782 (_2!9913 lt!342962)) (currentByte!9787 (_2!9913 lt!342962)) (size!4659 (buf!5200 (_2!9913 lt!342962))))))

(assert (=> d!73635 (= (bitIndex!0 (size!4659 (buf!5200 (_2!9913 lt!342962))) (currentByte!9787 (_2!9913 lt!342962)) (currentBit!9782 (_2!9913 lt!342962))) lt!343359)))

(declare-fun b!217082 () Bool)

(declare-fun res!182652 () Bool)

(assert (=> b!217082 (=> (not res!182652) (not e!147622))))

(assert (=> b!217082 (= res!182652 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!343359))))

(declare-fun b!217083 () Bool)

(declare-fun lt!343360 () (_ BitVec 64))

(assert (=> b!217083 (= e!147622 (bvsle lt!343359 (bvmul lt!343360 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217083 (or (= lt!343360 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!343360 #b0000000000000000000000000000000000000000000000000000000000001000) lt!343360)))))

(assert (=> b!217083 (= lt!343360 ((_ sign_extend 32) (size!4659 (buf!5200 (_2!9913 lt!342962)))))))

(assert (= (and d!73635 res!182651) b!217082))

(assert (= (and b!217082 res!182652) b!217083))

(declare-fun m!334933 () Bool)

(assert (=> d!73635 m!334933))

(declare-fun m!334935 () Bool)

(assert (=> d!73635 m!334935))

(assert (=> b!216928 d!73635))

(declare-fun d!73637 () Bool)

(declare-fun res!182661 () Bool)

(declare-fun e!147627 () Bool)

(assert (=> d!73637 (=> (not res!182661) (not e!147627))))

(assert (=> d!73637 (= res!182661 (= (size!4659 (buf!5200 thiss!1204)) (size!4659 (buf!5200 (_2!9914 lt!342982)))))))

(assert (=> d!73637 (= (isPrefixOf!0 thiss!1204 (_2!9914 lt!342982)) e!147627)))

(declare-fun b!217090 () Bool)

(declare-fun res!182659 () Bool)

(assert (=> b!217090 (=> (not res!182659) (not e!147627))))

(assert (=> b!217090 (= res!182659 (bvsle (bitIndex!0 (size!4659 (buf!5200 thiss!1204)) (currentByte!9787 thiss!1204) (currentBit!9782 thiss!1204)) (bitIndex!0 (size!4659 (buf!5200 (_2!9914 lt!342982))) (currentByte!9787 (_2!9914 lt!342982)) (currentBit!9782 (_2!9914 lt!342982)))))))

(declare-fun b!217091 () Bool)

(declare-fun e!147628 () Bool)

(assert (=> b!217091 (= e!147627 e!147628)))

(declare-fun res!182660 () Bool)

(assert (=> b!217091 (=> res!182660 e!147628)))

(assert (=> b!217091 (= res!182660 (= (size!4659 (buf!5200 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!217092 () Bool)

(assert (=> b!217092 (= e!147628 (arrayBitRangesEq!0 (buf!5200 thiss!1204) (buf!5200 (_2!9914 lt!342982)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4659 (buf!5200 thiss!1204)) (currentByte!9787 thiss!1204) (currentBit!9782 thiss!1204))))))

(assert (= (and d!73637 res!182661) b!217090))

(assert (= (and b!217090 res!182659) b!217091))

(assert (= (and b!217091 (not res!182660)) b!217092))

(assert (=> b!217090 m!334601))

(assert (=> b!217090 m!334599))

(assert (=> b!217092 m!334601))

(assert (=> b!217092 m!334601))

(declare-fun m!334937 () Bool)

(assert (=> b!217092 m!334937))

(assert (=> b!216943 d!73637))

(declare-fun d!73639 () Bool)

(declare-fun lt!343375 () tuple2!18516)

(declare-fun lt!343376 () tuple2!18516)

(assert (=> d!73639 (and (= (_2!9916 lt!343375) (_2!9916 lt!343376)) (= (_1!9916 lt!343375) (_1!9916 lt!343376)))))

(declare-fun lt!343378 () Bool)

(declare-fun lt!343374 () (_ BitVec 64))

(declare-fun lt!343377 () BitStream!8426)

(declare-fun lt!343379 () Unit!15437)

(declare-fun choose!56 (BitStream!8426 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!18516 tuple2!18516 BitStream!8426 (_ BitVec 64) Bool BitStream!8426 (_ BitVec 64) tuple2!18516 tuple2!18516 BitStream!8426 (_ BitVec 64)) Unit!15437)

(assert (=> d!73639 (= lt!343379 (choose!56 (_1!9913 lt!342962) nBits!348 i!590 lt!342981 lt!343375 (tuple2!18517 (_1!9916 lt!343375) (_2!9916 lt!343375)) (_1!9916 lt!343375) (_2!9916 lt!343375) lt!343378 lt!343377 lt!343374 lt!343376 (tuple2!18517 (_1!9916 lt!343376) (_2!9916 lt!343376)) (_1!9916 lt!343376) (_2!9916 lt!343376)))))

(assert (=> d!73639 (= lt!343376 (readNBitsLSBFirstsLoopPure!0 lt!343377 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!343374))))

(assert (=> d!73639 (= lt!343374 (bvor lt!342981 (ite lt!343378 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73639 (= lt!343377 (withMovedBitIndex!0 (_1!9913 lt!342962) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!73639 (= lt!343378 (_2!9915 (readBitPure!0 (_1!9913 lt!342962))))))

(assert (=> d!73639 (= lt!343375 (readNBitsLSBFirstsLoopPure!0 (_1!9913 lt!342962) nBits!348 i!590 lt!342981))))

(assert (=> d!73639 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9913 lt!342962) nBits!348 i!590 lt!342981) lt!343379)))

(declare-fun bs!17984 () Bool)

(assert (= bs!17984 d!73639))

(declare-fun m!334939 () Bool)

(assert (=> bs!17984 m!334939))

(assert (=> bs!17984 m!334623))

(assert (=> bs!17984 m!334605))

(declare-fun m!334941 () Bool)

(assert (=> bs!17984 m!334941))

(assert (=> bs!17984 m!334641))

(assert (=> b!216932 d!73639))

(declare-fun d!73641 () Bool)

(declare-fun lt!343380 () tuple2!18528)

(assert (=> d!73641 (= lt!343380 (readNBitsLSBFirstsLoop!0 lt!342971 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!342964))))

(assert (=> d!73641 (= (readNBitsLSBFirstsLoopPure!0 lt!342971 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!342964) (tuple2!18517 (_2!9922 lt!343380) (_1!9922 lt!343380)))))

(declare-fun bs!17985 () Bool)

(assert (= bs!17985 d!73641))

(declare-fun m!334943 () Bool)

(assert (=> bs!17985 m!334943))

(assert (=> b!216932 d!73641))

(declare-fun d!73643 () Bool)

(declare-fun e!147631 () Bool)

(assert (=> d!73643 e!147631))

(declare-fun res!182664 () Bool)

(assert (=> d!73643 (=> (not res!182664) (not e!147631))))

(declare-fun lt!343386 () (_ BitVec 64))

(declare-fun lt!343385 () BitStream!8426)

(assert (=> d!73643 (= res!182664 (= (bvadd lt!343386 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4659 (buf!5200 lt!343385)) (currentByte!9787 lt!343385) (currentBit!9782 lt!343385))))))

(assert (=> d!73643 (or (not (= (bvand lt!343386 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!343386 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!343386 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73643 (= lt!343386 (bitIndex!0 (size!4659 (buf!5200 (_1!9913 lt!342962))) (currentByte!9787 (_1!9913 lt!342962)) (currentBit!9782 (_1!9913 lt!342962))))))

(declare-fun moveBitIndex!0 (BitStream!8426 (_ BitVec 64)) tuple2!18512)

(assert (=> d!73643 (= lt!343385 (_2!9914 (moveBitIndex!0 (_1!9913 lt!342962) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8426 (_ BitVec 64)) Bool)

(assert (=> d!73643 (moveBitIndexPrecond!0 (_1!9913 lt!342962) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!73643 (= (withMovedBitIndex!0 (_1!9913 lt!342962) #b0000000000000000000000000000000000000000000000000000000000000001) lt!343385)))

(declare-fun b!217095 () Bool)

(assert (=> b!217095 (= e!147631 (= (size!4659 (buf!5200 (_1!9913 lt!342962))) (size!4659 (buf!5200 lt!343385))))))

(assert (= (and d!73643 res!182664) b!217095))

(declare-fun m!334945 () Bool)

(assert (=> d!73643 m!334945))

(declare-fun m!334947 () Bool)

(assert (=> d!73643 m!334947))

(declare-fun m!334949 () Bool)

(assert (=> d!73643 m!334949))

(declare-fun m!334951 () Bool)

(assert (=> d!73643 m!334951))

(assert (=> b!216932 d!73643))

(declare-fun d!73645 () Bool)

(assert (=> d!73645 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4659 (buf!5200 thiss!1204))) ((_ sign_extend 32) (currentByte!9787 thiss!1204)) ((_ sign_extend 32) (currentBit!9782 thiss!1204)) lt!342958) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4659 (buf!5200 thiss!1204))) ((_ sign_extend 32) (currentByte!9787 thiss!1204)) ((_ sign_extend 32) (currentBit!9782 thiss!1204))) lt!342958))))

(declare-fun bs!17986 () Bool)

(assert (= bs!17986 d!73645))

(assert (=> bs!17986 m!334927))

(assert (=> b!216933 d!73645))

(assert (=> b!216922 d!73627))

(assert (=> b!216922 d!73629))

(declare-fun b!217107 () Bool)

(declare-fun e!147637 () Bool)

(declare-fun e!147636 () Bool)

(assert (=> b!217107 (= e!147637 e!147636)))

(declare-fun res!182675 () Bool)

(assert (=> b!217107 (=> (not res!182675) (not e!147636))))

(declare-fun lt!343396 () tuple2!18514)

(declare-fun lt!343398 () tuple2!18512)

(assert (=> b!217107 (= res!182675 (and (= (_2!9915 lt!343396) lt!342957) (= (_1!9915 lt!343396) (_2!9914 lt!343398))))))

(assert (=> b!217107 (= lt!343396 (readBitPure!0 (readerFrom!0 (_2!9914 lt!343398) (currentBit!9782 thiss!1204) (currentByte!9787 thiss!1204))))))

(declare-fun b!217105 () Bool)

(declare-fun res!182674 () Bool)

(assert (=> b!217105 (=> (not res!182674) (not e!147637))))

(declare-fun lt!343397 () (_ BitVec 64))

(declare-fun lt!343395 () (_ BitVec 64))

(assert (=> b!217105 (= res!182674 (= (bitIndex!0 (size!4659 (buf!5200 (_2!9914 lt!343398))) (currentByte!9787 (_2!9914 lt!343398)) (currentBit!9782 (_2!9914 lt!343398))) (bvadd lt!343397 lt!343395)))))

(assert (=> b!217105 (or (not (= (bvand lt!343397 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343395 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!343397 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!343397 lt!343395) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217105 (= lt!343395 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!217105 (= lt!343397 (bitIndex!0 (size!4659 (buf!5200 thiss!1204)) (currentByte!9787 thiss!1204) (currentBit!9782 thiss!1204)))))

(declare-fun b!217106 () Bool)

(declare-fun res!182673 () Bool)

(assert (=> b!217106 (=> (not res!182673) (not e!147637))))

(assert (=> b!217106 (= res!182673 (isPrefixOf!0 thiss!1204 (_2!9914 lt!343398)))))

(declare-fun d!73647 () Bool)

(assert (=> d!73647 e!147637))

(declare-fun res!182676 () Bool)

(assert (=> d!73647 (=> (not res!182676) (not e!147637))))

(assert (=> d!73647 (= res!182676 (= (size!4659 (buf!5200 thiss!1204)) (size!4659 (buf!5200 (_2!9914 lt!343398)))))))

(declare-fun choose!16 (BitStream!8426 Bool) tuple2!18512)

(assert (=> d!73647 (= lt!343398 (choose!16 thiss!1204 lt!342957))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!73647 (validate_offset_bit!0 ((_ sign_extend 32) (size!4659 (buf!5200 thiss!1204))) ((_ sign_extend 32) (currentByte!9787 thiss!1204)) ((_ sign_extend 32) (currentBit!9782 thiss!1204)))))

(assert (=> d!73647 (= (appendBit!0 thiss!1204 lt!342957) lt!343398)))

(declare-fun b!217108 () Bool)

(assert (=> b!217108 (= e!147636 (= (bitIndex!0 (size!4659 (buf!5200 (_1!9915 lt!343396))) (currentByte!9787 (_1!9915 lt!343396)) (currentBit!9782 (_1!9915 lt!343396))) (bitIndex!0 (size!4659 (buf!5200 (_2!9914 lt!343398))) (currentByte!9787 (_2!9914 lt!343398)) (currentBit!9782 (_2!9914 lt!343398)))))))

(assert (= (and d!73647 res!182676) b!217105))

(assert (= (and b!217105 res!182674) b!217106))

(assert (= (and b!217106 res!182673) b!217107))

(assert (= (and b!217107 res!182675) b!217108))

(declare-fun m!334953 () Bool)

(assert (=> b!217105 m!334953))

(assert (=> b!217105 m!334601))

(declare-fun m!334955 () Bool)

(assert (=> b!217107 m!334955))

(assert (=> b!217107 m!334955))

(declare-fun m!334957 () Bool)

(assert (=> b!217107 m!334957))

(declare-fun m!334959 () Bool)

(assert (=> d!73647 m!334959))

(declare-fun m!334961 () Bool)

(assert (=> d!73647 m!334961))

(declare-fun m!334963 () Bool)

(assert (=> b!217106 m!334963))

(declare-fun m!334965 () Bool)

(assert (=> b!217108 m!334965))

(assert (=> b!217108 m!334953))

(assert (=> b!216922 d!73647))

(declare-fun d!73649 () Bool)

(declare-fun e!147638 () Bool)

(assert (=> d!73649 e!147638))

(declare-fun res!182677 () Bool)

(assert (=> d!73649 (=> (not res!182677) (not e!147638))))

(declare-fun lt!343401 () (_ BitVec 64))

(declare-fun lt!343404 () (_ BitVec 64))

(declare-fun lt!343402 () (_ BitVec 64))

(assert (=> d!73649 (= res!182677 (= lt!343402 (bvsub lt!343404 lt!343401)))))

(assert (=> d!73649 (or (= (bvand lt!343404 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343401 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!343404 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!343404 lt!343401) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73649 (= lt!343401 (remainingBits!0 ((_ sign_extend 32) (size!4659 (buf!5200 (_1!9915 lt!342954)))) ((_ sign_extend 32) (currentByte!9787 (_1!9915 lt!342954))) ((_ sign_extend 32) (currentBit!9782 (_1!9915 lt!342954)))))))

(declare-fun lt!343399 () (_ BitVec 64))

(declare-fun lt!343400 () (_ BitVec 64))

(assert (=> d!73649 (= lt!343404 (bvmul lt!343399 lt!343400))))

(assert (=> d!73649 (or (= lt!343399 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!343400 (bvsdiv (bvmul lt!343399 lt!343400) lt!343399)))))

(assert (=> d!73649 (= lt!343400 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73649 (= lt!343399 ((_ sign_extend 32) (size!4659 (buf!5200 (_1!9915 lt!342954)))))))

(assert (=> d!73649 (= lt!343402 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9787 (_1!9915 lt!342954))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9782 (_1!9915 lt!342954)))))))

(assert (=> d!73649 (invariant!0 (currentBit!9782 (_1!9915 lt!342954)) (currentByte!9787 (_1!9915 lt!342954)) (size!4659 (buf!5200 (_1!9915 lt!342954))))))

(assert (=> d!73649 (= (bitIndex!0 (size!4659 (buf!5200 (_1!9915 lt!342954))) (currentByte!9787 (_1!9915 lt!342954)) (currentBit!9782 (_1!9915 lt!342954))) lt!343402)))

(declare-fun b!217109 () Bool)

(declare-fun res!182678 () Bool)

(assert (=> b!217109 (=> (not res!182678) (not e!147638))))

(assert (=> b!217109 (= res!182678 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!343402))))

(declare-fun b!217110 () Bool)

(declare-fun lt!343403 () (_ BitVec 64))

(assert (=> b!217110 (= e!147638 (bvsle lt!343402 (bvmul lt!343403 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217110 (or (= lt!343403 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!343403 #b0000000000000000000000000000000000000000000000000000000000001000) lt!343403)))))

(assert (=> b!217110 (= lt!343403 ((_ sign_extend 32) (size!4659 (buf!5200 (_1!9915 lt!342954)))))))

(assert (= (and d!73649 res!182677) b!217109))

(assert (= (and b!217109 res!182678) b!217110))

(declare-fun m!334967 () Bool)

(assert (=> d!73649 m!334967))

(declare-fun m!334969 () Bool)

(assert (=> d!73649 m!334969))

(assert (=> b!216931 d!73649))

(declare-fun d!73651 () Bool)

(declare-fun e!147639 () Bool)

(assert (=> d!73651 e!147639))

(declare-fun res!182679 () Bool)

(assert (=> d!73651 (=> (not res!182679) (not e!147639))))

(declare-fun lt!343405 () BitStream!8426)

(declare-fun lt!343406 () (_ BitVec 64))

(assert (=> d!73651 (= res!182679 (= (bvadd lt!343406 (bvsub lt!342959 lt!342970)) (bitIndex!0 (size!4659 (buf!5200 lt!343405)) (currentByte!9787 lt!343405) (currentBit!9782 lt!343405))))))

(assert (=> d!73651 (or (not (= (bvand lt!343406 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342959 lt!342970) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!343406 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!343406 (bvsub lt!342959 lt!342970)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73651 (= lt!343406 (bitIndex!0 (size!4659 (buf!5200 (_2!9913 lt!342962))) (currentByte!9787 (_2!9913 lt!342962)) (currentBit!9782 (_2!9913 lt!342962))))))

(assert (=> d!73651 (= lt!343405 (_2!9914 (moveBitIndex!0 (_2!9913 lt!342962) (bvsub lt!342959 lt!342970))))))

(assert (=> d!73651 (moveBitIndexPrecond!0 (_2!9913 lt!342962) (bvsub lt!342959 lt!342970))))

(assert (=> d!73651 (= (withMovedBitIndex!0 (_2!9913 lt!342962) (bvsub lt!342959 lt!342970)) lt!343405)))

(declare-fun b!217111 () Bool)

(assert (=> b!217111 (= e!147639 (= (size!4659 (buf!5200 (_2!9913 lt!342962))) (size!4659 (buf!5200 lt!343405))))))

(assert (= (and d!73651 res!182679) b!217111))

(declare-fun m!334971 () Bool)

(assert (=> d!73651 m!334971))

(assert (=> d!73651 m!334649))

(declare-fun m!334973 () Bool)

(assert (=> d!73651 m!334973))

(declare-fun m!334975 () Bool)

(assert (=> d!73651 m!334975))

(assert (=> b!216920 d!73651))

(assert (=> b!216921 d!73637))

(declare-fun d!73653 () Bool)

(assert (=> d!73653 (= (invariant!0 (currentBit!9782 (_2!9914 lt!342968)) (currentByte!9787 (_2!9914 lt!342968)) (size!4659 (buf!5200 (_2!9914 lt!342968)))) (and (bvsge (currentBit!9782 (_2!9914 lt!342968)) #b00000000000000000000000000000000) (bvslt (currentBit!9782 (_2!9914 lt!342968)) #b00000000000000000000000000001000) (bvsge (currentByte!9787 (_2!9914 lt!342968)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9787 (_2!9914 lt!342968)) (size!4659 (buf!5200 (_2!9914 lt!342968)))) (and (= (currentBit!9782 (_2!9914 lt!342968)) #b00000000000000000000000000000000) (= (currentByte!9787 (_2!9914 lt!342968)) (size!4659 (buf!5200 (_2!9914 lt!342968))))))))))

(assert (=> b!216942 d!73653))

(declare-fun d!73655 () Bool)

(declare-fun e!147640 () Bool)

(assert (=> d!73655 e!147640))

(declare-fun res!182680 () Bool)

(assert (=> d!73655 (=> (not res!182680) (not e!147640))))

(declare-fun lt!343409 () (_ BitVec 64))

(declare-fun lt!343412 () (_ BitVec 64))

(declare-fun lt!343410 () (_ BitVec 64))

(assert (=> d!73655 (= res!182680 (= lt!343410 (bvsub lt!343412 lt!343409)))))

(assert (=> d!73655 (or (= (bvand lt!343412 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!343409 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!343412 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!343412 lt!343409) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73655 (= lt!343409 (remainingBits!0 ((_ sign_extend 32) (size!4659 (buf!5200 (_2!9914 lt!342968)))) ((_ sign_extend 32) (currentByte!9787 (_2!9914 lt!342968))) ((_ sign_extend 32) (currentBit!9782 (_2!9914 lt!342968)))))))

(declare-fun lt!343407 () (_ BitVec 64))

(declare-fun lt!343408 () (_ BitVec 64))

(assert (=> d!73655 (= lt!343412 (bvmul lt!343407 lt!343408))))

(assert (=> d!73655 (or (= lt!343407 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!343408 (bvsdiv (bvmul lt!343407 lt!343408) lt!343407)))))

(assert (=> d!73655 (= lt!343408 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73655 (= lt!343407 ((_ sign_extend 32) (size!4659 (buf!5200 (_2!9914 lt!342968)))))))

(assert (=> d!73655 (= lt!343410 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9787 (_2!9914 lt!342968))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9782 (_2!9914 lt!342968)))))))

(assert (=> d!73655 (invariant!0 (currentBit!9782 (_2!9914 lt!342968)) (currentByte!9787 (_2!9914 lt!342968)) (size!4659 (buf!5200 (_2!9914 lt!342968))))))

(assert (=> d!73655 (= (bitIndex!0 (size!4659 (buf!5200 (_2!9914 lt!342968))) (currentByte!9787 (_2!9914 lt!342968)) (currentBit!9782 (_2!9914 lt!342968))) lt!343410)))

(declare-fun b!217112 () Bool)

(declare-fun res!182681 () Bool)

(assert (=> b!217112 (=> (not res!182681) (not e!147640))))

(assert (=> b!217112 (= res!182681 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!343410))))

(declare-fun b!217113 () Bool)

(declare-fun lt!343411 () (_ BitVec 64))

(assert (=> b!217113 (= e!147640 (bvsle lt!343410 (bvmul lt!343411 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!217113 (or (= lt!343411 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!343411 #b0000000000000000000000000000000000000000000000000000000000001000) lt!343411)))))

(assert (=> b!217113 (= lt!343411 ((_ sign_extend 32) (size!4659 (buf!5200 (_2!9914 lt!342968)))))))

(assert (= (and d!73655 res!182680) b!217112))

(assert (= (and b!217112 res!182681) b!217113))

(declare-fun m!334977 () Bool)

(assert (=> d!73655 m!334977))

(assert (=> d!73655 m!334655))

(assert (=> b!216935 d!73655))

(declare-fun d!73657 () Bool)

(declare-fun res!182684 () Bool)

(declare-fun e!147641 () Bool)

(assert (=> d!73657 (=> (not res!182684) (not e!147641))))

(assert (=> d!73657 (= res!182684 (= (size!4659 (buf!5200 thiss!1204)) (size!4659 (buf!5200 (_2!9914 lt!342968)))))))

(assert (=> d!73657 (= (isPrefixOf!0 thiss!1204 (_2!9914 lt!342968)) e!147641)))

(declare-fun b!217114 () Bool)

(declare-fun res!182682 () Bool)

(assert (=> b!217114 (=> (not res!182682) (not e!147641))))

(assert (=> b!217114 (= res!182682 (bvsle (bitIndex!0 (size!4659 (buf!5200 thiss!1204)) (currentByte!9787 thiss!1204) (currentBit!9782 thiss!1204)) (bitIndex!0 (size!4659 (buf!5200 (_2!9914 lt!342968))) (currentByte!9787 (_2!9914 lt!342968)) (currentBit!9782 (_2!9914 lt!342968)))))))

(declare-fun b!217115 () Bool)

(declare-fun e!147642 () Bool)

(assert (=> b!217115 (= e!147641 e!147642)))

(declare-fun res!182683 () Bool)

(assert (=> b!217115 (=> res!182683 e!147642)))

(assert (=> b!217115 (= res!182683 (= (size!4659 (buf!5200 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!217116 () Bool)

(assert (=> b!217116 (= e!147642 (arrayBitRangesEq!0 (buf!5200 thiss!1204) (buf!5200 (_2!9914 lt!342968)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4659 (buf!5200 thiss!1204)) (currentByte!9787 thiss!1204) (currentBit!9782 thiss!1204))))))

(assert (= (and d!73657 res!182684) b!217114))

(assert (= (and b!217114 res!182682) b!217115))

(assert (= (and b!217115 (not res!182683)) b!217116))

(assert (=> b!217114 m!334601))

(assert (=> b!217114 m!334581))

(assert (=> b!217116 m!334601))

(assert (=> b!217116 m!334601))

(declare-fun m!334979 () Bool)

(assert (=> b!217116 m!334979))

(assert (=> b!216935 d!73657))

(declare-fun d!73659 () Bool)

(assert (=> d!73659 (isPrefixOf!0 thiss!1204 (_2!9914 lt!342968))))

(declare-fun lt!343415 () Unit!15437)

(declare-fun choose!30 (BitStream!8426 BitStream!8426 BitStream!8426) Unit!15437)

(assert (=> d!73659 (= lt!343415 (choose!30 thiss!1204 (_2!9914 lt!342982) (_2!9914 lt!342968)))))

(assert (=> d!73659 (isPrefixOf!0 thiss!1204 (_2!9914 lt!342982))))

(assert (=> d!73659 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9914 lt!342982) (_2!9914 lt!342968)) lt!343415)))

(declare-fun bs!17987 () Bool)

(assert (= bs!17987 d!73659))

(assert (=> bs!17987 m!334583))

(declare-fun m!334981 () Bool)

(assert (=> bs!17987 m!334981))

(assert (=> bs!17987 m!334597))

(assert (=> b!216935 d!73659))

(declare-fun b!217307 () Bool)

(declare-fun e!147756 () (_ BitVec 64))

(assert (=> b!217307 (= e!147756 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!217308 () Bool)

(declare-fun res!182835 () Bool)

(declare-fun e!147748 () Bool)

(assert (=> b!217308 (=> (not res!182835) (not e!147748))))

(declare-fun lt!344074 () tuple2!18512)

(assert (=> b!217308 (= res!182835 (isPrefixOf!0 (_2!9914 lt!342982) (_2!9914 lt!344074)))))

(declare-fun b!217309 () Bool)

(declare-fun e!147753 () Bool)

(assert (=> b!217309 (= e!147748 e!147753)))

(declare-fun res!182837 () Bool)

(assert (=> b!217309 (=> (not res!182837) (not e!147753))))

(declare-fun lt!344110 () tuple2!18516)

(assert (=> b!217309 (= res!182837 (= (_2!9916 lt!344110) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!344094 () tuple2!18510)

(assert (=> b!217309 (= lt!344110 (readNBitsLSBFirstsLoopPure!0 (_1!9913 lt!344094) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!344095 () Unit!15437)

(declare-fun lt!344073 () Unit!15437)

(assert (=> b!217309 (= lt!344095 lt!344073)))

(declare-fun lt!344072 () (_ BitVec 64))

(assert (=> b!217309 (validate_offset_bits!1 ((_ sign_extend 32) (size!4659 (buf!5200 (_2!9914 lt!344074)))) ((_ sign_extend 32) (currentByte!9787 (_2!9914 lt!342982))) ((_ sign_extend 32) (currentBit!9782 (_2!9914 lt!342982))) lt!344072)))

(assert (=> b!217309 (= lt!344073 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9914 lt!342982) (buf!5200 (_2!9914 lt!344074)) lt!344072))))

(declare-fun e!147755 () Bool)

(assert (=> b!217309 e!147755))

(declare-fun res!182834 () Bool)

(assert (=> b!217309 (=> (not res!182834) (not e!147755))))

(assert (=> b!217309 (= res!182834 (and (= (size!4659 (buf!5200 (_2!9914 lt!342982))) (size!4659 (buf!5200 (_2!9914 lt!344074)))) (bvsge lt!344072 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217309 (= lt!344072 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!217309 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!217309 (= lt!344094 (reader!0 (_2!9914 lt!342982) (_2!9914 lt!344074)))))

(declare-fun b!217310 () Bool)

(declare-fun res!182840 () Bool)

(declare-fun lt!344068 () tuple2!18512)

(assert (=> b!217310 (= res!182840 (isPrefixOf!0 (_2!9914 lt!342982) (_2!9914 lt!344068)))))

(declare-fun e!147749 () Bool)

(assert (=> b!217310 (=> (not res!182840) (not e!147749))))

(declare-fun b!217311 () Bool)

(declare-fun res!182839 () Bool)

(assert (=> b!217311 (= res!182839 (= (bitIndex!0 (size!4659 (buf!5200 (_2!9914 lt!344068))) (currentByte!9787 (_2!9914 lt!344068)) (currentBit!9782 (_2!9914 lt!344068))) (bvadd (bitIndex!0 (size!4659 (buf!5200 (_2!9914 lt!342982))) (currentByte!9787 (_2!9914 lt!342982)) (currentBit!9782 (_2!9914 lt!342982))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!217311 (=> (not res!182839) (not e!147749))))

(declare-fun d!73661 () Bool)

(assert (=> d!73661 e!147748))

(declare-fun res!182841 () Bool)

(assert (=> d!73661 (=> (not res!182841) (not e!147748))))

(assert (=> d!73661 (= res!182841 (invariant!0 (currentBit!9782 (_2!9914 lt!344074)) (currentByte!9787 (_2!9914 lt!344074)) (size!4659 (buf!5200 (_2!9914 lt!344074)))))))

(declare-fun e!147754 () tuple2!18512)

(assert (=> d!73661 (= lt!344074 e!147754)))

(declare-fun c!10628 () Bool)

(assert (=> d!73661 (= c!10628 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!73661 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!73661 (= (appendBitsLSBFirstLoopTR!0 (_2!9914 lt!342982) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!344074)))

(declare-fun b!217312 () Bool)

(assert (=> b!217312 (= e!147756 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!344090 () tuple2!18512)

(declare-fun bm!3399 () Bool)

(declare-fun call!3402 () Bool)

(assert (=> bm!3399 (= call!3402 (isPrefixOf!0 (_2!9914 lt!342982) (ite c!10628 (_2!9914 lt!342982) (_2!9914 lt!344090))))))

(declare-fun b!217313 () Bool)

(assert (=> b!217313 (= e!147753 (= (_1!9916 lt!344110) (_2!9913 lt!344094)))))

(declare-fun b!217314 () Bool)

(declare-fun res!182844 () Bool)

(assert (=> b!217314 (=> (not res!182844) (not e!147748))))

(assert (=> b!217314 (= res!182844 (= (size!4659 (buf!5200 (_2!9914 lt!342982))) (size!4659 (buf!5200 (_2!9914 lt!344074)))))))

(declare-fun b!217315 () Bool)

(assert (=> b!217315 (= e!147754 (tuple2!18513 (_1!9914 lt!344090) (_2!9914 lt!344090)))))

(declare-fun lt!344062 () Bool)

(assert (=> b!217315 (= lt!344062 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217315 (= lt!344068 (appendBit!0 (_2!9914 lt!342982) lt!344062))))

(declare-fun res!182836 () Bool)

(assert (=> b!217315 (= res!182836 (= (size!4659 (buf!5200 (_2!9914 lt!342982))) (size!4659 (buf!5200 (_2!9914 lt!344068)))))))

(assert (=> b!217315 (=> (not res!182836) (not e!147749))))

(assert (=> b!217315 e!147749))

(declare-fun lt!344067 () tuple2!18512)

(assert (=> b!217315 (= lt!344067 lt!344068)))

(assert (=> b!217315 (= lt!344090 (appendBitsLSBFirstLoopTR!0 (_2!9914 lt!344067) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!344064 () Unit!15437)

(assert (=> b!217315 (= lt!344064 (lemmaIsPrefixTransitive!0 (_2!9914 lt!342982) (_2!9914 lt!344067) (_2!9914 lt!344090)))))

(assert (=> b!217315 call!3402))

(declare-fun lt!344099 () Unit!15437)

(assert (=> b!217315 (= lt!344099 lt!344064)))

(assert (=> b!217315 (invariant!0 (currentBit!9782 (_2!9914 lt!342982)) (currentByte!9787 (_2!9914 lt!342982)) (size!4659 (buf!5200 (_2!9914 lt!344067))))))

(declare-fun lt!344081 () BitStream!8426)

(assert (=> b!217315 (= lt!344081 (BitStream!8427 (buf!5200 (_2!9914 lt!344067)) (currentByte!9787 (_2!9914 lt!342982)) (currentBit!9782 (_2!9914 lt!342982))))))

(assert (=> b!217315 (invariant!0 (currentBit!9782 lt!344081) (currentByte!9787 lt!344081) (size!4659 (buf!5200 (_2!9914 lt!344090))))))

(declare-fun lt!344071 () BitStream!8426)

(assert (=> b!217315 (= lt!344071 (BitStream!8427 (buf!5200 (_2!9914 lt!344090)) (currentByte!9787 lt!344081) (currentBit!9782 lt!344081)))))

(declare-fun lt!344087 () tuple2!18514)

(assert (=> b!217315 (= lt!344087 (readBitPure!0 lt!344081))))

(declare-fun lt!344084 () tuple2!18514)

(assert (=> b!217315 (= lt!344084 (readBitPure!0 lt!344071))))

(declare-fun lt!344083 () Unit!15437)

(assert (=> b!217315 (= lt!344083 (readBitPrefixLemma!0 lt!344081 (_2!9914 lt!344090)))))

(declare-fun res!182838 () Bool)

(assert (=> b!217315 (= res!182838 (= (bitIndex!0 (size!4659 (buf!5200 (_1!9915 lt!344087))) (currentByte!9787 (_1!9915 lt!344087)) (currentBit!9782 (_1!9915 lt!344087))) (bitIndex!0 (size!4659 (buf!5200 (_1!9915 lt!344084))) (currentByte!9787 (_1!9915 lt!344084)) (currentBit!9782 (_1!9915 lt!344084)))))))

(declare-fun e!147752 () Bool)

(assert (=> b!217315 (=> (not res!182838) (not e!147752))))

(assert (=> b!217315 e!147752))

(declare-fun lt!344091 () Unit!15437)

(assert (=> b!217315 (= lt!344091 lt!344083)))

(declare-fun lt!344108 () tuple2!18510)

(assert (=> b!217315 (= lt!344108 (reader!0 (_2!9914 lt!342982) (_2!9914 lt!344090)))))

(declare-fun lt!344113 () tuple2!18510)

(assert (=> b!217315 (= lt!344113 (reader!0 (_2!9914 lt!344067) (_2!9914 lt!344090)))))

(declare-fun lt!344101 () tuple2!18514)

(assert (=> b!217315 (= lt!344101 (readBitPure!0 (_1!9913 lt!344108)))))

(assert (=> b!217315 (= (_2!9915 lt!344101) lt!344062)))

(declare-fun lt!344069 () Unit!15437)

(declare-fun Unit!15467 () Unit!15437)

(assert (=> b!217315 (= lt!344069 Unit!15467)))

(declare-fun lt!344078 () (_ BitVec 64))

(assert (=> b!217315 (= lt!344078 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!344112 () (_ BitVec 64))

(assert (=> b!217315 (= lt!344112 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!344070 () Unit!15437)

(assert (=> b!217315 (= lt!344070 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9914 lt!342982) (buf!5200 (_2!9914 lt!344090)) lt!344112))))

(assert (=> b!217315 (validate_offset_bits!1 ((_ sign_extend 32) (size!4659 (buf!5200 (_2!9914 lt!344090)))) ((_ sign_extend 32) (currentByte!9787 (_2!9914 lt!342982))) ((_ sign_extend 32) (currentBit!9782 (_2!9914 lt!342982))) lt!344112)))

(declare-fun lt!344065 () Unit!15437)

(assert (=> b!217315 (= lt!344065 lt!344070)))

(declare-fun lt!344105 () tuple2!18516)

(assert (=> b!217315 (= lt!344105 (readNBitsLSBFirstsLoopPure!0 (_1!9913 lt!344108) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!344078))))

(declare-fun lt!344082 () (_ BitVec 64))

(assert (=> b!217315 (= lt!344082 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!344061 () Unit!15437)

(assert (=> b!217315 (= lt!344061 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9914 lt!344067) (buf!5200 (_2!9914 lt!344090)) lt!344082))))

(assert (=> b!217315 (validate_offset_bits!1 ((_ sign_extend 32) (size!4659 (buf!5200 (_2!9914 lt!344090)))) ((_ sign_extend 32) (currentByte!9787 (_2!9914 lt!344067))) ((_ sign_extend 32) (currentBit!9782 (_2!9914 lt!344067))) lt!344082)))

(declare-fun lt!344103 () Unit!15437)

(assert (=> b!217315 (= lt!344103 lt!344061)))

(declare-fun lt!344102 () tuple2!18516)

(assert (=> b!217315 (= lt!344102 (readNBitsLSBFirstsLoopPure!0 (_1!9913 lt!344113) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!344078 (ite (_2!9915 lt!344101) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!344086 () tuple2!18516)

(assert (=> b!217315 (= lt!344086 (readNBitsLSBFirstsLoopPure!0 (_1!9913 lt!344108) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!344078))))

(declare-fun c!10627 () Bool)

(assert (=> b!217315 (= c!10627 (_2!9915 (readBitPure!0 (_1!9913 lt!344108))))))

(declare-fun lt!344088 () tuple2!18516)

(assert (=> b!217315 (= lt!344088 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9913 lt!344108) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!344078 e!147756)))))

(declare-fun lt!344097 () Unit!15437)

(assert (=> b!217315 (= lt!344097 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9913 lt!344108) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!344078))))

(assert (=> b!217315 (and (= (_2!9916 lt!344086) (_2!9916 lt!344088)) (= (_1!9916 lt!344086) (_1!9916 lt!344088)))))

(declare-fun lt!344109 () Unit!15437)

(assert (=> b!217315 (= lt!344109 lt!344097)))

(assert (=> b!217315 (= (_1!9913 lt!344108) (withMovedBitIndex!0 (_2!9913 lt!344108) (bvsub (bitIndex!0 (size!4659 (buf!5200 (_2!9914 lt!342982))) (currentByte!9787 (_2!9914 lt!342982)) (currentBit!9782 (_2!9914 lt!342982))) (bitIndex!0 (size!4659 (buf!5200 (_2!9914 lt!344090))) (currentByte!9787 (_2!9914 lt!344090)) (currentBit!9782 (_2!9914 lt!344090))))))))

(declare-fun lt!344114 () Unit!15437)

(declare-fun Unit!15468 () Unit!15437)

(assert (=> b!217315 (= lt!344114 Unit!15468)))

(assert (=> b!217315 (= (_1!9913 lt!344113) (withMovedBitIndex!0 (_2!9913 lt!344113) (bvsub (bitIndex!0 (size!4659 (buf!5200 (_2!9914 lt!344067))) (currentByte!9787 (_2!9914 lt!344067)) (currentBit!9782 (_2!9914 lt!344067))) (bitIndex!0 (size!4659 (buf!5200 (_2!9914 lt!344090))) (currentByte!9787 (_2!9914 lt!344090)) (currentBit!9782 (_2!9914 lt!344090))))))))

(declare-fun lt!344093 () Unit!15437)

(declare-fun Unit!15469 () Unit!15437)

(assert (=> b!217315 (= lt!344093 Unit!15469)))

(assert (=> b!217315 (= (bitIndex!0 (size!4659 (buf!5200 (_2!9914 lt!342982))) (currentByte!9787 (_2!9914 lt!342982)) (currentBit!9782 (_2!9914 lt!342982))) (bvsub (bitIndex!0 (size!4659 (buf!5200 (_2!9914 lt!344067))) (currentByte!9787 (_2!9914 lt!344067)) (currentBit!9782 (_2!9914 lt!344067))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!344098 () Unit!15437)

(declare-fun Unit!15470 () Unit!15437)

(assert (=> b!217315 (= lt!344098 Unit!15470)))

(assert (=> b!217315 (= (_2!9916 lt!344105) (_2!9916 lt!344102))))

(declare-fun lt!344079 () Unit!15437)

(declare-fun Unit!15471 () Unit!15437)

(assert (=> b!217315 (= lt!344079 Unit!15471)))

(assert (=> b!217315 (invariant!0 (currentBit!9782 (_2!9914 lt!344090)) (currentByte!9787 (_2!9914 lt!344090)) (size!4659 (buf!5200 (_2!9914 lt!344090))))))

(declare-fun lt!344076 () Unit!15437)

(declare-fun Unit!15472 () Unit!15437)

(assert (=> b!217315 (= lt!344076 Unit!15472)))

(assert (=> b!217315 (= (size!4659 (buf!5200 (_2!9914 lt!342982))) (size!4659 (buf!5200 (_2!9914 lt!344090))))))

(declare-fun lt!344077 () Unit!15437)

(declare-fun Unit!15473 () Unit!15437)

(assert (=> b!217315 (= lt!344077 Unit!15473)))

(assert (=> b!217315 (= (bitIndex!0 (size!4659 (buf!5200 (_2!9914 lt!344090))) (currentByte!9787 (_2!9914 lt!344090)) (currentBit!9782 (_2!9914 lt!344090))) (bvsub (bvadd (bitIndex!0 (size!4659 (buf!5200 (_2!9914 lt!342982))) (currentByte!9787 (_2!9914 lt!342982)) (currentBit!9782 (_2!9914 lt!342982))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!344092 () Unit!15437)

(declare-fun Unit!15474 () Unit!15437)

(assert (=> b!217315 (= lt!344092 Unit!15474)))

(declare-fun lt!344104 () Unit!15437)

(declare-fun Unit!15475 () Unit!15437)

(assert (=> b!217315 (= lt!344104 Unit!15475)))

(declare-fun lt!344111 () tuple2!18510)

(assert (=> b!217315 (= lt!344111 (reader!0 (_2!9914 lt!342982) (_2!9914 lt!344090)))))

(declare-fun lt!344107 () (_ BitVec 64))

(assert (=> b!217315 (= lt!344107 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!344100 () Unit!15437)

(assert (=> b!217315 (= lt!344100 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9914 lt!342982) (buf!5200 (_2!9914 lt!344090)) lt!344107))))

(assert (=> b!217315 (validate_offset_bits!1 ((_ sign_extend 32) (size!4659 (buf!5200 (_2!9914 lt!344090)))) ((_ sign_extend 32) (currentByte!9787 (_2!9914 lt!342982))) ((_ sign_extend 32) (currentBit!9782 (_2!9914 lt!342982))) lt!344107)))

(declare-fun lt!344085 () Unit!15437)

(assert (=> b!217315 (= lt!344085 lt!344100)))

(declare-fun lt!344089 () tuple2!18516)

(assert (=> b!217315 (= lt!344089 (readNBitsLSBFirstsLoopPure!0 (_1!9913 lt!344111) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!182843 () Bool)

(assert (=> b!217315 (= res!182843 (= (_2!9916 lt!344089) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!147751 () Bool)

(assert (=> b!217315 (=> (not res!182843) (not e!147751))))

(assert (=> b!217315 e!147751))

(declare-fun lt!344066 () Unit!15437)

(declare-fun Unit!15476 () Unit!15437)

(assert (=> b!217315 (= lt!344066 Unit!15476)))

(declare-fun b!217316 () Bool)

(assert (=> b!217316 (= e!147755 (validate_offset_bits!1 ((_ sign_extend 32) (size!4659 (buf!5200 (_2!9914 lt!342982)))) ((_ sign_extend 32) (currentByte!9787 (_2!9914 lt!342982))) ((_ sign_extend 32) (currentBit!9782 (_2!9914 lt!342982))) lt!344072))))

(declare-fun b!217317 () Bool)

(declare-fun Unit!15477 () Unit!15437)

(assert (=> b!217317 (= e!147754 (tuple2!18513 Unit!15477 (_2!9914 lt!342982)))))

(declare-fun lt!344063 () Unit!15437)

(assert (=> b!217317 (= lt!344063 (lemmaIsPrefixRefl!0 (_2!9914 lt!342982)))))

(assert (=> b!217317 call!3402))

(declare-fun lt!344060 () Unit!15437)

(assert (=> b!217317 (= lt!344060 lt!344063)))

(declare-fun b!217318 () Bool)

(assert (=> b!217318 (= e!147752 (= (_2!9915 lt!344087) (_2!9915 lt!344084)))))

(declare-fun b!217319 () Bool)

(declare-fun e!147750 () Bool)

(declare-fun lt!344075 () tuple2!18514)

(assert (=> b!217319 (= e!147750 (= (bitIndex!0 (size!4659 (buf!5200 (_1!9915 lt!344075))) (currentByte!9787 (_1!9915 lt!344075)) (currentBit!9782 (_1!9915 lt!344075))) (bitIndex!0 (size!4659 (buf!5200 (_2!9914 lt!344068))) (currentByte!9787 (_2!9914 lt!344068)) (currentBit!9782 (_2!9914 lt!344068)))))))

(declare-fun b!217320 () Bool)

(declare-fun res!182842 () Bool)

(assert (=> b!217320 (=> (not res!182842) (not e!147748))))

(declare-fun lt!344106 () (_ BitVec 64))

(declare-fun lt!344115 () (_ BitVec 64))

(assert (=> b!217320 (= res!182842 (= (bitIndex!0 (size!4659 (buf!5200 (_2!9914 lt!344074))) (currentByte!9787 (_2!9914 lt!344074)) (currentBit!9782 (_2!9914 lt!344074))) (bvsub lt!344106 lt!344115)))))

(assert (=> b!217320 (or (= (bvand lt!344106 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!344115 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!344106 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!344106 lt!344115) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217320 (= lt!344115 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!344096 () (_ BitVec 64))

(declare-fun lt!344080 () (_ BitVec 64))

(assert (=> b!217320 (= lt!344106 (bvadd lt!344096 lt!344080))))

(assert (=> b!217320 (or (not (= (bvand lt!344096 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!344080 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!344096 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!344096 lt!344080) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!217320 (= lt!344080 ((_ sign_extend 32) nBits!348))))

(assert (=> b!217320 (= lt!344096 (bitIndex!0 (size!4659 (buf!5200 (_2!9914 lt!342982))) (currentByte!9787 (_2!9914 lt!342982)) (currentBit!9782 (_2!9914 lt!342982))))))

(declare-fun b!217321 () Bool)

(assert (=> b!217321 (= e!147751 (= (_1!9916 lt!344089) (_2!9913 lt!344111)))))

(declare-fun b!217322 () Bool)

(assert (=> b!217322 (= lt!344075 (readBitPure!0 (readerFrom!0 (_2!9914 lt!344068) (currentBit!9782 (_2!9914 lt!342982)) (currentByte!9787 (_2!9914 lt!342982)))))))

(declare-fun res!182845 () Bool)

(assert (=> b!217322 (= res!182845 (and (= (_2!9915 lt!344075) lt!344062) (= (_1!9915 lt!344075) (_2!9914 lt!344068))))))

(assert (=> b!217322 (=> (not res!182845) (not e!147750))))

(assert (=> b!217322 (= e!147749 e!147750)))

(assert (= (and d!73661 c!10628) b!217317))

(assert (= (and d!73661 (not c!10628)) b!217315))

(assert (= (and b!217315 res!182836) b!217311))

(assert (= (and b!217311 res!182839) b!217310))

(assert (= (and b!217310 res!182840) b!217322))

(assert (= (and b!217322 res!182845) b!217319))

(assert (= (and b!217315 res!182838) b!217318))

(assert (= (and b!217315 c!10627) b!217307))

(assert (= (and b!217315 (not c!10627)) b!217312))

(assert (= (and b!217315 res!182843) b!217321))

(assert (= (or b!217317 b!217315) bm!3399))

(assert (= (and d!73661 res!182841) b!217314))

(assert (= (and b!217314 res!182844) b!217320))

(assert (= (and b!217320 res!182842) b!217308))

(assert (= (and b!217308 res!182835) b!217309))

(assert (= (and b!217309 res!182834) b!217316))

(assert (= (and b!217309 res!182837) b!217313))

(declare-fun m!335321 () Bool)

(assert (=> b!217319 m!335321))

(declare-fun m!335323 () Bool)

(assert (=> b!217319 m!335323))

(declare-fun m!335325 () Bool)

(assert (=> b!217315 m!335325))

(declare-fun m!335327 () Bool)

(assert (=> b!217315 m!335327))

(declare-fun m!335329 () Bool)

(assert (=> b!217315 m!335329))

(declare-fun m!335331 () Bool)

(assert (=> b!217315 m!335331))

(declare-fun m!335333 () Bool)

(assert (=> b!217315 m!335333))

(declare-fun m!335335 () Bool)

(assert (=> b!217315 m!335335))

(declare-fun m!335337 () Bool)

(assert (=> b!217315 m!335337))

(declare-fun m!335339 () Bool)

(assert (=> b!217315 m!335339))

(declare-fun m!335341 () Bool)

(assert (=> b!217315 m!335341))

(declare-fun m!335343 () Bool)

(assert (=> b!217315 m!335343))

(declare-fun m!335345 () Bool)

(assert (=> b!217315 m!335345))

(declare-fun m!335347 () Bool)

(assert (=> b!217315 m!335347))

(assert (=> b!217315 m!335347))

(declare-fun m!335349 () Bool)

(assert (=> b!217315 m!335349))

(declare-fun m!335351 () Bool)

(assert (=> b!217315 m!335351))

(declare-fun m!335353 () Bool)

(assert (=> b!217315 m!335353))

(declare-fun m!335355 () Bool)

(assert (=> b!217315 m!335355))

(declare-fun m!335357 () Bool)

(assert (=> b!217315 m!335357))

(declare-fun m!335359 () Bool)

(assert (=> b!217315 m!335359))

(declare-fun m!335361 () Bool)

(assert (=> b!217315 m!335361))

(assert (=> b!217315 m!334645))

(declare-fun m!335363 () Bool)

(assert (=> b!217315 m!335363))

(declare-fun m!335365 () Bool)

(assert (=> b!217315 m!335365))

(declare-fun m!335367 () Bool)

(assert (=> b!217315 m!335367))

(declare-fun m!335369 () Bool)

(assert (=> b!217315 m!335369))

(declare-fun m!335371 () Bool)

(assert (=> b!217315 m!335371))

(declare-fun m!335373 () Bool)

(assert (=> b!217315 m!335373))

(declare-fun m!335375 () Bool)

(assert (=> b!217315 m!335375))

(declare-fun m!335377 () Bool)

(assert (=> b!217315 m!335377))

(declare-fun m!335379 () Bool)

(assert (=> b!217315 m!335379))

(declare-fun m!335381 () Bool)

(assert (=> b!217315 m!335381))

(declare-fun m!335383 () Bool)

(assert (=> b!217315 m!335383))

(declare-fun m!335385 () Bool)

(assert (=> b!217315 m!335385))

(assert (=> b!217315 m!334599))

(declare-fun m!335387 () Bool)

(assert (=> b!217316 m!335387))

(declare-fun m!335389 () Bool)

(assert (=> bm!3399 m!335389))

(assert (=> b!217309 m!335361))

(assert (=> b!217309 m!334645))

(declare-fun m!335391 () Bool)

(assert (=> b!217309 m!335391))

(declare-fun m!335393 () Bool)

(assert (=> b!217309 m!335393))

(declare-fun m!335395 () Bool)

(assert (=> b!217309 m!335395))

(declare-fun m!335397 () Bool)

(assert (=> b!217309 m!335397))

(assert (=> b!217311 m!335323))

(assert (=> b!217311 m!334599))

(declare-fun m!335399 () Bool)

(assert (=> b!217310 m!335399))

(declare-fun m!335401 () Bool)

(assert (=> d!73661 m!335401))

(declare-fun m!335403 () Bool)

(assert (=> b!217308 m!335403))

(assert (=> b!217317 m!334879))

(declare-fun m!335405 () Bool)

(assert (=> b!217320 m!335405))

(assert (=> b!217320 m!334599))

(declare-fun m!335407 () Bool)

(assert (=> b!217322 m!335407))

(assert (=> b!217322 m!335407))

(declare-fun m!335409 () Bool)

(assert (=> b!217322 m!335409))

(assert (=> b!216935 d!73661))

(declare-fun d!73737 () Bool)

(declare-fun e!147757 () Bool)

(assert (=> d!73737 e!147757))

(declare-fun res!182846 () Bool)

(assert (=> d!73737 (=> (not res!182846) (not e!147757))))

(declare-fun lt!344116 () BitStream!8426)

(declare-fun lt!344117 () (_ BitVec 64))

(assert (=> d!73737 (= res!182846 (= (bvadd lt!344117 (bvsub lt!342974 lt!342970)) (bitIndex!0 (size!4659 (buf!5200 lt!344116)) (currentByte!9787 lt!344116) (currentBit!9782 lt!344116))))))

(assert (=> d!73737 (or (not (= (bvand lt!344117 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342974 lt!342970) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!344117 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!344117 (bvsub lt!342974 lt!342970)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73737 (= lt!344117 (bitIndex!0 (size!4659 (buf!5200 (_2!9913 lt!342972))) (currentByte!9787 (_2!9913 lt!342972)) (currentBit!9782 (_2!9913 lt!342972))))))

(assert (=> d!73737 (= lt!344116 (_2!9914 (moveBitIndex!0 (_2!9913 lt!342972) (bvsub lt!342974 lt!342970))))))

(assert (=> d!73737 (moveBitIndexPrecond!0 (_2!9913 lt!342972) (bvsub lt!342974 lt!342970))))

(assert (=> d!73737 (= (withMovedBitIndex!0 (_2!9913 lt!342972) (bvsub lt!342974 lt!342970)) lt!344116)))

(declare-fun b!217323 () Bool)

(assert (=> b!217323 (= e!147757 (= (size!4659 (buf!5200 (_2!9913 lt!342972))) (size!4659 (buf!5200 lt!344116))))))

(assert (= (and d!73737 res!182846) b!217323))

(declare-fun m!335411 () Bool)

(assert (=> d!73737 m!335411))

(declare-fun m!335413 () Bool)

(assert (=> d!73737 m!335413))

(declare-fun m!335415 () Bool)

(assert (=> d!73737 m!335415))

(declare-fun m!335417 () Bool)

(assert (=> d!73737 m!335417))

(assert (=> b!216923 d!73737))

(declare-fun d!73739 () Bool)

(assert (=> d!73739 (= (invariant!0 (currentBit!9782 thiss!1204) (currentByte!9787 thiss!1204) (size!4659 (buf!5200 (_2!9914 lt!342968)))) (and (bvsge (currentBit!9782 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9782 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9787 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9787 thiss!1204) (size!4659 (buf!5200 (_2!9914 lt!342968)))) (and (= (currentBit!9782 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9787 thiss!1204) (size!4659 (buf!5200 (_2!9914 lt!342968))))))))))

(assert (=> b!216944 d!73739))

(declare-fun d!73741 () Bool)

(assert (=> d!73741 (= (invariant!0 (currentBit!9782 thiss!1204) (currentByte!9787 thiss!1204) (size!4659 (buf!5200 thiss!1204))) (and (bvsge (currentBit!9782 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9782 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9787 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9787 thiss!1204) (size!4659 (buf!5200 thiss!1204))) (and (= (currentBit!9782 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9787 thiss!1204) (size!4659 (buf!5200 thiss!1204)))))))))

(assert (=> b!216934 d!73741))

(declare-fun d!73743 () Bool)

(assert (=> d!73743 (= (onesLSBLong!0 nBits!348) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!348))))))

(assert (=> b!216927 d!73743))

(declare-fun d!73745 () Bool)

(declare-fun res!182849 () Bool)

(declare-fun e!147758 () Bool)

(assert (=> d!73745 (=> (not res!182849) (not e!147758))))

(assert (=> d!73745 (= res!182849 (= (size!4659 (buf!5200 (_2!9914 lt!342982))) (size!4659 (buf!5200 (_2!9914 lt!342968)))))))

(assert (=> d!73745 (= (isPrefixOf!0 (_2!9914 lt!342982) (_2!9914 lt!342968)) e!147758)))

(declare-fun b!217324 () Bool)

(declare-fun res!182847 () Bool)

(assert (=> b!217324 (=> (not res!182847) (not e!147758))))

(assert (=> b!217324 (= res!182847 (bvsle (bitIndex!0 (size!4659 (buf!5200 (_2!9914 lt!342982))) (currentByte!9787 (_2!9914 lt!342982)) (currentBit!9782 (_2!9914 lt!342982))) (bitIndex!0 (size!4659 (buf!5200 (_2!9914 lt!342968))) (currentByte!9787 (_2!9914 lt!342968)) (currentBit!9782 (_2!9914 lt!342968)))))))

(declare-fun b!217325 () Bool)

(declare-fun e!147759 () Bool)

(assert (=> b!217325 (= e!147758 e!147759)))

(declare-fun res!182848 () Bool)

(assert (=> b!217325 (=> res!182848 e!147759)))

(assert (=> b!217325 (= res!182848 (= (size!4659 (buf!5200 (_2!9914 lt!342982))) #b00000000000000000000000000000000))))

(declare-fun b!217326 () Bool)

(assert (=> b!217326 (= e!147759 (arrayBitRangesEq!0 (buf!5200 (_2!9914 lt!342982)) (buf!5200 (_2!9914 lt!342968)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4659 (buf!5200 (_2!9914 lt!342982))) (currentByte!9787 (_2!9914 lt!342982)) (currentBit!9782 (_2!9914 lt!342982)))))))

(assert (= (and d!73745 res!182849) b!217324))

(assert (= (and b!217324 res!182847) b!217325))

(assert (= (and b!217325 (not res!182848)) b!217326))

(assert (=> b!217324 m!334599))

(assert (=> b!217324 m!334581))

(assert (=> b!217326 m!334599))

(assert (=> b!217326 m!334599))

(declare-fun m!335419 () Bool)

(assert (=> b!217326 m!335419))

(assert (=> b!216938 d!73745))

(declare-fun d!73747 () Bool)

(assert (=> d!73747 (= (array_inv!4400 (buf!5200 thiss!1204)) (bvsge (size!4659 (buf!5200 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!216926 d!73747))

(push 1)

(assert (not d!73593))

(assert (not b!217108))

(assert (not b!217074))

(assert (not d!73621))

(assert (not b!217072))

(assert (not d!73625))

(assert (not d!73601))

(assert (not b!217114))

(assert (not b!217311))

(assert (not b!217316))

(assert (not b!217067))

(assert (not d!73737))

(assert (not d!73613))

(assert (not d!73631))

(assert (not d!73641))

(assert (not d!73655))

(assert (not d!73649))

(assert (not d!73605))

(assert (not b!217319))

(assert (not b!217324))

(assert (not d!73591))

(assert (not d!73619))

(assert (not b!217317))

(assert (not d!73635))

(assert (not b!217309))

(assert (not d!73651))

(assert (not b!217320))

(assert (not b!217034))

(assert (not d!73633))

(assert (not d!73643))

(assert (not b!217066))

(assert (not d!73629))

(assert (not b!217070))

(assert (not d!73579))

(assert (not b!217326))

(assert (not bm!3399))

(assert (not d!73609))

(assert (not d!73615))

(assert (not d!73607))

(assert (not b!217315))

(assert (not b!217308))

(assert (not d!73661))

(assert (not b!217090))

(assert (not b!217116))

(assert (not d!73603))

(assert (not b!217075))

(assert (not d!73623))

(assert (not d!73583))

(assert (not b!217092))

(assert (not b!217069))

(assert (not d!73639))

(assert (not d!73627))

(assert (not b!217107))

(assert (not b!217310))

(assert (not d!73659))

(assert (not d!73577))

(assert (not d!73645))

(assert (not b!217105))

(assert (not b!217106))

(assert (not b!217071))

(assert (not d!73647))

(assert (not b!217322))

(check-sat)

(pop 1)

(push 1)

(check-sat)

