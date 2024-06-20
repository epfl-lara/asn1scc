; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52472 () Bool)

(assert start!52472)

(declare-fun b!241927 () Bool)

(declare-fun e!167717 () Bool)

(declare-datatypes ((array!13283 0))(
  ( (array!13284 (arr!6808 (Array (_ BitVec 32) (_ BitVec 8))) (size!5821 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10564 0))(
  ( (BitStream!10565 (buf!6287 array!13283) (currentByte!11650 (_ BitVec 32)) (currentBit!11645 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20676 0))(
  ( (tuple2!20677 (_1!11260 BitStream!10564) (_2!11260 Bool)) )
))
(declare-fun lt!377365 () tuple2!20676)

(declare-fun lt!377360 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241927 (= e!167717 (= (bitIndex!0 (size!5821 (buf!6287 (_1!11260 lt!377365))) (currentByte!11650 (_1!11260 lt!377365)) (currentBit!11645 (_1!11260 lt!377365))) lt!377360))))

(declare-fun b!241928 () Bool)

(declare-fun res!201988 () Bool)

(declare-fun e!167718 () Bool)

(assert (=> b!241928 (=> (not res!201988) (not e!167718))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!241928 (= res!201988 (bvslt from!289 nBits!297))))

(declare-fun b!241929 () Bool)

(declare-fun e!167715 () Bool)

(declare-fun thiss!1005 () BitStream!10564)

(declare-datatypes ((Unit!17725 0))(
  ( (Unit!17726) )
))
(declare-datatypes ((tuple2!20678 0))(
  ( (tuple2!20679 (_1!11261 Unit!17725) (_2!11261 BitStream!10564)) )
))
(declare-fun lt!377364 () tuple2!20678)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!241929 (= e!167715 (invariant!0 (currentBit!11645 thiss!1005) (currentByte!11650 thiss!1005) (size!5821 (buf!6287 (_2!11261 lt!377364)))))))

(declare-fun b!241930 () Bool)

(declare-fun e!167713 () Bool)

(declare-fun lt!377359 () tuple2!20676)

(declare-datatypes ((tuple2!20680 0))(
  ( (tuple2!20681 (_1!11262 BitStream!10564) (_2!11262 BitStream!10564)) )
))
(declare-fun lt!377370 () tuple2!20680)

(assert (=> b!241930 (= e!167713 (not (or (not (_2!11260 lt!377359)) (not (= (_1!11260 lt!377359) (_2!11262 lt!377370))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10564 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20676)

(assert (=> b!241930 (= lt!377359 (checkBitsLoopPure!0 (_1!11262 lt!377370) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!377368 () tuple2!20678)

(declare-fun lt!377358 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241930 (validate_offset_bits!1 ((_ sign_extend 32) (size!5821 (buf!6287 (_2!11261 lt!377368)))) ((_ sign_extend 32) (currentByte!11650 (_2!11261 lt!377364))) ((_ sign_extend 32) (currentBit!11645 (_2!11261 lt!377364))) lt!377358)))

(declare-fun lt!377363 () Unit!17725)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10564 array!13283 (_ BitVec 64)) Unit!17725)

(assert (=> b!241930 (= lt!377363 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11261 lt!377364) (buf!6287 (_2!11261 lt!377368)) lt!377358))))

(declare-fun reader!0 (BitStream!10564 BitStream!10564) tuple2!20680)

(assert (=> b!241930 (= lt!377370 (reader!0 (_2!11261 lt!377364) (_2!11261 lt!377368)))))

(declare-fun b!241931 () Bool)

(declare-fun e!167720 () Bool)

(declare-fun array_inv!5562 (array!13283) Bool)

(assert (=> b!241931 (= e!167720 (array_inv!5562 (buf!6287 thiss!1005)))))

(declare-fun b!241933 () Bool)

(declare-fun e!167712 () Bool)

(assert (=> b!241933 (= e!167712 e!167717)))

(declare-fun res!201990 () Bool)

(assert (=> b!241933 (=> (not res!201990) (not e!167717))))

(assert (=> b!241933 (= res!201990 (and (= (_2!11260 lt!377365) bit!26) (= (_1!11260 lt!377365) (_2!11261 lt!377364))))))

(declare-fun readBitPure!0 (BitStream!10564) tuple2!20676)

(declare-fun readerFrom!0 (BitStream!10564 (_ BitVec 32) (_ BitVec 32)) BitStream!10564)

(assert (=> b!241933 (= lt!377365 (readBitPure!0 (readerFrom!0 (_2!11261 lt!377364) (currentBit!11645 thiss!1005) (currentByte!11650 thiss!1005))))))

(declare-fun b!241934 () Bool)

(declare-fun e!167714 () Bool)

(assert (=> b!241934 (= e!167714 e!167713)))

(declare-fun res!201991 () Bool)

(assert (=> b!241934 (=> (not res!201991) (not e!167713))))

(assert (=> b!241934 (= res!201991 (= (bitIndex!0 (size!5821 (buf!6287 (_2!11261 lt!377368))) (currentByte!11650 (_2!11261 lt!377368)) (currentBit!11645 (_2!11261 lt!377368))) (bvadd (bitIndex!0 (size!5821 (buf!6287 (_2!11261 lt!377364))) (currentByte!11650 (_2!11261 lt!377364)) (currentBit!11645 (_2!11261 lt!377364))) lt!377358)))))

(assert (=> b!241934 (= lt!377358 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!241935 () Bool)

(declare-fun e!167711 () Bool)

(assert (=> b!241935 (= e!167711 true)))

(declare-fun lt!377369 () tuple2!20676)

(assert (=> b!241935 (= lt!377369 (readBitPure!0 (BitStream!10565 (buf!6287 (_2!11261 lt!377368)) (currentByte!11650 thiss!1005) (currentBit!11645 thiss!1005))))))

(declare-fun lt!377362 () tuple2!20676)

(assert (=> b!241935 (= lt!377362 (readBitPure!0 (BitStream!10565 (buf!6287 (_2!11261 lt!377364)) (currentByte!11650 thiss!1005) (currentBit!11645 thiss!1005))))))

(assert (=> b!241935 (invariant!0 (currentBit!11645 thiss!1005) (currentByte!11650 thiss!1005) (size!5821 (buf!6287 (_2!11261 lt!377368))))))

(declare-fun b!241936 () Bool)

(assert (=> b!241936 (= e!167718 (not e!167711))))

(declare-fun res!201994 () Bool)

(assert (=> b!241936 (=> res!201994 e!167711)))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241936 (= res!201994 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!5821 (buf!6287 (_2!11261 lt!377364)))) ((_ sign_extend 32) (currentByte!11650 thiss!1005)) ((_ sign_extend 32) (currentBit!11645 thiss!1005)))))))

