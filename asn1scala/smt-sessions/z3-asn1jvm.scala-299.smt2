; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5968 () Bool)

(assert start!5968)

(declare-fun b!26928 () Bool)

(declare-fun e!18238 () Bool)

(declare-fun e!18235 () Bool)

(assert (=> b!26928 (= e!18238 e!18235)))

(declare-fun res!23264 () Bool)

(assert (=> b!26928 (=> res!23264 e!18235)))

(declare-datatypes ((array!1705 0))(
  ( (array!1706 (arr!1197 (Array (_ BitVec 32) (_ BitVec 8))) (size!735 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1302 0))(
  ( (BitStream!1303 (buf!1062 array!1705) (currentByte!2387 (_ BitVec 32)) (currentBit!2382 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1302)

(declare-datatypes ((Unit!2173 0))(
  ( (Unit!2174) )
))
(declare-datatypes ((tuple2!2970 0))(
  ( (tuple2!2971 (_1!1572 Unit!2173) (_2!1572 BitStream!1302)) )
))
(declare-fun lt!38541 () tuple2!2970)

(declare-fun isPrefixOf!0 (BitStream!1302 BitStream!1302) Bool)

(assert (=> b!26928 (= res!23264 (not (isPrefixOf!0 thiss!1379 (_2!1572 lt!38541))))))

(declare-fun lt!38526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!26928 (validate_offset_bits!1 ((_ sign_extend 32) (size!735 (buf!1062 (_2!1572 lt!38541)))) ((_ sign_extend 32) (currentByte!2387 (_2!1572 lt!38541))) ((_ sign_extend 32) (currentBit!2382 (_2!1572 lt!38541))) lt!38526)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!26928 (= lt!38526 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38534 () Unit!2173)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1302 BitStream!1302 (_ BitVec 64) (_ BitVec 64)) Unit!2173)

(assert (=> b!26928 (= lt!38534 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1572 lt!38541) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1705)

(declare-fun appendBitFromByte!0 (BitStream!1302 (_ BitVec 8) (_ BitVec 32)) tuple2!2970)

(assert (=> b!26928 (= lt!38541 (appendBitFromByte!0 thiss!1379 (select (arr!1197 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!26930 () Bool)

(declare-fun res!23263 () Bool)

(declare-fun e!18240 () Bool)

(assert (=> b!26930 (=> res!23263 e!18240)))

(declare-datatypes ((List!352 0))(
  ( (Nil!349) (Cons!348 (h!467 Bool) (t!1102 List!352)) )
))
(declare-fun lt!38531 () List!352)

(declare-fun length!78 (List!352) Int)

(assert (=> b!26930 (= res!23263 (<= (length!78 lt!38531) 0))))

(declare-fun b!26931 () Bool)

(declare-fun e!18242 () Bool)

(declare-fun e!18237 () Bool)

(assert (=> b!26931 (= e!18242 e!18237)))

(declare-fun res!23258 () Bool)

(assert (=> b!26931 (=> res!23258 e!18237)))

(declare-fun lt!38535 () tuple2!2970)

(assert (=> b!26931 (= res!23258 (not (= (size!735 (buf!1062 (_2!1572 lt!38541))) (size!735 (buf!1062 (_2!1572 lt!38535))))))))

(declare-fun e!18239 () Bool)

(assert (=> b!26931 e!18239))

(declare-fun res!23251 () Bool)

(assert (=> b!26931 (=> (not res!23251) (not e!18239))))

(assert (=> b!26931 (= res!23251 (= (size!735 (buf!1062 (_2!1572 lt!38535))) (size!735 (buf!1062 thiss!1379))))))

(declare-fun b!26932 () Bool)

(declare-fun res!23257 () Bool)

(assert (=> b!26932 (=> res!23257 e!18242)))

(assert (=> b!26932 (= res!23257 (not (= (size!735 (buf!1062 thiss!1379)) (size!735 (buf!1062 (_2!1572 lt!38535))))))))

(declare-fun b!26933 () Bool)

(declare-fun res!23266 () Bool)

(declare-fun e!18244 () Bool)

(assert (=> b!26933 (=> (not res!23266) (not e!18244))))

(assert (=> b!26933 (= res!23266 (validate_offset_bits!1 ((_ sign_extend 32) (size!735 (buf!1062 thiss!1379))) ((_ sign_extend 32) (currentByte!2387 thiss!1379)) ((_ sign_extend 32) (currentBit!2382 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!26934 () Bool)

(declare-fun e!18243 () Bool)

(assert (=> b!26934 (= e!18243 e!18242)))

(declare-fun res!23260 () Bool)

(assert (=> b!26934 (=> res!23260 e!18242)))

(declare-fun lt!38528 () (_ BitVec 64))

(declare-fun lt!38538 () (_ BitVec 64))

(assert (=> b!26934 (= res!23260 (not (= lt!38538 (bvsub (bvadd lt!38528 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!26934 (= lt!38538 (bitIndex!0 (size!735 (buf!1062 (_2!1572 lt!38535))) (currentByte!2387 (_2!1572 lt!38535)) (currentBit!2382 (_2!1572 lt!38535))))))

(declare-fun b!26935 () Bool)

(declare-fun res!23256 () Bool)

(assert (=> b!26935 (=> res!23256 e!18242)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!26935 (= res!23256 (not (invariant!0 (currentBit!2382 (_2!1572 lt!38535)) (currentByte!2387 (_2!1572 lt!38535)) (size!735 (buf!1062 (_2!1572 lt!38535))))))))

(declare-fun b!26936 () Bool)

(assert (=> b!26936 (= e!18237 e!18240)))

(declare-fun res!23265 () Bool)

(assert (=> b!26936 (=> res!23265 e!18240)))

(assert (=> b!26936 (= res!23265 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!2972 0))(
  ( (tuple2!2973 (_1!1573 BitStream!1302) (_2!1573 BitStream!1302)) )
))
(declare-fun lt!38530 () tuple2!2972)

(declare-fun lt!38542 () List!352)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1302 BitStream!1302 (_ BitVec 64)) List!352)

(assert (=> b!26936 (= lt!38542 (bitStreamReadBitsIntoList!0 (_2!1572 lt!38535) (_1!1573 lt!38530) lt!38526))))

(declare-fun lt!38525 () tuple2!2972)

(assert (=> b!26936 (= lt!38531 (bitStreamReadBitsIntoList!0 (_2!1572 lt!38535) (_1!1573 lt!38525) (bvsub to!314 i!635)))))

(assert (=> b!26936 (validate_offset_bits!1 ((_ sign_extend 32) (size!735 (buf!1062 (_2!1572 lt!38535)))) ((_ sign_extend 32) (currentByte!2387 (_2!1572 lt!38541))) ((_ sign_extend 32) (currentBit!2382 (_2!1572 lt!38541))) lt!38526)))

(declare-fun lt!38527 () Unit!2173)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1302 array!1705 (_ BitVec 64)) Unit!2173)

(assert (=> b!26936 (= lt!38527 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1572 lt!38541) (buf!1062 (_2!1572 lt!38535)) lt!38526))))

(declare-fun reader!0 (BitStream!1302 BitStream!1302) tuple2!2972)

(assert (=> b!26936 (= lt!38530 (reader!0 (_2!1572 lt!38541) (_2!1572 lt!38535)))))

(assert (=> b!26936 (validate_offset_bits!1 ((_ sign_extend 32) (size!735 (buf!1062 (_2!1572 lt!38535)))) ((_ sign_extend 32) (currentByte!2387 thiss!1379)) ((_ sign_extend 32) (currentBit!2382 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!38539 () Unit!2173)

(assert (=> b!26936 (= lt!38539 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1062 (_2!1572 lt!38535)) (bvsub to!314 i!635)))))

(assert (=> b!26936 (= lt!38525 (reader!0 thiss!1379 (_2!1572 lt!38535)))))

(declare-fun lt!38532 () tuple2!2972)

(declare-fun b!26937 () Bool)

(declare-fun e!18233 () Bool)

(declare-fun head!189 (List!352) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1302 array!1705 (_ BitVec 64) (_ BitVec 64)) List!352)

(assert (=> b!26937 (= e!18233 (= (head!189 (byteArrayBitContentToList!0 (_2!1572 lt!38541) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!189 (bitStreamReadBitsIntoList!0 (_2!1572 lt!38541) (_1!1573 lt!38532) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!26938 () Bool)

(declare-fun res!23254 () Bool)

(assert (=> b!26938 (=> res!23254 e!18240)))

(assert (=> b!26938 (= res!23254 (not (isPrefixOf!0 (_1!1573 lt!38530) (_2!1572 lt!38535))))))

(declare-fun b!26939 () Bool)

(declare-fun res!23268 () Bool)

(assert (=> b!26939 (=> res!23268 e!18237)))

(assert (=> b!26939 (= res!23268 (not (invariant!0 (currentBit!2382 (_2!1572 lt!38541)) (currentByte!2387 (_2!1572 lt!38541)) (size!735 (buf!1062 (_2!1572 lt!38535))))))))

(declare-fun b!26940 () Bool)

(declare-fun res!23261 () Bool)

(assert (=> b!26940 (=> res!23261 e!18240)))

(assert (=> b!26940 (= res!23261 (or (not (= (buf!1062 (_1!1573 lt!38525)) (buf!1062 (_1!1573 lt!38530)))) (not (= (buf!1062 (_1!1573 lt!38525)) (buf!1062 (_2!1572 lt!38535)))) (bvsge lt!38538 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!26941 () Bool)

(assert (=> b!26941 (= e!18235 e!18243)))

(declare-fun res!23250 () Bool)

(assert (=> b!26941 (=> res!23250 e!18243)))

(assert (=> b!26941 (= res!23250 (not (isPrefixOf!0 (_2!1572 lt!38541) (_2!1572 lt!38535))))))

(assert (=> b!26941 (isPrefixOf!0 thiss!1379 (_2!1572 lt!38535))))

(declare-fun lt!38536 () Unit!2173)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1302 BitStream!1302 BitStream!1302) Unit!2173)

(assert (=> b!26941 (= lt!38536 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1572 lt!38541) (_2!1572 lt!38535)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1302 array!1705 (_ BitVec 64) (_ BitVec 64)) tuple2!2970)

(assert (=> b!26941 (= lt!38535 (appendBitsMSBFirstLoop!0 (_2!1572 lt!38541) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!26941 e!18233))

(declare-fun res!23267 () Bool)

(assert (=> b!26941 (=> (not res!23267) (not e!18233))))

(assert (=> b!26941 (= res!23267 (validate_offset_bits!1 ((_ sign_extend 32) (size!735 (buf!1062 (_2!1572 lt!38541)))) ((_ sign_extend 32) (currentByte!2387 thiss!1379)) ((_ sign_extend 32) (currentBit!2382 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38540 () Unit!2173)

(assert (=> b!26941 (= lt!38540 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1062 (_2!1572 lt!38541)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!26941 (= lt!38532 (reader!0 thiss!1379 (_2!1572 lt!38541)))))

(declare-fun b!26929 () Bool)

(assert (=> b!26929 (= e!18240 true)))

(declare-fun lt!38537 () (_ BitVec 64))

(assert (=> b!26929 (= lt!38537 (bitIndex!0 (size!735 (buf!1062 (_1!1573 lt!38530))) (currentByte!2387 (_1!1573 lt!38530)) (currentBit!2382 (_1!1573 lt!38530))))))

(declare-fun lt!38529 () (_ BitVec 64))

(assert (=> b!26929 (= lt!38529 (bitIndex!0 (size!735 (buf!1062 (_1!1573 lt!38525))) (currentByte!2387 (_1!1573 lt!38525)) (currentBit!2382 (_1!1573 lt!38525))))))

(declare-fun res!23252 () Bool)

(assert (=> start!5968 (=> (not res!23252) (not e!18244))))

(assert (=> start!5968 (= res!23252 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!735 srcBuffer!2))))))))

(assert (=> start!5968 e!18244))

(assert (=> start!5968 true))

(declare-fun array_inv!704 (array!1705) Bool)

(assert (=> start!5968 (array_inv!704 srcBuffer!2)))

(declare-fun e!18234 () Bool)

(declare-fun inv!12 (BitStream!1302) Bool)

(assert (=> start!5968 (and (inv!12 thiss!1379) e!18234)))

(declare-fun b!26942 () Bool)

(assert (=> b!26942 (= e!18239 (= lt!38538 (bvsub (bvsub (bvadd (bitIndex!0 (size!735 (buf!1062 (_2!1572 lt!38541))) (currentByte!2387 (_2!1572 lt!38541)) (currentBit!2382 (_2!1572 lt!38541))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!26943 () Bool)

(declare-fun res!23259 () Bool)

(assert (=> b!26943 (=> res!23259 e!18240)))

(assert (=> b!26943 (= res!23259 (not (isPrefixOf!0 (_1!1573 lt!38525) (_2!1572 lt!38535))))))

(declare-fun b!26944 () Bool)

(assert (=> b!26944 (= e!18234 (array_inv!704 (buf!1062 thiss!1379)))))

(declare-fun b!26945 () Bool)

(declare-fun res!23253 () Bool)

(assert (=> b!26945 (=> res!23253 e!18240)))

(assert (=> b!26945 (= res!23253 (not (isPrefixOf!0 (_1!1573 lt!38525) (_1!1573 lt!38530))))))

(declare-fun b!26946 () Bool)

(declare-fun res!23255 () Bool)

(assert (=> b!26946 (=> res!23255 e!18237)))

(assert (=> b!26946 (= res!23255 (not (invariant!0 (currentBit!2382 (_2!1572 lt!38541)) (currentByte!2387 (_2!1572 lt!38541)) (size!735 (buf!1062 (_2!1572 lt!38541))))))))

(declare-fun b!26947 () Bool)

(assert (=> b!26947 (= e!18244 (not e!18238))))

(declare-fun res!23262 () Bool)

(assert (=> b!26947 (=> res!23262 e!18238)))

(assert (=> b!26947 (= res!23262 (bvsge i!635 to!314))))

(assert (=> b!26947 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!38533 () Unit!2173)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1302) Unit!2173)

(assert (=> b!26947 (= lt!38533 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!26947 (= lt!38528 (bitIndex!0 (size!735 (buf!1062 thiss!1379)) (currentByte!2387 thiss!1379) (currentBit!2382 thiss!1379)))))

(assert (= (and start!5968 res!23252) b!26933))

(assert (= (and b!26933 res!23266) b!26947))

(assert (= (and b!26947 (not res!23262)) b!26928))

(assert (= (and b!26928 (not res!23264)) b!26941))

(assert (= (and b!26941 res!23267) b!26937))

(assert (= (and b!26941 (not res!23250)) b!26934))

(assert (= (and b!26934 (not res!23260)) b!26935))

(assert (= (and b!26935 (not res!23256)) b!26932))

(assert (= (and b!26932 (not res!23257)) b!26931))

(assert (= (and b!26931 res!23251) b!26942))

(assert (= (and b!26931 (not res!23258)) b!26946))

(assert (= (and b!26946 (not res!23255)) b!26939))

(assert (= (and b!26939 (not res!23268)) b!26936))

(assert (= (and b!26936 (not res!23265)) b!26930))

(assert (= (and b!26930 (not res!23263)) b!26943))

(assert (= (and b!26943 (not res!23259)) b!26938))

(assert (= (and b!26938 (not res!23254)) b!26945))

(assert (= (and b!26945 (not res!23253)) b!26940))

(assert (= (and b!26940 (not res!23261)) b!26929))

(assert (= start!5968 b!26944))

(declare-fun m!38601 () Bool)

(assert (=> b!26935 m!38601))

(declare-fun m!38603 () Bool)

(assert (=> b!26938 m!38603))

(declare-fun m!38605 () Bool)

(assert (=> b!26933 m!38605))

(declare-fun m!38607 () Bool)

(assert (=> b!26939 m!38607))

(declare-fun m!38609 () Bool)

(assert (=> b!26936 m!38609))

(declare-fun m!38611 () Bool)

(assert (=> b!26936 m!38611))

(declare-fun m!38613 () Bool)

(assert (=> b!26936 m!38613))

(declare-fun m!38615 () Bool)

(assert (=> b!26936 m!38615))

(declare-fun m!38617 () Bool)

(assert (=> b!26936 m!38617))

(declare-fun m!38619 () Bool)

(assert (=> b!26936 m!38619))

(declare-fun m!38621 () Bool)

(assert (=> b!26936 m!38621))

(declare-fun m!38623 () Bool)

(assert (=> b!26936 m!38623))

(declare-fun m!38625 () Bool)

(assert (=> b!26943 m!38625))

(declare-fun m!38627 () Bool)

(assert (=> start!5968 m!38627))

(declare-fun m!38629 () Bool)

(assert (=> start!5968 m!38629))

(declare-fun m!38631 () Bool)

(assert (=> b!26946 m!38631))

(declare-fun m!38633 () Bool)

(assert (=> b!26934 m!38633))

(declare-fun m!38635 () Bool)

(assert (=> b!26937 m!38635))

(assert (=> b!26937 m!38635))

(declare-fun m!38637 () Bool)

(assert (=> b!26937 m!38637))

(declare-fun m!38639 () Bool)

(assert (=> b!26937 m!38639))

(assert (=> b!26937 m!38639))

(declare-fun m!38641 () Bool)

(assert (=> b!26937 m!38641))

(declare-fun m!38643 () Bool)

(assert (=> b!26929 m!38643))

(declare-fun m!38645 () Bool)

(assert (=> b!26929 m!38645))

(declare-fun m!38647 () Bool)

(assert (=> b!26941 m!38647))

(declare-fun m!38649 () Bool)

(assert (=> b!26941 m!38649))

(declare-fun m!38651 () Bool)

(assert (=> b!26941 m!38651))

(declare-fun m!38653 () Bool)

(assert (=> b!26941 m!38653))

(declare-fun m!38655 () Bool)

(assert (=> b!26941 m!38655))

(declare-fun m!38657 () Bool)

(assert (=> b!26941 m!38657))

(declare-fun m!38659 () Bool)

(assert (=> b!26941 m!38659))

(declare-fun m!38661 () Bool)

(assert (=> b!26930 m!38661))

(declare-fun m!38663 () Bool)

(assert (=> b!26945 m!38663))

(declare-fun m!38665 () Bool)

(assert (=> b!26928 m!38665))

(declare-fun m!38667 () Bool)

(assert (=> b!26928 m!38667))

(declare-fun m!38669 () Bool)

(assert (=> b!26928 m!38669))

(assert (=> b!26928 m!38667))

(declare-fun m!38671 () Bool)

(assert (=> b!26928 m!38671))

(declare-fun m!38673 () Bool)

(assert (=> b!26928 m!38673))

(declare-fun m!38675 () Bool)

(assert (=> b!26944 m!38675))

(declare-fun m!38677 () Bool)

(assert (=> b!26942 m!38677))

(declare-fun m!38679 () Bool)

(assert (=> b!26947 m!38679))

(declare-fun m!38681 () Bool)

(assert (=> b!26947 m!38681))

(declare-fun m!38683 () Bool)

(assert (=> b!26947 m!38683))

(check-sat (not b!26945) (not b!26946) (not b!26939) (not b!26941) (not b!26936) (not b!26935) (not b!26930) (not b!26947) (not b!26933) (not start!5968) (not b!26938) (not b!26944) (not b!26937) (not b!26942) (not b!26928) (not b!26943) (not b!26934) (not b!26929))