(assert (=> b!241936 e!167715))

(declare-fun res!201996 () Bool)

(assert (=> b!241936 (=> (not res!201996) (not e!167715))))

(declare-fun isPrefixOf!0 (BitStream!10564 BitStream!10564) Bool)

(assert (=> b!241936 (= res!201996 (isPrefixOf!0 thiss!1005 (_2!11261 lt!377368)))))

(declare-fun lt!377366 () Unit!17725)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10564 BitStream!10564 BitStream!10564) Unit!17725)

(assert (=> b!241936 (= lt!377366 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11261 lt!377364) (_2!11261 lt!377368)))))

(assert (=> b!241936 e!167714))

(declare-fun res!201995 () Bool)

(assert (=> b!241936 (=> (not res!201995) (not e!167714))))

(assert (=> b!241936 (= res!201995 (= (size!5821 (buf!6287 (_2!11261 lt!377364))) (size!5821 (buf!6287 (_2!11261 lt!377368)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10564 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20678)

(assert (=> b!241936 (= lt!377368 (appendNBitsLoop!0 (_2!11261 lt!377364) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!241936 (validate_offset_bits!1 ((_ sign_extend 32) (size!5821 (buf!6287 (_2!11261 lt!377364)))) ((_ sign_extend 32) (currentByte!11650 (_2!11261 lt!377364))) ((_ sign_extend 32) (currentBit!11645 (_2!11261 lt!377364))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!377361 () Unit!17725)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10564 BitStream!10564 (_ BitVec 64) (_ BitVec 64)) Unit!17725)

(assert (=> b!241936 (= lt!377361 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11261 lt!377364) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!167716 () Bool)

(assert (=> b!241936 e!167716))

(declare-fun res!201993 () Bool)

(assert (=> b!241936 (=> (not res!201993) (not e!167716))))

(assert (=> b!241936 (= res!201993 (= (size!5821 (buf!6287 thiss!1005)) (size!5821 (buf!6287 (_2!11261 lt!377364)))))))

(declare-fun appendBit!0 (BitStream!10564 Bool) tuple2!20678)

(assert (=> b!241936 (= lt!377364 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!241932 () Bool)

(declare-fun res!201986 () Bool)

(assert (=> b!241932 (=> (not res!201986) (not e!167718))))

(assert (=> b!241932 (= res!201986 (validate_offset_bits!1 ((_ sign_extend 32) (size!5821 (buf!6287 thiss!1005))) ((_ sign_extend 32) (currentByte!11650 thiss!1005)) ((_ sign_extend 32) (currentBit!11645 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun res!201985 () Bool)

(assert (=> start!52472 (=> (not res!201985) (not e!167718))))

(assert (=> start!52472 (= res!201985 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52472 e!167718))

(assert (=> start!52472 true))

(declare-fun inv!12 (BitStream!10564) Bool)

(assert (=> start!52472 (and (inv!12 thiss!1005) e!167720)))

(declare-fun b!241937 () Bool)

(assert (=> b!241937 (= e!167716 e!167712)))

(declare-fun res!201989 () Bool)

(assert (=> b!241937 (=> (not res!201989) (not e!167712))))

(declare-fun lt!377367 () (_ BitVec 64))

(assert (=> b!241937 (= res!201989 (= lt!377360 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!377367)))))

(assert (=> b!241937 (= lt!377360 (bitIndex!0 (size!5821 (buf!6287 (_2!11261 lt!377364))) (currentByte!11650 (_2!11261 lt!377364)) (currentBit!11645 (_2!11261 lt!377364))))))

(assert (=> b!241937 (= lt!377367 (bitIndex!0 (size!5821 (buf!6287 thiss!1005)) (currentByte!11650 thiss!1005) (currentBit!11645 thiss!1005)))))

(declare-fun b!241938 () Bool)

(declare-fun res!201984 () Bool)

(assert (=> b!241938 (=> (not res!201984) (not e!167713))))

(assert (=> b!241938 (= res!201984 (isPrefixOf!0 (_2!11261 lt!377364) (_2!11261 lt!377368)))))

(declare-fun b!241939 () Bool)

(declare-fun res!201987 () Bool)

(assert (=> b!241939 (=> res!201987 e!167711)))

(declare-fun arrayBitRangesEq!0 (array!13283 array!13283 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241939 (= res!201987 (not (arrayBitRangesEq!0 (buf!6287 (_2!11261 lt!377364)) (buf!6287 (_2!11261 lt!377368)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!5821 (buf!6287 (_2!11261 lt!377364))) (currentByte!11650 thiss!1005) (currentBit!11645 thiss!1005))))))))

(declare-fun b!241940 () Bool)

(declare-fun res!201992 () Bool)

(assert (=> b!241940 (=> (not res!201992) (not e!167712))))

(assert (=> b!241940 (= res!201992 (isPrefixOf!0 thiss!1005 (_2!11261 lt!377364)))))

(assert (= (and start!52472 res!201985) b!241932))

(assert (= (and b!241932 res!201986) b!241928))

(assert (= (and b!241928 res!201988) b!241936))

(assert (= (and b!241936 res!201993) b!241937))

(assert (= (and b!241937 res!201989) b!241940))

(assert (= (and b!241940 res!201992) b!241933))

(assert (= (and b!241933 res!201990) b!241927))

(assert (= (and b!241936 res!201995) b!241934))

(assert (= (and b!241934 res!201991) b!241938))

(assert (= (and b!241938 res!201984) b!241930))

(assert (= (and b!241936 res!201996) b!241929))

(assert (= (and b!241936 (not res!201994)) b!241939))

(assert (= (and b!241939 (not res!201987)) b!241935))

(assert (= start!52472 b!241931))

(declare-fun m!364595 () Bool)

(assert (=> b!241936 m!364595))

(declare-fun m!364597 () Bool)

(assert (=> b!241936 m!364597))

(declare-fun m!364599 () Bool)

(assert (=> b!241936 m!364599))

(declare-fun m!364601 () Bool)

(assert (=> b!241936 m!364601))

(declare-fun m!364603 () Bool)

(assert (=> b!241936 m!364603))

(declare-fun m!364605 () Bool)

(assert (=> b!241936 m!364605))

(declare-fun m!364607 () Bool)

(assert (=> b!241936 m!364607))

(declare-fun m!364609 () Bool)

(assert (=> b!241935 m!364609))

(declare-fun m!364611 () Bool)

(assert (=> b!241935 m!364611))

(declare-fun m!364613 () Bool)

(assert (=> b!241935 m!364613))

(declare-fun m!364615 () Bool)

(assert (=> start!52472 m!364615))

(declare-fun m!364617 () Bool)

(assert (=> b!241937 m!364617))

(declare-fun m!364619 () Bool)

(assert (=> b!241937 m!364619))

(declare-fun m!364621 () Bool)

(assert (=> b!241930 m!364621))

(declare-fun m!364623 () Bool)

(assert (=> b!241930 m!364623))

(declare-fun m!364625 () Bool)

(assert (=> b!241930 m!364625))

(declare-fun m!364627 () Bool)

(assert (=> b!241930 m!364627))

(declare-fun m!364629 () Bool)

(assert (=> b!241932 m!364629))

(declare-fun m!364631 () Bool)

(assert (=> b!241933 m!364631))

(assert (=> b!241933 m!364631))

(declare-fun m!364633 () Bool)

(assert (=> b!241933 m!364633))

(declare-fun m!364635 () Bool)

(assert (=> b!241938 m!364635))

(declare-fun m!364637 () Bool)

(assert (=> b!241934 m!364637))

(assert (=> b!241934 m!364617))

(declare-fun m!364639 () Bool)

(assert (=> b!241929 m!364639))

(declare-fun m!364641 () Bool)

(assert (=> b!241939 m!364641))

(declare-fun m!364643 () Bool)

(assert (=> b!241939 m!364643))

(declare-fun m!364645 () Bool)

(assert (=> b!241931 m!364645))

(declare-fun m!364647 () Bool)

(assert (=> b!241927 m!364647))

(declare-fun m!364649 () Bool)

(assert (=> b!241940 m!364649))

(push 1)

(assert (not start!52472))

(assert (not b!241936))

(assert (not b!241927))

(assert (not b!241934))

(assert (not b!241938))

(assert (not b!241930))

(assert (not b!241932))

(assert (not b!241931))

(assert (not b!241929))

(assert (not b!241939))

(assert (not b!241940))

(assert (not b!241935))

(assert (not b!241933))

(assert (not b!241937))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

