; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28146 () Bool)

(assert start!28146)

(declare-fun res!122055 () Bool)

(declare-fun e!97288 () Bool)

(assert (=> start!28146 (=> (not res!122055) (not e!97288))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6633 0))(
  ( (array!6634 (arr!3742 (Array (_ BitVec 32) (_ BitVec 8))) (size!3003 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6633)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!28146 (= res!122055 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3003 arr!237))))))

(assert (=> start!28146 e!97288))

(assert (=> start!28146 true))

(declare-fun array_inv!2792 (array!6633) Bool)

(assert (=> start!28146 (array_inv!2792 arr!237)))

(declare-datatypes ((BitStream!5264 0))(
  ( (BitStream!5265 (buf!3448 array!6633) (currentByte!6344 (_ BitVec 32)) (currentBit!6339 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5264)

(declare-fun e!97291 () Bool)

(declare-fun inv!12 (BitStream!5264) Bool)

(assert (=> start!28146 (and (inv!12 thiss!1634) e!97291)))

(declare-fun b!145925 () Bool)

(declare-fun e!97286 () Bool)

(assert (=> b!145925 (= e!97288 (not e!97286))))

(declare-fun res!122066 () Bool)

(assert (=> b!145925 (=> res!122066 e!97286)))

(declare-datatypes ((tuple2!13072 0))(
  ( (tuple2!13073 (_1!6885 BitStream!5264) (_2!6885 array!6633)) )
))
(declare-fun lt!226283 () tuple2!13072)

(declare-fun lt!226286 () tuple2!13072)

(declare-fun arrayRangesEq!319 (array!6633 array!6633 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!145925 (= res!122066 (not (arrayRangesEq!319 (_2!6885 lt!226286) (_2!6885 lt!226283) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!226281 () tuple2!13072)

(assert (=> b!145925 (arrayRangesEq!319 (_2!6885 lt!226286) (_2!6885 lt!226281) #b00000000000000000000000000000000 to!404)))

(declare-datatypes ((tuple2!13074 0))(
  ( (tuple2!13075 (_1!6886 BitStream!5264) (_2!6886 BitStream!5264)) )
))
(declare-fun lt!226293 () tuple2!13074)

(declare-datatypes ((Unit!9088 0))(
  ( (Unit!9089) )
))
(declare-fun lt!226294 () Unit!9088)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5264 array!6633 (_ BitVec 32) (_ BitVec 32)) Unit!9088)

(assert (=> b!145925 (= lt!226294 (readByteArrayLoopArrayPrefixLemma!0 (_1!6886 lt!226293) arr!237 from!447 to!404))))

(declare-fun lt!226292 () array!6633)

(declare-fun readByteArrayLoopPure!0 (BitStream!5264 array!6633 (_ BitVec 32) (_ BitVec 32)) tuple2!13072)

(declare-fun withMovedByteIndex!0 (BitStream!5264 (_ BitVec 32)) BitStream!5264)

(assert (=> b!145925 (= lt!226281 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6886 lt!226293) #b00000000000000000000000000000001) lt!226292 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!226297 () tuple2!13074)

(assert (=> b!145925 (= lt!226283 (readByteArrayLoopPure!0 (_1!6886 lt!226297) lt!226292 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((tuple2!13076 0))(
  ( (tuple2!13077 (_1!6887 BitStream!5264) (_2!6887 (_ BitVec 8))) )
))
(declare-fun lt!226275 () tuple2!13076)

(assert (=> b!145925 (= lt!226292 (array!6634 (store (arr!3742 arr!237) from!447 (_2!6887 lt!226275)) (size!3003 arr!237)))))

(declare-datatypes ((tuple2!13078 0))(
  ( (tuple2!13079 (_1!6888 Unit!9088) (_2!6888 BitStream!5264)) )
))
(declare-fun lt!226295 () tuple2!13078)

(declare-fun lt!226290 () tuple2!13078)

(declare-fun lt!226285 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!145925 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226295)))) ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226290))) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226290))) lt!226285)))

(declare-fun lt!226298 () Unit!9088)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5264 array!6633 (_ BitVec 32)) Unit!9088)

(assert (=> b!145925 (= lt!226298 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6888 lt!226290) (buf!3448 (_2!6888 lt!226295)) lt!226285))))

(assert (=> b!145925 (= (_1!6885 lt!226286) (_2!6886 lt!226293))))

(assert (=> b!145925 (= lt!226286 (readByteArrayLoopPure!0 (_1!6886 lt!226293) arr!237 from!447 to!404))))

(assert (=> b!145925 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226295)))) ((_ sign_extend 32) (currentByte!6344 thiss!1634)) ((_ sign_extend 32) (currentBit!6339 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!226278 () Unit!9088)

(assert (=> b!145925 (= lt!226278 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3448 (_2!6888 lt!226295)) (bvsub to!404 from!447)))))

(assert (=> b!145925 (= (_2!6887 lt!226275) (select (arr!3742 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!5264) tuple2!13076)

(assert (=> b!145925 (= lt!226275 (readBytePure!0 (_1!6886 lt!226293)))))

(declare-fun reader!0 (BitStream!5264 BitStream!5264) tuple2!13074)

(assert (=> b!145925 (= lt!226297 (reader!0 (_2!6888 lt!226290) (_2!6888 lt!226295)))))

(assert (=> b!145925 (= lt!226293 (reader!0 thiss!1634 (_2!6888 lt!226295)))))

(declare-fun e!97285 () Bool)

(assert (=> b!145925 e!97285))

(declare-fun res!122056 () Bool)

(assert (=> b!145925 (=> (not res!122056) (not e!97285))))

(declare-fun lt!226276 () tuple2!13076)

(declare-fun lt!226288 () tuple2!13076)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!145925 (= res!122056 (= (bitIndex!0 (size!3003 (buf!3448 (_1!6887 lt!226276))) (currentByte!6344 (_1!6887 lt!226276)) (currentBit!6339 (_1!6887 lt!226276))) (bitIndex!0 (size!3003 (buf!3448 (_1!6887 lt!226288))) (currentByte!6344 (_1!6887 lt!226288)) (currentBit!6339 (_1!6887 lt!226288)))))))

(declare-fun lt!226277 () Unit!9088)

(declare-fun lt!226287 () BitStream!5264)

(declare-fun readBytePrefixLemma!0 (BitStream!5264 BitStream!5264) Unit!9088)

(assert (=> b!145925 (= lt!226277 (readBytePrefixLemma!0 lt!226287 (_2!6888 lt!226295)))))

(assert (=> b!145925 (= lt!226288 (readBytePure!0 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634))))))

(assert (=> b!145925 (= lt!226276 (readBytePure!0 lt!226287))))

(assert (=> b!145925 (= lt!226287 (BitStream!5265 (buf!3448 (_2!6888 lt!226290)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634)))))

(declare-fun e!97283 () Bool)

(assert (=> b!145925 e!97283))

(declare-fun res!122063 () Bool)

(assert (=> b!145925 (=> (not res!122063) (not e!97283))))

(declare-fun isPrefixOf!0 (BitStream!5264 BitStream!5264) Bool)

(assert (=> b!145925 (= res!122063 (isPrefixOf!0 thiss!1634 (_2!6888 lt!226295)))))

(declare-fun lt!226296 () Unit!9088)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5264 BitStream!5264 BitStream!5264) Unit!9088)

(assert (=> b!145925 (= lt!226296 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6888 lt!226290) (_2!6888 lt!226295)))))

(declare-fun e!97292 () Bool)

(assert (=> b!145925 e!97292))

(declare-fun res!122064 () Bool)

(assert (=> b!145925 (=> (not res!122064) (not e!97292))))

(assert (=> b!145925 (= res!122064 (= (size!3003 (buf!3448 (_2!6888 lt!226290))) (size!3003 (buf!3448 (_2!6888 lt!226295)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5264 array!6633 (_ BitVec 32) (_ BitVec 32)) tuple2!13078)

(assert (=> b!145925 (= lt!226295 (appendByteArrayLoop!0 (_2!6888 lt!226290) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!145925 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226290)))) ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226290))) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226290))) lt!226285)))

(assert (=> b!145925 (= lt!226285 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!226289 () Unit!9088)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5264 BitStream!5264 (_ BitVec 64) (_ BitVec 32)) Unit!9088)

(assert (=> b!145925 (= lt!226289 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6888 lt!226290) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!97289 () Bool)

(assert (=> b!145925 e!97289))

(declare-fun res!122065 () Bool)

(assert (=> b!145925 (=> (not res!122065) (not e!97289))))

(assert (=> b!145925 (= res!122065 (= (size!3003 (buf!3448 thiss!1634)) (size!3003 (buf!3448 (_2!6888 lt!226290)))))))

(declare-fun appendByte!0 (BitStream!5264 (_ BitVec 8)) tuple2!13078)

(assert (=> b!145925 (= lt!226290 (appendByte!0 thiss!1634 (select (arr!3742 arr!237) from!447)))))

(declare-fun lt!226299 () tuple2!13072)

(declare-fun b!145926 () Bool)

(declare-fun e!97293 () Bool)

(assert (=> b!145926 (= e!97293 (not (arrayRangesEq!319 arr!237 (_2!6885 lt!226299) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!145927 () Bool)

(assert (=> b!145927 (= e!97285 (= (_2!6887 lt!226276) (_2!6887 lt!226288)))))

(declare-fun b!145928 () Bool)

(declare-fun e!97290 () Bool)

(assert (=> b!145928 (= e!97290 (not e!97293))))

(declare-fun res!122059 () Bool)

(assert (=> b!145928 (=> res!122059 e!97293)))

(declare-fun lt!226280 () tuple2!13074)

(assert (=> b!145928 (= res!122059 (or (not (= (size!3003 (_2!6885 lt!226299)) (size!3003 arr!237))) (not (= (_1!6885 lt!226299) (_2!6886 lt!226280)))))))

(assert (=> b!145928 (= lt!226299 (readByteArrayLoopPure!0 (_1!6886 lt!226280) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!226279 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!145928 (validate_offset_bits!1 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226295)))) ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226290))) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226290))) lt!226279)))

(declare-fun lt!226282 () Unit!9088)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5264 array!6633 (_ BitVec 64)) Unit!9088)

(assert (=> b!145928 (= lt!226282 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6888 lt!226290) (buf!3448 (_2!6888 lt!226295)) lt!226279))))

(assert (=> b!145928 (= lt!226280 (reader!0 (_2!6888 lt!226290) (_2!6888 lt!226295)))))

(declare-fun b!145929 () Bool)

(assert (=> b!145929 (= e!97292 e!97290)))

(declare-fun res!122060 () Bool)

(assert (=> b!145929 (=> (not res!122060) (not e!97290))))

(assert (=> b!145929 (= res!122060 (= (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226295))) (currentByte!6344 (_2!6888 lt!226295)) (currentBit!6339 (_2!6888 lt!226295))) (bvadd (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226290))) (currentByte!6344 (_2!6888 lt!226290)) (currentBit!6339 (_2!6888 lt!226290))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!226279))))))

(assert (=> b!145929 (= lt!226279 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!145930 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!145930 (= e!97283 (invariant!0 (currentBit!6339 thiss!1634) (currentByte!6344 thiss!1634) (size!3003 (buf!3448 (_2!6888 lt!226290)))))))

(declare-fun b!145931 () Bool)

(declare-fun res!122067 () Bool)

(assert (=> b!145931 (=> (not res!122067) (not e!97290))))

(assert (=> b!145931 (= res!122067 (isPrefixOf!0 (_2!6888 lt!226290) (_2!6888 lt!226295)))))

(declare-fun lt!226291 () tuple2!13076)

(declare-fun lt!226284 () tuple2!13074)

(declare-fun b!145932 () Bool)

(assert (=> b!145932 (= e!97289 (and (= (_2!6887 lt!226291) (select (arr!3742 arr!237) from!447)) (= (_1!6887 lt!226291) (_2!6886 lt!226284))))))

(assert (=> b!145932 (= lt!226291 (readBytePure!0 (_1!6886 lt!226284)))))

(assert (=> b!145932 (= lt!226284 (reader!0 thiss!1634 (_2!6888 lt!226290)))))

(declare-fun b!145933 () Bool)

(declare-fun res!122068 () Bool)

(assert (=> b!145933 (=> (not res!122068) (not e!97288))))

(assert (=> b!145933 (= res!122068 (bvslt from!447 to!404))))

(declare-fun b!145934 () Bool)

(assert (=> b!145934 (= e!97291 (array_inv!2792 (buf!3448 thiss!1634)))))

(declare-fun b!145935 () Bool)

(declare-fun res!122057 () Bool)

(assert (=> b!145935 (=> (not res!122057) (not e!97289))))

(assert (=> b!145935 (= res!122057 (isPrefixOf!0 thiss!1634 (_2!6888 lt!226290)))))

(declare-fun b!145936 () Bool)

(declare-fun res!122061 () Bool)

(assert (=> b!145936 (=> (not res!122061) (not e!97288))))

(assert (=> b!145936 (= res!122061 (invariant!0 (currentBit!6339 thiss!1634) (currentByte!6344 thiss!1634) (size!3003 (buf!3448 thiss!1634))))))

(declare-fun b!145937 () Bool)

(declare-fun res!122058 () Bool)

(assert (=> b!145937 (=> (not res!122058) (not e!97288))))

(assert (=> b!145937 (= res!122058 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3003 (buf!3448 thiss!1634))) ((_ sign_extend 32) (currentByte!6344 thiss!1634)) ((_ sign_extend 32) (currentBit!6339 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!145938 () Bool)

(declare-fun res!122062 () Bool)

(assert (=> b!145938 (=> (not res!122062) (not e!97289))))

(assert (=> b!145938 (= res!122062 (= (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226290))) (currentByte!6344 (_2!6888 lt!226290)) (currentBit!6339 (_2!6888 lt!226290))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3003 (buf!3448 thiss!1634)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634)))))))

(declare-fun b!145939 () Bool)

(assert (=> b!145939 (= e!97286 (and (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 (size!3003 (_2!6885 lt!226286)))))))

(assert (= (and start!28146 res!122055) b!145937))

(assert (= (and b!145937 res!122058) b!145933))

(assert (= (and b!145933 res!122068) b!145936))

(assert (= (and b!145936 res!122061) b!145925))

(assert (= (and b!145925 res!122065) b!145938))

(assert (= (and b!145938 res!122062) b!145935))

(assert (= (and b!145935 res!122057) b!145932))

(assert (= (and b!145925 res!122064) b!145929))

(assert (= (and b!145929 res!122060) b!145931))

(assert (= (and b!145931 res!122067) b!145928))

(assert (= (and b!145928 (not res!122059)) b!145926))

(assert (= (and b!145925 res!122063) b!145930))

(assert (= (and b!145925 res!122056) b!145927))

(assert (= (and b!145925 (not res!122066)) b!145939))

(assert (= start!28146 b!145934))

(declare-fun m!224689 () Bool)

(assert (=> b!145932 m!224689))

(declare-fun m!224691 () Bool)

(assert (=> b!145932 m!224691))

(declare-fun m!224693 () Bool)

(assert (=> b!145932 m!224693))

(declare-fun m!224695 () Bool)

(assert (=> b!145936 m!224695))

(declare-fun m!224697 () Bool)

(assert (=> b!145935 m!224697))

(declare-fun m!224699 () Bool)

(assert (=> b!145926 m!224699))

(declare-fun m!224701 () Bool)

(assert (=> b!145929 m!224701))

(declare-fun m!224703 () Bool)

(assert (=> b!145929 m!224703))

(declare-fun m!224705 () Bool)

(assert (=> b!145937 m!224705))

(declare-fun m!224707 () Bool)

(assert (=> start!28146 m!224707))

(declare-fun m!224709 () Bool)

(assert (=> start!28146 m!224709))

(assert (=> b!145938 m!224703))

(declare-fun m!224711 () Bool)

(assert (=> b!145938 m!224711))

(declare-fun m!224713 () Bool)

(assert (=> b!145931 m!224713))

(declare-fun m!224715 () Bool)

(assert (=> b!145934 m!224715))

(declare-fun m!224717 () Bool)

(assert (=> b!145930 m!224717))

(declare-fun m!224719 () Bool)

(assert (=> b!145925 m!224719))

(declare-fun m!224721 () Bool)

(assert (=> b!145925 m!224721))

(declare-fun m!224723 () Bool)

(assert (=> b!145925 m!224723))

(declare-fun m!224725 () Bool)

(assert (=> b!145925 m!224725))

(declare-fun m!224727 () Bool)

(assert (=> b!145925 m!224727))

(declare-fun m!224729 () Bool)

(assert (=> b!145925 m!224729))

(declare-fun m!224731 () Bool)

(assert (=> b!145925 m!224731))

(declare-fun m!224733 () Bool)

(assert (=> b!145925 m!224733))

(declare-fun m!224735 () Bool)

(assert (=> b!145925 m!224735))

(declare-fun m!224737 () Bool)

(assert (=> b!145925 m!224737))

(declare-fun m!224739 () Bool)

(assert (=> b!145925 m!224739))

(declare-fun m!224741 () Bool)

(assert (=> b!145925 m!224741))

(declare-fun m!224743 () Bool)

(assert (=> b!145925 m!224743))

(declare-fun m!224745 () Bool)

(assert (=> b!145925 m!224745))

(declare-fun m!224747 () Bool)

(assert (=> b!145925 m!224747))

(declare-fun m!224749 () Bool)

(assert (=> b!145925 m!224749))

(declare-fun m!224751 () Bool)

(assert (=> b!145925 m!224751))

(declare-fun m!224753 () Bool)

(assert (=> b!145925 m!224753))

(declare-fun m!224755 () Bool)

(assert (=> b!145925 m!224755))

(declare-fun m!224757 () Bool)

(assert (=> b!145925 m!224757))

(declare-fun m!224759 () Bool)

(assert (=> b!145925 m!224759))

(declare-fun m!224761 () Bool)

(assert (=> b!145925 m!224761))

(declare-fun m!224763 () Bool)

(assert (=> b!145925 m!224763))

(declare-fun m!224765 () Bool)

(assert (=> b!145925 m!224765))

(assert (=> b!145925 m!224689))

(declare-fun m!224767 () Bool)

(assert (=> b!145925 m!224767))

(assert (=> b!145925 m!224759))

(declare-fun m!224769 () Bool)

(assert (=> b!145925 m!224769))

(assert (=> b!145925 m!224689))

(declare-fun m!224771 () Bool)

(assert (=> b!145928 m!224771))

(declare-fun m!224773 () Bool)

(assert (=> b!145928 m!224773))

(declare-fun m!224775 () Bool)

(assert (=> b!145928 m!224775))

(assert (=> b!145928 m!224753))

(push 1)

(assert (not start!28146))

(assert (not b!145938))

(assert (not b!145932))

(assert (not b!145928))

(assert (not b!145925))

(assert (not b!145934))

(assert (not b!145931))

(assert (not b!145937))

(assert (not b!145929))

(assert (not b!145935))

(assert (not b!145936))

(assert (not b!145926))

(assert (not b!145930))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!46727 () Bool)

(declare-fun e!97351 () Bool)

(assert (=> d!46727 e!97351))

(declare-fun res!122157 () Bool)

(assert (=> d!46727 (=> (not res!122157) (not e!97351))))

(declare-fun lt!226553 () (_ BitVec 64))

(declare-fun lt!226554 () (_ BitVec 64))

(declare-fun lt!226552 () (_ BitVec 64))

(assert (=> d!46727 (= res!122157 (= lt!226553 (bvsub lt!226554 lt!226552)))))

(assert (=> d!46727 (or (= (bvand lt!226554 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226552 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!226554 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226554 lt!226552) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!46727 (= lt!226552 (remainingBits!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226295)))) ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226295))) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226295)))))))

(declare-fun lt!226555 () (_ BitVec 64))

(declare-fun lt!226556 () (_ BitVec 64))

(assert (=> d!46727 (= lt!226554 (bvmul lt!226555 lt!226556))))

(assert (=> d!46727 (or (= lt!226555 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!226556 (bvsdiv (bvmul lt!226555 lt!226556) lt!226555)))))

(assert (=> d!46727 (= lt!226556 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46727 (= lt!226555 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226295)))))))

(assert (=> d!46727 (= lt!226553 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226295))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226295)))))))

(assert (=> d!46727 (invariant!0 (currentBit!6339 (_2!6888 lt!226295)) (currentByte!6344 (_2!6888 lt!226295)) (size!3003 (buf!3448 (_2!6888 lt!226295))))))

(assert (=> d!46727 (= (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226295))) (currentByte!6344 (_2!6888 lt!226295)) (currentBit!6339 (_2!6888 lt!226295))) lt!226553)))

(declare-fun b!146038 () Bool)

(declare-fun res!122158 () Bool)

(assert (=> b!146038 (=> (not res!122158) (not e!97351))))

(assert (=> b!146038 (= res!122158 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!226553))))

(declare-fun b!146039 () Bool)

(declare-fun lt!226551 () (_ BitVec 64))

(assert (=> b!146039 (= e!97351 (bvsle lt!226553 (bvmul lt!226551 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146039 (or (= lt!226551 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!226551 #b0000000000000000000000000000000000000000000000000000000000001000) lt!226551)))))

(assert (=> b!146039 (= lt!226551 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226295)))))))

(assert (= (and d!46727 res!122157) b!146038))

(assert (= (and b!146038 res!122158) b!146039))

(declare-fun m!224975 () Bool)

(assert (=> d!46727 m!224975))

(declare-fun m!224977 () Bool)

(assert (=> d!46727 m!224977))

(assert (=> b!145929 d!46727))

(declare-fun d!46729 () Bool)

(declare-fun e!97352 () Bool)

(assert (=> d!46729 e!97352))

(declare-fun res!122159 () Bool)

(assert (=> d!46729 (=> (not res!122159) (not e!97352))))

(declare-fun lt!226558 () (_ BitVec 64))

(declare-fun lt!226560 () (_ BitVec 64))

(declare-fun lt!226559 () (_ BitVec 64))

(assert (=> d!46729 (= res!122159 (= lt!226559 (bvsub lt!226560 lt!226558)))))

(assert (=> d!46729 (or (= (bvand lt!226560 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226558 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!226560 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226560 lt!226558) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46729 (= lt!226558 (remainingBits!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226290)))) ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226290))) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226290)))))))

(declare-fun lt!226561 () (_ BitVec 64))

(declare-fun lt!226562 () (_ BitVec 64))

(assert (=> d!46729 (= lt!226560 (bvmul lt!226561 lt!226562))))

(assert (=> d!46729 (or (= lt!226561 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!226562 (bvsdiv (bvmul lt!226561 lt!226562) lt!226561)))))

(assert (=> d!46729 (= lt!226562 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46729 (= lt!226561 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226290)))))))

(assert (=> d!46729 (= lt!226559 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226290))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226290)))))))

(assert (=> d!46729 (invariant!0 (currentBit!6339 (_2!6888 lt!226290)) (currentByte!6344 (_2!6888 lt!226290)) (size!3003 (buf!3448 (_2!6888 lt!226290))))))

(assert (=> d!46729 (= (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226290))) (currentByte!6344 (_2!6888 lt!226290)) (currentBit!6339 (_2!6888 lt!226290))) lt!226559)))

(declare-fun b!146040 () Bool)

(declare-fun res!122160 () Bool)

(assert (=> b!146040 (=> (not res!122160) (not e!97352))))

(assert (=> b!146040 (= res!122160 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!226559))))

(declare-fun b!146041 () Bool)

(declare-fun lt!226557 () (_ BitVec 64))

(assert (=> b!146041 (= e!97352 (bvsle lt!226559 (bvmul lt!226557 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146041 (or (= lt!226557 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!226557 #b0000000000000000000000000000000000000000000000000000000000001000) lt!226557)))))

(assert (=> b!146041 (= lt!226557 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226290)))))))

(assert (= (and d!46729 res!122159) b!146040))

(assert (= (and b!146040 res!122160) b!146041))

(declare-fun m!224979 () Bool)

(assert (=> d!46729 m!224979))

(declare-fun m!224981 () Bool)

(assert (=> d!46729 m!224981))

(assert (=> b!145929 d!46729))

(declare-fun d!46731 () Bool)

(assert (=> d!46731 (= (invariant!0 (currentBit!6339 thiss!1634) (currentByte!6344 thiss!1634) (size!3003 (buf!3448 (_2!6888 lt!226290)))) (and (bvsge (currentBit!6339 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6339 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6344 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6344 thiss!1634) (size!3003 (buf!3448 (_2!6888 lt!226290)))) (and (= (currentBit!6339 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6344 thiss!1634) (size!3003 (buf!3448 (_2!6888 lt!226290))))))))))

(assert (=> b!145930 d!46731))

(declare-fun d!46733 () Bool)

(declare-fun res!122168 () Bool)

(declare-fun e!97358 () Bool)

(assert (=> d!46733 (=> (not res!122168) (not e!97358))))

(assert (=> d!46733 (= res!122168 (= (size!3003 (buf!3448 (_2!6888 lt!226290))) (size!3003 (buf!3448 (_2!6888 lt!226295)))))))

(assert (=> d!46733 (= (isPrefixOf!0 (_2!6888 lt!226290) (_2!6888 lt!226295)) e!97358)))

(declare-fun b!146048 () Bool)

(declare-fun res!122169 () Bool)

(assert (=> b!146048 (=> (not res!122169) (not e!97358))))

(assert (=> b!146048 (= res!122169 (bvsle (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226290))) (currentByte!6344 (_2!6888 lt!226290)) (currentBit!6339 (_2!6888 lt!226290))) (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226295))) (currentByte!6344 (_2!6888 lt!226295)) (currentBit!6339 (_2!6888 lt!226295)))))))

(declare-fun b!146049 () Bool)

(declare-fun e!97357 () Bool)

(assert (=> b!146049 (= e!97358 e!97357)))

(declare-fun res!122167 () Bool)

(assert (=> b!146049 (=> res!122167 e!97357)))

(assert (=> b!146049 (= res!122167 (= (size!3003 (buf!3448 (_2!6888 lt!226290))) #b00000000000000000000000000000000))))

(declare-fun b!146050 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6633 array!6633 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!146050 (= e!97357 (arrayBitRangesEq!0 (buf!3448 (_2!6888 lt!226290)) (buf!3448 (_2!6888 lt!226295)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226290))) (currentByte!6344 (_2!6888 lt!226290)) (currentBit!6339 (_2!6888 lt!226290)))))))

(assert (= (and d!46733 res!122168) b!146048))

(assert (= (and b!146048 res!122169) b!146049))

(assert (= (and b!146049 (not res!122167)) b!146050))

(assert (=> b!146048 m!224703))

(assert (=> b!146048 m!224701))

(assert (=> b!146050 m!224703))

(assert (=> b!146050 m!224703))

(declare-fun m!224983 () Bool)

(assert (=> b!146050 m!224983))

(assert (=> b!145931 d!46733))

(declare-fun d!46735 () Bool)

(declare-fun res!122174 () Bool)

(declare-fun e!97363 () Bool)

(assert (=> d!46735 (=> res!122174 e!97363)))

(assert (=> d!46735 (= res!122174 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!46735 (= (arrayRangesEq!319 arr!237 (_2!6885 lt!226299) #b00000000000000000000000000000000 to!404) e!97363)))

(declare-fun b!146055 () Bool)

(declare-fun e!97364 () Bool)

(assert (=> b!146055 (= e!97363 e!97364)))

(declare-fun res!122175 () Bool)

(assert (=> b!146055 (=> (not res!122175) (not e!97364))))

(assert (=> b!146055 (= res!122175 (= (select (arr!3742 arr!237) #b00000000000000000000000000000000) (select (arr!3742 (_2!6885 lt!226299)) #b00000000000000000000000000000000)))))

(declare-fun b!146056 () Bool)

(assert (=> b!146056 (= e!97364 (arrayRangesEq!319 arr!237 (_2!6885 lt!226299) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!46735 (not res!122174)) b!146055))

(assert (= (and b!146055 res!122175) b!146056))

(declare-fun m!224985 () Bool)

(assert (=> b!146055 m!224985))

(declare-fun m!224987 () Bool)

(assert (=> b!146055 m!224987))

(declare-fun m!224989 () Bool)

(assert (=> b!146056 m!224989))

(assert (=> b!145926 d!46735))

(declare-fun d!46737 () Bool)

(assert (=> d!46737 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3003 (buf!3448 thiss!1634))) ((_ sign_extend 32) (currentByte!6344 thiss!1634)) ((_ sign_extend 32) (currentBit!6339 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3003 (buf!3448 thiss!1634))) ((_ sign_extend 32) (currentByte!6344 thiss!1634)) ((_ sign_extend 32) (currentBit!6339 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11462 () Bool)

(assert (= bs!11462 d!46737))

(declare-fun m!224991 () Bool)

(assert (=> bs!11462 m!224991))

(assert (=> b!145937 d!46737))

(assert (=> b!145938 d!46729))

(declare-fun d!46739 () Bool)

(declare-fun e!97365 () Bool)

(assert (=> d!46739 e!97365))

(declare-fun res!122176 () Bool)

(assert (=> d!46739 (=> (not res!122176) (not e!97365))))

(declare-fun lt!226565 () (_ BitVec 64))

(declare-fun lt!226566 () (_ BitVec 64))

(declare-fun lt!226564 () (_ BitVec 64))

(assert (=> d!46739 (= res!122176 (= lt!226565 (bvsub lt!226566 lt!226564)))))

(assert (=> d!46739 (or (= (bvand lt!226566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226564 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!226566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226566 lt!226564) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46739 (= lt!226564 (remainingBits!0 ((_ sign_extend 32) (size!3003 (buf!3448 thiss!1634))) ((_ sign_extend 32) (currentByte!6344 thiss!1634)) ((_ sign_extend 32) (currentBit!6339 thiss!1634))))))

(declare-fun lt!226567 () (_ BitVec 64))

(declare-fun lt!226568 () (_ BitVec 64))

(assert (=> d!46739 (= lt!226566 (bvmul lt!226567 lt!226568))))

(assert (=> d!46739 (or (= lt!226567 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!226568 (bvsdiv (bvmul lt!226567 lt!226568) lt!226567)))))

(assert (=> d!46739 (= lt!226568 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46739 (= lt!226567 ((_ sign_extend 32) (size!3003 (buf!3448 thiss!1634))))))

(assert (=> d!46739 (= lt!226565 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6344 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6339 thiss!1634))))))

(assert (=> d!46739 (invariant!0 (currentBit!6339 thiss!1634) (currentByte!6344 thiss!1634) (size!3003 (buf!3448 thiss!1634)))))

(assert (=> d!46739 (= (bitIndex!0 (size!3003 (buf!3448 thiss!1634)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634)) lt!226565)))

(declare-fun b!146057 () Bool)

(declare-fun res!122177 () Bool)

(assert (=> b!146057 (=> (not res!122177) (not e!97365))))

(assert (=> b!146057 (= res!122177 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!226565))))

(declare-fun b!146058 () Bool)

(declare-fun lt!226563 () (_ BitVec 64))

(assert (=> b!146058 (= e!97365 (bvsle lt!226565 (bvmul lt!226563 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146058 (or (= lt!226563 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!226563 #b0000000000000000000000000000000000000000000000000000000000001000) lt!226563)))))

(assert (=> b!146058 (= lt!226563 ((_ sign_extend 32) (size!3003 (buf!3448 thiss!1634))))))

(assert (= (and d!46739 res!122176) b!146057))

(assert (= (and b!146057 res!122177) b!146058))

(assert (=> d!46739 m!224991))

(assert (=> d!46739 m!224695))

(assert (=> b!145938 d!46739))

(declare-fun d!46741 () Bool)

(declare-datatypes ((tuple3!566 0))(
  ( (tuple3!567 (_1!6891 Unit!9088) (_2!6891 BitStream!5264) (_3!350 array!6633)) )
))
(declare-fun lt!226571 () tuple3!566)

(declare-fun readByteArrayLoop!0 (BitStream!5264 array!6633 (_ BitVec 32) (_ BitVec 32)) tuple3!566)

(assert (=> d!46741 (= lt!226571 (readByteArrayLoop!0 (_1!6886 lt!226280) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!46741 (= (readByteArrayLoopPure!0 (_1!6886 lt!226280) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13073 (_2!6891 lt!226571) (_3!350 lt!226571)))))

(declare-fun bs!11463 () Bool)

(assert (= bs!11463 d!46741))

(declare-fun m!224993 () Bool)

(assert (=> bs!11463 m!224993))

(assert (=> b!145928 d!46741))

(declare-fun d!46743 () Bool)

(assert (=> d!46743 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226295)))) ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226290))) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226290))) lt!226279) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226295)))) ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226290))) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226290)))) lt!226279))))

(declare-fun bs!11464 () Bool)

(assert (= bs!11464 d!46743))

(declare-fun m!224995 () Bool)

(assert (=> bs!11464 m!224995))

(assert (=> b!145928 d!46743))

(declare-fun d!46745 () Bool)

(assert (=> d!46745 (validate_offset_bits!1 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226295)))) ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226290))) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226290))) lt!226279)))

(declare-fun lt!226574 () Unit!9088)

(declare-fun choose!9 (BitStream!5264 array!6633 (_ BitVec 64) BitStream!5264) Unit!9088)

(assert (=> d!46745 (= lt!226574 (choose!9 (_2!6888 lt!226290) (buf!3448 (_2!6888 lt!226295)) lt!226279 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 (_2!6888 lt!226290)) (currentBit!6339 (_2!6888 lt!226290)))))))

(assert (=> d!46745 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6888 lt!226290) (buf!3448 (_2!6888 lt!226295)) lt!226279) lt!226574)))

(declare-fun bs!11465 () Bool)

(assert (= bs!11465 d!46745))

(assert (=> bs!11465 m!224773))

(declare-fun m!224997 () Bool)

(assert (=> bs!11465 m!224997))

(assert (=> b!145928 d!46745))

(declare-fun b!146069 () Bool)

(declare-fun e!97370 () Unit!9088)

(declare-fun lt!226627 () Unit!9088)

(assert (=> b!146069 (= e!97370 lt!226627)))

(declare-fun lt!226616 () (_ BitVec 64))

(assert (=> b!146069 (= lt!226616 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!226624 () (_ BitVec 64))

(assert (=> b!146069 (= lt!226624 (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226290))) (currentByte!6344 (_2!6888 lt!226290)) (currentBit!6339 (_2!6888 lt!226290))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6633 array!6633 (_ BitVec 64) (_ BitVec 64)) Unit!9088)

(assert (=> b!146069 (= lt!226627 (arrayBitRangesEqSymmetric!0 (buf!3448 (_2!6888 lt!226290)) (buf!3448 (_2!6888 lt!226295)) lt!226616 lt!226624))))

(assert (=> b!146069 (arrayBitRangesEq!0 (buf!3448 (_2!6888 lt!226295)) (buf!3448 (_2!6888 lt!226290)) lt!226616 lt!226624)))

(declare-fun d!46747 () Bool)

(declare-fun e!97371 () Bool)

(assert (=> d!46747 e!97371))

(declare-fun res!122186 () Bool)

(assert (=> d!46747 (=> (not res!122186) (not e!97371))))

(declare-fun lt!226620 () tuple2!13074)

(assert (=> d!46747 (= res!122186 (isPrefixOf!0 (_1!6886 lt!226620) (_2!6886 lt!226620)))))

(declare-fun lt!226623 () BitStream!5264)

(assert (=> d!46747 (= lt!226620 (tuple2!13075 lt!226623 (_2!6888 lt!226295)))))

(declare-fun lt!226632 () Unit!9088)

(declare-fun lt!226615 () Unit!9088)

(assert (=> d!46747 (= lt!226632 lt!226615)))

(assert (=> d!46747 (isPrefixOf!0 lt!226623 (_2!6888 lt!226295))))

(assert (=> d!46747 (= lt!226615 (lemmaIsPrefixTransitive!0 lt!226623 (_2!6888 lt!226295) (_2!6888 lt!226295)))))

(declare-fun lt!226634 () Unit!9088)

(declare-fun lt!226626 () Unit!9088)

(assert (=> d!46747 (= lt!226634 lt!226626)))

(assert (=> d!46747 (isPrefixOf!0 lt!226623 (_2!6888 lt!226295))))

(assert (=> d!46747 (= lt!226626 (lemmaIsPrefixTransitive!0 lt!226623 (_2!6888 lt!226290) (_2!6888 lt!226295)))))

(declare-fun lt!226619 () Unit!9088)

(assert (=> d!46747 (= lt!226619 e!97370)))

(declare-fun c!7908 () Bool)

(assert (=> d!46747 (= c!7908 (not (= (size!3003 (buf!3448 (_2!6888 lt!226290))) #b00000000000000000000000000000000)))))

(declare-fun lt!226628 () Unit!9088)

(declare-fun lt!226622 () Unit!9088)

(assert (=> d!46747 (= lt!226628 lt!226622)))

(assert (=> d!46747 (isPrefixOf!0 (_2!6888 lt!226295) (_2!6888 lt!226295))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5264) Unit!9088)

(assert (=> d!46747 (= lt!226622 (lemmaIsPrefixRefl!0 (_2!6888 lt!226295)))))

(declare-fun lt!226631 () Unit!9088)

(declare-fun lt!226630 () Unit!9088)

(assert (=> d!46747 (= lt!226631 lt!226630)))

(assert (=> d!46747 (= lt!226630 (lemmaIsPrefixRefl!0 (_2!6888 lt!226295)))))

(declare-fun lt!226617 () Unit!9088)

(declare-fun lt!226629 () Unit!9088)

(assert (=> d!46747 (= lt!226617 lt!226629)))

(assert (=> d!46747 (isPrefixOf!0 lt!226623 lt!226623)))

(assert (=> d!46747 (= lt!226629 (lemmaIsPrefixRefl!0 lt!226623))))

(declare-fun lt!226633 () Unit!9088)

(declare-fun lt!226625 () Unit!9088)

(assert (=> d!46747 (= lt!226633 lt!226625)))

(assert (=> d!46747 (isPrefixOf!0 (_2!6888 lt!226290) (_2!6888 lt!226290))))

(assert (=> d!46747 (= lt!226625 (lemmaIsPrefixRefl!0 (_2!6888 lt!226290)))))

(assert (=> d!46747 (= lt!226623 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 (_2!6888 lt!226290)) (currentBit!6339 (_2!6888 lt!226290))))))

(assert (=> d!46747 (isPrefixOf!0 (_2!6888 lt!226290) (_2!6888 lt!226295))))

(assert (=> d!46747 (= (reader!0 (_2!6888 lt!226290) (_2!6888 lt!226295)) lt!226620)))

(declare-fun b!146070 () Bool)

(declare-fun res!122185 () Bool)

(assert (=> b!146070 (=> (not res!122185) (not e!97371))))

(assert (=> b!146070 (= res!122185 (isPrefixOf!0 (_2!6886 lt!226620) (_2!6888 lt!226295)))))

(declare-fun b!146071 () Bool)

(declare-fun res!122184 () Bool)

(assert (=> b!146071 (=> (not res!122184) (not e!97371))))

(assert (=> b!146071 (= res!122184 (isPrefixOf!0 (_1!6886 lt!226620) (_2!6888 lt!226290)))))

(declare-fun lt!226621 () (_ BitVec 64))

(declare-fun lt!226618 () (_ BitVec 64))

(declare-fun b!146072 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!5264 (_ BitVec 64)) BitStream!5264)

(assert (=> b!146072 (= e!97371 (= (_1!6886 lt!226620) (withMovedBitIndex!0 (_2!6886 lt!226620) (bvsub lt!226618 lt!226621))))))

(assert (=> b!146072 (or (= (bvand lt!226618 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226621 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!226618 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226618 lt!226621) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146072 (= lt!226621 (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226295))) (currentByte!6344 (_2!6888 lt!226295)) (currentBit!6339 (_2!6888 lt!226295))))))

(assert (=> b!146072 (= lt!226618 (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226290))) (currentByte!6344 (_2!6888 lt!226290)) (currentBit!6339 (_2!6888 lt!226290))))))

(declare-fun b!146073 () Bool)

(declare-fun Unit!9093 () Unit!9088)

(assert (=> b!146073 (= e!97370 Unit!9093)))

(assert (= (and d!46747 c!7908) b!146069))

(assert (= (and d!46747 (not c!7908)) b!146073))

(assert (= (and d!46747 res!122186) b!146071))

(assert (= (and b!146071 res!122184) b!146070))

(assert (= (and b!146070 res!122185) b!146072))

(assert (=> b!146069 m!224703))

(declare-fun m!224999 () Bool)

(assert (=> b!146069 m!224999))

(declare-fun m!225001 () Bool)

(assert (=> b!146069 m!225001))

(declare-fun m!225003 () Bool)

(assert (=> d!46747 m!225003))

(declare-fun m!225005 () Bool)

(assert (=> d!46747 m!225005))

(declare-fun m!225007 () Bool)

(assert (=> d!46747 m!225007))

(declare-fun m!225009 () Bool)

(assert (=> d!46747 m!225009))

(declare-fun m!225011 () Bool)

(assert (=> d!46747 m!225011))

(declare-fun m!225013 () Bool)

(assert (=> d!46747 m!225013))

(declare-fun m!225015 () Bool)

(assert (=> d!46747 m!225015))

(declare-fun m!225017 () Bool)

(assert (=> d!46747 m!225017))

(declare-fun m!225019 () Bool)

(assert (=> d!46747 m!225019))

(declare-fun m!225021 () Bool)

(assert (=> d!46747 m!225021))

(assert (=> d!46747 m!224713))

(declare-fun m!225023 () Bool)

(assert (=> b!146071 m!225023))

(declare-fun m!225025 () Bool)

(assert (=> b!146070 m!225025))

(declare-fun m!225027 () Bool)

(assert (=> b!146072 m!225027))

(assert (=> b!146072 m!224701))

(assert (=> b!146072 m!224703))

(assert (=> b!145928 d!46747))

(declare-fun d!46749 () Bool)

(assert (=> d!46749 (= (array_inv!2792 (buf!3448 thiss!1634)) (bvsge (size!3003 (buf!3448 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!145934 d!46749))

(declare-fun d!46751 () Bool)

(assert (=> d!46751 (= (array_inv!2792 arr!237) (bvsge (size!3003 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!28146 d!46751))

(declare-fun d!46753 () Bool)

(assert (=> d!46753 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6339 thiss!1634) (currentByte!6344 thiss!1634) (size!3003 (buf!3448 thiss!1634))))))

(declare-fun bs!11466 () Bool)

(assert (= bs!11466 d!46753))

(assert (=> bs!11466 m!224695))

(assert (=> start!28146 d!46753))

(declare-fun d!46755 () Bool)

(declare-fun res!122188 () Bool)

(declare-fun e!97373 () Bool)

(assert (=> d!46755 (=> (not res!122188) (not e!97373))))

(assert (=> d!46755 (= res!122188 (= (size!3003 (buf!3448 thiss!1634)) (size!3003 (buf!3448 (_2!6888 lt!226290)))))))

(assert (=> d!46755 (= (isPrefixOf!0 thiss!1634 (_2!6888 lt!226290)) e!97373)))

(declare-fun b!146074 () Bool)

(declare-fun res!122189 () Bool)

(assert (=> b!146074 (=> (not res!122189) (not e!97373))))

(assert (=> b!146074 (= res!122189 (bvsle (bitIndex!0 (size!3003 (buf!3448 thiss!1634)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634)) (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226290))) (currentByte!6344 (_2!6888 lt!226290)) (currentBit!6339 (_2!6888 lt!226290)))))))

(declare-fun b!146075 () Bool)

(declare-fun e!97372 () Bool)

(assert (=> b!146075 (= e!97373 e!97372)))

(declare-fun res!122187 () Bool)

(assert (=> b!146075 (=> res!122187 e!97372)))

(assert (=> b!146075 (= res!122187 (= (size!3003 (buf!3448 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!146076 () Bool)

(assert (=> b!146076 (= e!97372 (arrayBitRangesEq!0 (buf!3448 thiss!1634) (buf!3448 (_2!6888 lt!226290)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3003 (buf!3448 thiss!1634)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634))))))

(assert (= (and d!46755 res!122188) b!146074))

(assert (= (and b!146074 res!122189) b!146075))

(assert (= (and b!146075 (not res!122187)) b!146076))

(assert (=> b!146074 m!224711))

(assert (=> b!146074 m!224703))

(assert (=> b!146076 m!224711))

(assert (=> b!146076 m!224711))

(declare-fun m!225029 () Bool)

(assert (=> b!146076 m!225029))

(assert (=> b!145935 d!46755))

(declare-fun d!46757 () Bool)

(declare-datatypes ((tuple2!13082 0))(
  ( (tuple2!13083 (_1!6892 (_ BitVec 8)) (_2!6892 BitStream!5264)) )
))
(declare-fun lt!226637 () tuple2!13082)

(declare-fun readByte!0 (BitStream!5264) tuple2!13082)

(assert (=> d!46757 (= lt!226637 (readByte!0 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634))))))

(assert (=> d!46757 (= (readBytePure!0 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634))) (tuple2!13077 (_2!6892 lt!226637) (_1!6892 lt!226637)))))

(declare-fun bs!11467 () Bool)

(assert (= bs!11467 d!46757))

(declare-fun m!225031 () Bool)

(assert (=> bs!11467 m!225031))

(assert (=> b!145925 d!46757))

(declare-fun d!46759 () Bool)

(declare-fun res!122191 () Bool)

(declare-fun e!97375 () Bool)

(assert (=> d!46759 (=> (not res!122191) (not e!97375))))

(assert (=> d!46759 (= res!122191 (= (size!3003 (buf!3448 thiss!1634)) (size!3003 (buf!3448 (_2!6888 lt!226295)))))))

(assert (=> d!46759 (= (isPrefixOf!0 thiss!1634 (_2!6888 lt!226295)) e!97375)))

(declare-fun b!146077 () Bool)

(declare-fun res!122192 () Bool)

(assert (=> b!146077 (=> (not res!122192) (not e!97375))))

(assert (=> b!146077 (= res!122192 (bvsle (bitIndex!0 (size!3003 (buf!3448 thiss!1634)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634)) (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226295))) (currentByte!6344 (_2!6888 lt!226295)) (currentBit!6339 (_2!6888 lt!226295)))))))

(declare-fun b!146078 () Bool)

(declare-fun e!97374 () Bool)

(assert (=> b!146078 (= e!97375 e!97374)))

(declare-fun res!122190 () Bool)

(assert (=> b!146078 (=> res!122190 e!97374)))

(assert (=> b!146078 (= res!122190 (= (size!3003 (buf!3448 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!146079 () Bool)

(assert (=> b!146079 (= e!97374 (arrayBitRangesEq!0 (buf!3448 thiss!1634) (buf!3448 (_2!6888 lt!226295)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3003 (buf!3448 thiss!1634)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634))))))

(assert (= (and d!46759 res!122191) b!146077))

(assert (= (and b!146077 res!122192) b!146078))

(assert (= (and b!146078 (not res!122190)) b!146079))

(assert (=> b!146077 m!224711))

(assert (=> b!146077 m!224701))

(assert (=> b!146079 m!224711))

(assert (=> b!146079 m!224711))

(declare-fun m!225033 () Bool)

(assert (=> b!146079 m!225033))

(assert (=> b!145925 d!46759))

(declare-fun d!46761 () Bool)

(declare-fun e!97378 () Bool)

(assert (=> d!46761 e!97378))

(declare-fun res!122195 () Bool)

(assert (=> d!46761 (=> (not res!122195) (not e!97378))))

(declare-fun lt!226646 () tuple2!13076)

(declare-fun lt!226647 () tuple2!13076)

(assert (=> d!46761 (= res!122195 (= (bitIndex!0 (size!3003 (buf!3448 (_1!6887 lt!226646))) (currentByte!6344 (_1!6887 lt!226646)) (currentBit!6339 (_1!6887 lt!226646))) (bitIndex!0 (size!3003 (buf!3448 (_1!6887 lt!226647))) (currentByte!6344 (_1!6887 lt!226647)) (currentBit!6339 (_1!6887 lt!226647)))))))

(declare-fun lt!226648 () Unit!9088)

(declare-fun lt!226649 () BitStream!5264)

(declare-fun choose!14 (BitStream!5264 BitStream!5264 BitStream!5264 tuple2!13076 tuple2!13076 BitStream!5264 (_ BitVec 8) tuple2!13076 tuple2!13076 BitStream!5264 (_ BitVec 8)) Unit!9088)

(assert (=> d!46761 (= lt!226648 (choose!14 lt!226287 (_2!6888 lt!226295) lt!226649 lt!226646 (tuple2!13077 (_1!6887 lt!226646) (_2!6887 lt!226646)) (_1!6887 lt!226646) (_2!6887 lt!226646) lt!226647 (tuple2!13077 (_1!6887 lt!226647) (_2!6887 lt!226647)) (_1!6887 lt!226647) (_2!6887 lt!226647)))))

(assert (=> d!46761 (= lt!226647 (readBytePure!0 lt!226649))))

(assert (=> d!46761 (= lt!226646 (readBytePure!0 lt!226287))))

(assert (=> d!46761 (= lt!226649 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 lt!226287) (currentBit!6339 lt!226287)))))

(assert (=> d!46761 (= (readBytePrefixLemma!0 lt!226287 (_2!6888 lt!226295)) lt!226648)))

(declare-fun b!146082 () Bool)

(assert (=> b!146082 (= e!97378 (= (_2!6887 lt!226646) (_2!6887 lt!226647)))))

(assert (= (and d!46761 res!122195) b!146082))

(declare-fun m!225035 () Bool)

(assert (=> d!46761 m!225035))

(declare-fun m!225037 () Bool)

(assert (=> d!46761 m!225037))

(assert (=> d!46761 m!224729))

(declare-fun m!225039 () Bool)

(assert (=> d!46761 m!225039))

(declare-fun m!225041 () Bool)

(assert (=> d!46761 m!225041))

(assert (=> b!145925 d!46761))

(declare-fun b!146083 () Bool)

(declare-fun e!97379 () Unit!9088)

(declare-fun lt!226662 () Unit!9088)

(assert (=> b!146083 (= e!97379 lt!226662)))

(declare-fun lt!226651 () (_ BitVec 64))

(assert (=> b!146083 (= lt!226651 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!226659 () (_ BitVec 64))

(assert (=> b!146083 (= lt!226659 (bitIndex!0 (size!3003 (buf!3448 thiss!1634)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634)))))

(assert (=> b!146083 (= lt!226662 (arrayBitRangesEqSymmetric!0 (buf!3448 thiss!1634) (buf!3448 (_2!6888 lt!226295)) lt!226651 lt!226659))))

(assert (=> b!146083 (arrayBitRangesEq!0 (buf!3448 (_2!6888 lt!226295)) (buf!3448 thiss!1634) lt!226651 lt!226659)))

(declare-fun d!46763 () Bool)

(declare-fun e!97380 () Bool)

(assert (=> d!46763 e!97380))

(declare-fun res!122198 () Bool)

(assert (=> d!46763 (=> (not res!122198) (not e!97380))))

(declare-fun lt!226655 () tuple2!13074)

(assert (=> d!46763 (= res!122198 (isPrefixOf!0 (_1!6886 lt!226655) (_2!6886 lt!226655)))))

(declare-fun lt!226658 () BitStream!5264)

(assert (=> d!46763 (= lt!226655 (tuple2!13075 lt!226658 (_2!6888 lt!226295)))))

(declare-fun lt!226667 () Unit!9088)

(declare-fun lt!226650 () Unit!9088)

(assert (=> d!46763 (= lt!226667 lt!226650)))

(assert (=> d!46763 (isPrefixOf!0 lt!226658 (_2!6888 lt!226295))))

(assert (=> d!46763 (= lt!226650 (lemmaIsPrefixTransitive!0 lt!226658 (_2!6888 lt!226295) (_2!6888 lt!226295)))))

(declare-fun lt!226669 () Unit!9088)

(declare-fun lt!226661 () Unit!9088)

(assert (=> d!46763 (= lt!226669 lt!226661)))

(assert (=> d!46763 (isPrefixOf!0 lt!226658 (_2!6888 lt!226295))))

(assert (=> d!46763 (= lt!226661 (lemmaIsPrefixTransitive!0 lt!226658 thiss!1634 (_2!6888 lt!226295)))))

(declare-fun lt!226654 () Unit!9088)

(assert (=> d!46763 (= lt!226654 e!97379)))

(declare-fun c!7909 () Bool)

(assert (=> d!46763 (= c!7909 (not (= (size!3003 (buf!3448 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!226663 () Unit!9088)

(declare-fun lt!226657 () Unit!9088)

(assert (=> d!46763 (= lt!226663 lt!226657)))

(assert (=> d!46763 (isPrefixOf!0 (_2!6888 lt!226295) (_2!6888 lt!226295))))

(assert (=> d!46763 (= lt!226657 (lemmaIsPrefixRefl!0 (_2!6888 lt!226295)))))

(declare-fun lt!226666 () Unit!9088)

(declare-fun lt!226665 () Unit!9088)

(assert (=> d!46763 (= lt!226666 lt!226665)))

(assert (=> d!46763 (= lt!226665 (lemmaIsPrefixRefl!0 (_2!6888 lt!226295)))))

(declare-fun lt!226652 () Unit!9088)

(declare-fun lt!226664 () Unit!9088)

(assert (=> d!46763 (= lt!226652 lt!226664)))

(assert (=> d!46763 (isPrefixOf!0 lt!226658 lt!226658)))

(assert (=> d!46763 (= lt!226664 (lemmaIsPrefixRefl!0 lt!226658))))

(declare-fun lt!226668 () Unit!9088)

(declare-fun lt!226660 () Unit!9088)

(assert (=> d!46763 (= lt!226668 lt!226660)))

(assert (=> d!46763 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!46763 (= lt!226660 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!46763 (= lt!226658 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634)))))

(assert (=> d!46763 (isPrefixOf!0 thiss!1634 (_2!6888 lt!226295))))

(assert (=> d!46763 (= (reader!0 thiss!1634 (_2!6888 lt!226295)) lt!226655)))

(declare-fun b!146084 () Bool)

(declare-fun res!122197 () Bool)

(assert (=> b!146084 (=> (not res!122197) (not e!97380))))

(assert (=> b!146084 (= res!122197 (isPrefixOf!0 (_2!6886 lt!226655) (_2!6888 lt!226295)))))

(declare-fun b!146085 () Bool)

(declare-fun res!122196 () Bool)

(assert (=> b!146085 (=> (not res!122196) (not e!97380))))

(assert (=> b!146085 (= res!122196 (isPrefixOf!0 (_1!6886 lt!226655) thiss!1634))))

(declare-fun b!146086 () Bool)

(declare-fun lt!226653 () (_ BitVec 64))

(declare-fun lt!226656 () (_ BitVec 64))

(assert (=> b!146086 (= e!97380 (= (_1!6886 lt!226655) (withMovedBitIndex!0 (_2!6886 lt!226655) (bvsub lt!226653 lt!226656))))))

(assert (=> b!146086 (or (= (bvand lt!226653 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226656 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!226653 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226653 lt!226656) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146086 (= lt!226656 (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226295))) (currentByte!6344 (_2!6888 lt!226295)) (currentBit!6339 (_2!6888 lt!226295))))))

(assert (=> b!146086 (= lt!226653 (bitIndex!0 (size!3003 (buf!3448 thiss!1634)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634)))))

(declare-fun b!146087 () Bool)

(declare-fun Unit!9094 () Unit!9088)

(assert (=> b!146087 (= e!97379 Unit!9094)))

(assert (= (and d!46763 c!7909) b!146083))

(assert (= (and d!46763 (not c!7909)) b!146087))

(assert (= (and d!46763 res!122198) b!146085))

(assert (= (and b!146085 res!122196) b!146084))

(assert (= (and b!146084 res!122197) b!146086))

(assert (=> b!146083 m!224711))

(declare-fun m!225043 () Bool)

(assert (=> b!146083 m!225043))

(declare-fun m!225045 () Bool)

(assert (=> b!146083 m!225045))

(declare-fun m!225047 () Bool)

(assert (=> d!46763 m!225047))

(declare-fun m!225049 () Bool)

(assert (=> d!46763 m!225049))

(assert (=> d!46763 m!225007))

(declare-fun m!225051 () Bool)

(assert (=> d!46763 m!225051))

(declare-fun m!225053 () Bool)

(assert (=> d!46763 m!225053))

(assert (=> d!46763 m!225013))

(declare-fun m!225055 () Bool)

(assert (=> d!46763 m!225055))

(declare-fun m!225057 () Bool)

(assert (=> d!46763 m!225057))

(declare-fun m!225059 () Bool)

(assert (=> d!46763 m!225059))

(declare-fun m!225061 () Bool)

(assert (=> d!46763 m!225061))

(assert (=> d!46763 m!224747))

(declare-fun m!225063 () Bool)

(assert (=> b!146085 m!225063))

(declare-fun m!225065 () Bool)

(assert (=> b!146084 m!225065))

(declare-fun m!225067 () Bool)

(assert (=> b!146086 m!225067))

(assert (=> b!146086 m!224701))

(assert (=> b!146086 m!224711))

(assert (=> b!145925 d!46763))

(declare-fun d!46765 () Bool)

(declare-fun e!97381 () Bool)

(assert (=> d!46765 e!97381))

(declare-fun res!122199 () Bool)

(assert (=> d!46765 (=> (not res!122199) (not e!97381))))

(declare-fun lt!226671 () (_ BitVec 64))

(declare-fun lt!226673 () (_ BitVec 64))

(declare-fun lt!226672 () (_ BitVec 64))

(assert (=> d!46765 (= res!122199 (= lt!226672 (bvsub lt!226673 lt!226671)))))

(assert (=> d!46765 (or (= (bvand lt!226673 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226671 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!226673 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226673 lt!226671) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46765 (= lt!226671 (remainingBits!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_1!6887 lt!226288)))) ((_ sign_extend 32) (currentByte!6344 (_1!6887 lt!226288))) ((_ sign_extend 32) (currentBit!6339 (_1!6887 lt!226288)))))))

(declare-fun lt!226674 () (_ BitVec 64))

(declare-fun lt!226675 () (_ BitVec 64))

(assert (=> d!46765 (= lt!226673 (bvmul lt!226674 lt!226675))))

(assert (=> d!46765 (or (= lt!226674 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!226675 (bvsdiv (bvmul lt!226674 lt!226675) lt!226674)))))

(assert (=> d!46765 (= lt!226675 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46765 (= lt!226674 ((_ sign_extend 32) (size!3003 (buf!3448 (_1!6887 lt!226288)))))))

(assert (=> d!46765 (= lt!226672 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6344 (_1!6887 lt!226288))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6339 (_1!6887 lt!226288)))))))

(assert (=> d!46765 (invariant!0 (currentBit!6339 (_1!6887 lt!226288)) (currentByte!6344 (_1!6887 lt!226288)) (size!3003 (buf!3448 (_1!6887 lt!226288))))))

(assert (=> d!46765 (= (bitIndex!0 (size!3003 (buf!3448 (_1!6887 lt!226288))) (currentByte!6344 (_1!6887 lt!226288)) (currentBit!6339 (_1!6887 lt!226288))) lt!226672)))

(declare-fun b!146088 () Bool)

(declare-fun res!122200 () Bool)

(assert (=> b!146088 (=> (not res!122200) (not e!97381))))

(assert (=> b!146088 (= res!122200 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!226672))))

(declare-fun b!146089 () Bool)

(declare-fun lt!226670 () (_ BitVec 64))

(assert (=> b!146089 (= e!97381 (bvsle lt!226672 (bvmul lt!226670 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146089 (or (= lt!226670 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!226670 #b0000000000000000000000000000000000000000000000000000000000001000) lt!226670)))))

(assert (=> b!146089 (= lt!226670 ((_ sign_extend 32) (size!3003 (buf!3448 (_1!6887 lt!226288)))))))

(assert (= (and d!46765 res!122199) b!146088))

(assert (= (and b!146088 res!122200) b!146089))

(declare-fun m!225069 () Bool)

(assert (=> d!46765 m!225069))

(declare-fun m!225071 () Bool)

(assert (=> d!46765 m!225071))

(assert (=> b!145925 d!46765))

(declare-fun d!46767 () Bool)

(declare-fun lt!226676 () tuple2!13082)

(assert (=> d!46767 (= lt!226676 (readByte!0 (_1!6886 lt!226293)))))

(assert (=> d!46767 (= (readBytePure!0 (_1!6886 lt!226293)) (tuple2!13077 (_2!6892 lt!226676) (_1!6892 lt!226676)))))

(declare-fun bs!11468 () Bool)

(assert (= bs!11468 d!46767))

(declare-fun m!225073 () Bool)

(assert (=> bs!11468 m!225073))

(assert (=> b!145925 d!46767))

(declare-fun lt!226677 () tuple3!566)

(declare-fun d!46769 () Bool)

(assert (=> d!46769 (= lt!226677 (readByteArrayLoop!0 (_1!6886 lt!226293) arr!237 from!447 to!404))))

(assert (=> d!46769 (= (readByteArrayLoopPure!0 (_1!6886 lt!226293) arr!237 from!447 to!404) (tuple2!13073 (_2!6891 lt!226677) (_3!350 lt!226677)))))

(declare-fun bs!11469 () Bool)

(assert (= bs!11469 d!46769))

(declare-fun m!225075 () Bool)

(assert (=> bs!11469 m!225075))

(assert (=> b!145925 d!46769))

(declare-fun d!46771 () Bool)

(assert (=> d!46771 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226295)))) ((_ sign_extend 32) (currentByte!6344 thiss!1634)) ((_ sign_extend 32) (currentBit!6339 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!226680 () Unit!9088)

(declare-fun choose!26 (BitStream!5264 array!6633 (_ BitVec 32) BitStream!5264) Unit!9088)

(assert (=> d!46771 (= lt!226680 (choose!26 thiss!1634 (buf!3448 (_2!6888 lt!226295)) (bvsub to!404 from!447) (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634))))))

(assert (=> d!46771 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3448 (_2!6888 lt!226295)) (bvsub to!404 from!447)) lt!226680)))

(declare-fun bs!11470 () Bool)

(assert (= bs!11470 d!46771))

(assert (=> bs!11470 m!224763))

(declare-fun m!225077 () Bool)

(assert (=> bs!11470 m!225077))

(assert (=> b!145925 d!46771))

(declare-fun d!46773 () Bool)

(declare-fun moveByteIndex!0 (BitStream!5264 (_ BitVec 32)) tuple2!13078)

(assert (=> d!46773 (= (withMovedByteIndex!0 (_1!6886 lt!226293) #b00000000000000000000000000000001) (_2!6888 (moveByteIndex!0 (_1!6886 lt!226293) #b00000000000000000000000000000001)))))

(declare-fun bs!11471 () Bool)

(assert (= bs!11471 d!46773))

(declare-fun m!225079 () Bool)

(assert (=> bs!11471 m!225079))

(assert (=> b!145925 d!46773))

(declare-fun d!46775 () Bool)

(assert (=> d!46775 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226295)))) ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226290))) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226290))) lt!226285)))

(declare-fun lt!226681 () Unit!9088)

(assert (=> d!46775 (= lt!226681 (choose!26 (_2!6888 lt!226290) (buf!3448 (_2!6888 lt!226295)) lt!226285 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 (_2!6888 lt!226290)) (currentBit!6339 (_2!6888 lt!226290)))))))

(assert (=> d!46775 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6888 lt!226290) (buf!3448 (_2!6888 lt!226295)) lt!226285) lt!226681)))

(declare-fun bs!11472 () Bool)

(assert (= bs!11472 d!46775))

(assert (=> bs!11472 m!224733))

(declare-fun m!225081 () Bool)

(assert (=> bs!11472 m!225081))

(assert (=> b!145925 d!46775))

(declare-fun d!46777 () Bool)

(declare-fun e!97384 () Bool)

(assert (=> d!46777 e!97384))

(declare-fun res!122208 () Bool)

(assert (=> d!46777 (=> (not res!122208) (not e!97384))))

(declare-fun lt!226696 () tuple2!13078)

(assert (=> d!46777 (= res!122208 (= (size!3003 (buf!3448 thiss!1634)) (size!3003 (buf!3448 (_2!6888 lt!226696)))))))

(declare-fun choose!6 (BitStream!5264 (_ BitVec 8)) tuple2!13078)

(assert (=> d!46777 (= lt!226696 (choose!6 thiss!1634 (select (arr!3742 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!46777 (validate_offset_byte!0 ((_ sign_extend 32) (size!3003 (buf!3448 thiss!1634))) ((_ sign_extend 32) (currentByte!6344 thiss!1634)) ((_ sign_extend 32) (currentBit!6339 thiss!1634)))))

(assert (=> d!46777 (= (appendByte!0 thiss!1634 (select (arr!3742 arr!237) from!447)) lt!226696)))

(declare-fun b!146096 () Bool)

(declare-fun res!122207 () Bool)

(assert (=> b!146096 (=> (not res!122207) (not e!97384))))

(declare-fun lt!226693 () (_ BitVec 64))

(declare-fun lt!226694 () (_ BitVec 64))

(assert (=> b!146096 (= res!122207 (= (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226696))) (currentByte!6344 (_2!6888 lt!226696)) (currentBit!6339 (_2!6888 lt!226696))) (bvadd lt!226693 lt!226694)))))

(assert (=> b!146096 (or (not (= (bvand lt!226693 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226694 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!226693 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!226693 lt!226694) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146096 (= lt!226694 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!146096 (= lt!226693 (bitIndex!0 (size!3003 (buf!3448 thiss!1634)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634)))))

(declare-fun b!146097 () Bool)

(declare-fun res!122209 () Bool)

(assert (=> b!146097 (=> (not res!122209) (not e!97384))))

(assert (=> b!146097 (= res!122209 (isPrefixOf!0 thiss!1634 (_2!6888 lt!226696)))))

(declare-fun lt!226692 () tuple2!13076)

(declare-fun lt!226695 () tuple2!13074)

(declare-fun b!146098 () Bool)

(assert (=> b!146098 (= e!97384 (and (= (_2!6887 lt!226692) (select (arr!3742 arr!237) from!447)) (= (_1!6887 lt!226692) (_2!6886 lt!226695))))))

(assert (=> b!146098 (= lt!226692 (readBytePure!0 (_1!6886 lt!226695)))))

(assert (=> b!146098 (= lt!226695 (reader!0 thiss!1634 (_2!6888 lt!226696)))))

(assert (= (and d!46777 res!122208) b!146096))

(assert (= (and b!146096 res!122207) b!146097))

(assert (= (and b!146097 res!122209) b!146098))

(assert (=> d!46777 m!224689))

(declare-fun m!225083 () Bool)

(assert (=> d!46777 m!225083))

(declare-fun m!225085 () Bool)

(assert (=> d!46777 m!225085))

(declare-fun m!225087 () Bool)

(assert (=> b!146096 m!225087))

(assert (=> b!146096 m!224711))

(declare-fun m!225089 () Bool)

(assert (=> b!146097 m!225089))

(declare-fun m!225091 () Bool)

(assert (=> b!146098 m!225091))

(declare-fun m!225093 () Bool)

(assert (=> b!146098 m!225093))

(assert (=> b!145925 d!46777))

(declare-fun d!46779 () Bool)

(declare-fun e!97385 () Bool)

(assert (=> d!46779 e!97385))

(declare-fun res!122210 () Bool)

(assert (=> d!46779 (=> (not res!122210) (not e!97385))))

(declare-fun lt!226700 () (_ BitVec 64))

(declare-fun lt!226699 () (_ BitVec 64))

(declare-fun lt!226698 () (_ BitVec 64))

(assert (=> d!46779 (= res!122210 (= lt!226699 (bvsub lt!226700 lt!226698)))))

(assert (=> d!46779 (or (= (bvand lt!226700 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226698 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!226700 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226700 lt!226698) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46779 (= lt!226698 (remainingBits!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_1!6887 lt!226276)))) ((_ sign_extend 32) (currentByte!6344 (_1!6887 lt!226276))) ((_ sign_extend 32) (currentBit!6339 (_1!6887 lt!226276)))))))

(declare-fun lt!226701 () (_ BitVec 64))

(declare-fun lt!226702 () (_ BitVec 64))

(assert (=> d!46779 (= lt!226700 (bvmul lt!226701 lt!226702))))

(assert (=> d!46779 (or (= lt!226701 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!226702 (bvsdiv (bvmul lt!226701 lt!226702) lt!226701)))))

(assert (=> d!46779 (= lt!226702 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46779 (= lt!226701 ((_ sign_extend 32) (size!3003 (buf!3448 (_1!6887 lt!226276)))))))

(assert (=> d!46779 (= lt!226699 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6344 (_1!6887 lt!226276))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6339 (_1!6887 lt!226276)))))))

(assert (=> d!46779 (invariant!0 (currentBit!6339 (_1!6887 lt!226276)) (currentByte!6344 (_1!6887 lt!226276)) (size!3003 (buf!3448 (_1!6887 lt!226276))))))

(assert (=> d!46779 (= (bitIndex!0 (size!3003 (buf!3448 (_1!6887 lt!226276))) (currentByte!6344 (_1!6887 lt!226276)) (currentBit!6339 (_1!6887 lt!226276))) lt!226699)))

(declare-fun b!146099 () Bool)

(declare-fun res!122211 () Bool)

(assert (=> b!146099 (=> (not res!122211) (not e!97385))))

(assert (=> b!146099 (= res!122211 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!226699))))

(declare-fun b!146100 () Bool)

(declare-fun lt!226697 () (_ BitVec 64))

(assert (=> b!146100 (= e!97385 (bvsle lt!226699 (bvmul lt!226697 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146100 (or (= lt!226697 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!226697 #b0000000000000000000000000000000000000000000000000000000000001000) lt!226697)))))

(assert (=> b!146100 (= lt!226697 ((_ sign_extend 32) (size!3003 (buf!3448 (_1!6887 lt!226276)))))))

(assert (= (and d!46779 res!122210) b!146099))

(assert (= (and b!146099 res!122211) b!146100))

(declare-fun m!225095 () Bool)

(assert (=> d!46779 m!225095))

(declare-fun m!225097 () Bool)

(assert (=> d!46779 m!225097))

(assert (=> b!145925 d!46779))

(declare-fun d!46781 () Bool)

(assert (=> d!46781 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226290)))) ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226290))) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226290))) lt!226285) (bvsle ((_ sign_extend 32) lt!226285) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226290)))) ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226290))) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226290)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11473 () Bool)

(assert (= bs!11473 d!46781))

(assert (=> bs!11473 m!224979))

(assert (=> b!145925 d!46781))

(declare-fun d!46783 () Bool)

(assert (=> d!46783 (isPrefixOf!0 thiss!1634 (_2!6888 lt!226295))))

(declare-fun lt!226705 () Unit!9088)

(declare-fun choose!30 (BitStream!5264 BitStream!5264 BitStream!5264) Unit!9088)

(assert (=> d!46783 (= lt!226705 (choose!30 thiss!1634 (_2!6888 lt!226290) (_2!6888 lt!226295)))))

(assert (=> d!46783 (isPrefixOf!0 thiss!1634 (_2!6888 lt!226290))))

(assert (=> d!46783 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6888 lt!226290) (_2!6888 lt!226295)) lt!226705)))

(declare-fun bs!11474 () Bool)

(assert (= bs!11474 d!46783))

(assert (=> bs!11474 m!224747))

(declare-fun m!225099 () Bool)

(assert (=> bs!11474 m!225099))

(assert (=> bs!11474 m!224697))

(assert (=> b!145925 d!46783))

(declare-fun b!146111 () Bool)

(declare-fun res!122226 () Bool)

(declare-fun e!97393 () Bool)

(assert (=> b!146111 (=> (not res!122226) (not e!97393))))

(declare-fun lt!226724 () tuple2!13078)

(declare-fun lt!226732 () (_ BitVec 64))

(declare-fun lt!226726 () (_ BitVec 64))

(assert (=> b!146111 (= res!122226 (= (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226724))) (currentByte!6344 (_2!6888 lt!226724)) (currentBit!6339 (_2!6888 lt!226724))) (bvadd lt!226726 lt!226732)))))

(assert (=> b!146111 (or (not (= (bvand lt!226726 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226732 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!226726 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!226726 lt!226732) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!226731 () (_ BitVec 64))

(assert (=> b!146111 (= lt!226732 (bvmul lt!226731 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!146111 (or (= lt!226731 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!226731 #b0000000000000000000000000000000000000000000000000000000000001000) lt!226731)))))

(assert (=> b!146111 (= lt!226731 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!146111 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!146111 (= lt!226726 (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226290))) (currentByte!6344 (_2!6888 lt!226290)) (currentBit!6339 (_2!6888 lt!226290))))))

(declare-fun b!146112 () Bool)

(declare-fun e!97392 () Bool)

(declare-fun lt!226725 () (_ BitVec 64))

(assert (=> b!146112 (= e!97392 (validate_offset_bits!1 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226290)))) ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226290))) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226290))) lt!226725))))

(declare-fun b!146113 () Bool)

(declare-fun res!122222 () Bool)

(assert (=> b!146113 (=> (not res!122222) (not e!97393))))

(assert (=> b!146113 (= res!122222 (isPrefixOf!0 (_2!6888 lt!226290) (_2!6888 lt!226724)))))

(declare-fun d!46785 () Bool)

(assert (=> d!46785 e!97393))

(declare-fun res!122224 () Bool)

(assert (=> d!46785 (=> (not res!122224) (not e!97393))))

(assert (=> d!46785 (= res!122224 (= (size!3003 (buf!3448 (_2!6888 lt!226290))) (size!3003 (buf!3448 (_2!6888 lt!226724)))))))

(declare-fun choose!64 (BitStream!5264 array!6633 (_ BitVec 32) (_ BitVec 32)) tuple2!13078)

(assert (=> d!46785 (= lt!226724 (choose!64 (_2!6888 lt!226290) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!46785 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3003 arr!237)))))

(assert (=> d!46785 (= (appendByteArrayLoop!0 (_2!6888 lt!226290) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!226724)))

(declare-fun lt!226730 () tuple2!13072)

(declare-fun e!97394 () Bool)

(declare-fun b!146114 () Bool)

(assert (=> b!146114 (= e!97394 (arrayRangesEq!319 arr!237 (_2!6885 lt!226730) #b00000000000000000000000000000000 to!404))))

(declare-fun b!146115 () Bool)

(assert (=> b!146115 (= e!97393 e!97394)))

(declare-fun res!122223 () Bool)

(assert (=> b!146115 (=> (not res!122223) (not e!97394))))

(declare-fun lt!226728 () tuple2!13074)

(assert (=> b!146115 (= res!122223 (and (= (size!3003 (_2!6885 lt!226730)) (size!3003 arr!237)) (= (_1!6885 lt!226730) (_2!6886 lt!226728))))))

(assert (=> b!146115 (= lt!226730 (readByteArrayLoopPure!0 (_1!6886 lt!226728) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!226729 () Unit!9088)

(declare-fun lt!226727 () Unit!9088)

(assert (=> b!146115 (= lt!226729 lt!226727)))

(assert (=> b!146115 (validate_offset_bits!1 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226724)))) ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226290))) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226290))) lt!226725)))

(assert (=> b!146115 (= lt!226727 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6888 lt!226290) (buf!3448 (_2!6888 lt!226724)) lt!226725))))

(assert (=> b!146115 e!97392))

(declare-fun res!122225 () Bool)

(assert (=> b!146115 (=> (not res!122225) (not e!97392))))

(assert (=> b!146115 (= res!122225 (and (= (size!3003 (buf!3448 (_2!6888 lt!226290))) (size!3003 (buf!3448 (_2!6888 lt!226724)))) (bvsge lt!226725 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146115 (= lt!226725 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!146115 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!146115 (= lt!226728 (reader!0 (_2!6888 lt!226290) (_2!6888 lt!226724)))))

(assert (= (and d!46785 res!122224) b!146111))

(assert (= (and b!146111 res!122226) b!146113))

(assert (= (and b!146113 res!122222) b!146115))

(assert (= (and b!146115 res!122225) b!146112))

(assert (= (and b!146115 res!122223) b!146114))

(declare-fun m!225101 () Bool)

(assert (=> b!146112 m!225101))

(declare-fun m!225103 () Bool)

(assert (=> b!146113 m!225103))

(declare-fun m!225105 () Bool)

(assert (=> b!146111 m!225105))

(assert (=> b!146111 m!224703))

(declare-fun m!225107 () Bool)

(assert (=> b!146114 m!225107))

(declare-fun m!225109 () Bool)

(assert (=> d!46785 m!225109))

(declare-fun m!225111 () Bool)

(assert (=> b!146115 m!225111))

(declare-fun m!225113 () Bool)

(assert (=> b!146115 m!225113))

(declare-fun m!225115 () Bool)

(assert (=> b!146115 m!225115))

(declare-fun m!225117 () Bool)

(assert (=> b!146115 m!225117))

(assert (=> b!145925 d!46785))

(declare-fun lt!226733 () tuple3!566)

(declare-fun d!46787 () Bool)

(assert (=> d!46787 (= lt!226733 (readByteArrayLoop!0 (_1!6886 lt!226297) lt!226292 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!46787 (= (readByteArrayLoopPure!0 (_1!6886 lt!226297) lt!226292 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13073 (_2!6891 lt!226733) (_3!350 lt!226733)))))

(declare-fun bs!11475 () Bool)

(assert (= bs!11475 d!46787))

(declare-fun m!225119 () Bool)

(assert (=> bs!11475 m!225119))

(assert (=> b!145925 d!46787))

(declare-fun d!46789 () Bool)

(declare-fun res!122227 () Bool)

(declare-fun e!97395 () Bool)

(assert (=> d!46789 (=> res!122227 e!97395)))

(assert (=> d!46789 (= res!122227 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!46789 (= (arrayRangesEq!319 (_2!6885 lt!226286) (_2!6885 lt!226281) #b00000000000000000000000000000000 to!404) e!97395)))

(declare-fun b!146116 () Bool)

(declare-fun e!97396 () Bool)

(assert (=> b!146116 (= e!97395 e!97396)))

(declare-fun res!122228 () Bool)

(assert (=> b!146116 (=> (not res!122228) (not e!97396))))

(assert (=> b!146116 (= res!122228 (= (select (arr!3742 (_2!6885 lt!226286)) #b00000000000000000000000000000000) (select (arr!3742 (_2!6885 lt!226281)) #b00000000000000000000000000000000)))))

(declare-fun b!146117 () Bool)

(assert (=> b!146117 (= e!97396 (arrayRangesEq!319 (_2!6885 lt!226286) (_2!6885 lt!226281) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!46789 (not res!122227)) b!146116))

(assert (= (and b!146116 res!122228) b!146117))

(declare-fun m!225121 () Bool)

(assert (=> b!146116 m!225121))

(declare-fun m!225123 () Bool)

(assert (=> b!146116 m!225123))

(declare-fun m!225125 () Bool)

(assert (=> b!146117 m!225125))

(assert (=> b!145925 d!46789))

(declare-fun d!46791 () Bool)

(assert (=> d!46791 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226295)))) ((_ sign_extend 32) (currentByte!6344 thiss!1634)) ((_ sign_extend 32) (currentBit!6339 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226295)))) ((_ sign_extend 32) (currentByte!6344 thiss!1634)) ((_ sign_extend 32) (currentBit!6339 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11476 () Bool)

(assert (= bs!11476 d!46791))

(declare-fun m!225127 () Bool)

(assert (=> bs!11476 m!225127))

(assert (=> b!145925 d!46791))

(declare-fun lt!226734 () tuple3!566)

(declare-fun d!46793 () Bool)

(assert (=> d!46793 (= lt!226734 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6886 lt!226293) #b00000000000000000000000000000001) lt!226292 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!46793 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6886 lt!226293) #b00000000000000000000000000000001) lt!226292 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13073 (_2!6891 lt!226734) (_3!350 lt!226734)))))

(declare-fun bs!11477 () Bool)

(assert (= bs!11477 d!46793))

(assert (=> bs!11477 m!224759))

(declare-fun m!225129 () Bool)

(assert (=> bs!11477 m!225129))

(assert (=> b!145925 d!46793))

(declare-fun d!46795 () Bool)

(assert (=> d!46795 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226295)))) ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226290))) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226290))) lt!226285) (bvsle ((_ sign_extend 32) lt!226285) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226295)))) ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226290))) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226290)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11478 () Bool)

(assert (= bs!11478 d!46795))

(assert (=> bs!11478 m!224995))

(assert (=> b!145925 d!46795))

(declare-fun d!46797 () Bool)

(declare-fun e!97399 () Bool)

(assert (=> d!46797 e!97399))

(declare-fun res!122231 () Bool)

(assert (=> d!46797 (=> (not res!122231) (not e!97399))))

(assert (=> d!46797 (= res!122231 (and (or (let ((rhs!3229 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3229 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3229) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!46798 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!46798 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!46798 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3228 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3228 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3228) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!226741 () Unit!9088)

(declare-fun choose!57 (BitStream!5264 BitStream!5264 (_ BitVec 64) (_ BitVec 32)) Unit!9088)

(assert (=> d!46797 (= lt!226741 (choose!57 thiss!1634 (_2!6888 lt!226290) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!46797 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6888 lt!226290) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!226741)))

(declare-fun lt!226743 () (_ BitVec 32))

(declare-fun b!146120 () Bool)

(assert (=> b!146120 (= e!97399 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226290)))) ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226290))) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226290))) (bvsub (bvsub to!404 from!447) lt!226743)))))

(assert (=> b!146120 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!226743 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!226743) #b10000000000000000000000000000000)))))

(declare-fun lt!226742 () (_ BitVec 64))

(assert (=> b!146120 (= lt!226743 ((_ extract 31 0) lt!226742))))

(assert (=> b!146120 (and (bvslt lt!226742 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!226742 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!146120 (= lt!226742 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!46797 res!122231) b!146120))

(declare-fun m!225131 () Bool)

(assert (=> d!46797 m!225131))

(declare-fun m!225133 () Bool)

(assert (=> b!146120 m!225133))

(assert (=> b!145925 d!46797))

(declare-fun d!46800 () Bool)

(declare-fun lt!226744 () tuple2!13082)

(assert (=> d!46800 (= lt!226744 (readByte!0 lt!226287))))

(assert (=> d!46800 (= (readBytePure!0 lt!226287) (tuple2!13077 (_2!6892 lt!226744) (_1!6892 lt!226744)))))

(declare-fun bs!11479 () Bool)

(assert (= bs!11479 d!46800))

(declare-fun m!225135 () Bool)

(assert (=> bs!11479 m!225135))

(assert (=> b!145925 d!46800))

(declare-fun d!46802 () Bool)

(declare-fun lt!226753 () tuple2!13072)

(declare-fun lt!226755 () tuple2!13072)

(assert (=> d!46802 (arrayRangesEq!319 (_2!6885 lt!226753) (_2!6885 lt!226755) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!226754 () BitStream!5264)

(declare-fun lt!226756 () Unit!9088)

(declare-fun choose!35 (BitStream!5264 array!6633 (_ BitVec 32) (_ BitVec 32) tuple2!13072 array!6633 BitStream!5264 tuple2!13072 array!6633) Unit!9088)

(assert (=> d!46802 (= lt!226756 (choose!35 (_1!6886 lt!226293) arr!237 from!447 to!404 lt!226753 (_2!6885 lt!226753) lt!226754 lt!226755 (_2!6885 lt!226755)))))

(assert (=> d!46802 (= lt!226755 (readByteArrayLoopPure!0 lt!226754 (array!6634 (store (arr!3742 arr!237) from!447 (_2!6887 (readBytePure!0 (_1!6886 lt!226293)))) (size!3003 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!46802 (= lt!226754 (withMovedByteIndex!0 (_1!6886 lt!226293) #b00000000000000000000000000000001))))

(assert (=> d!46802 (= lt!226753 (readByteArrayLoopPure!0 (_1!6886 lt!226293) arr!237 from!447 to!404))))

(assert (=> d!46802 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!6886 lt!226293) arr!237 from!447 to!404) lt!226756)))

(declare-fun bs!11481 () Bool)

(assert (= bs!11481 d!46802))

(declare-fun m!225137 () Bool)

(assert (=> bs!11481 m!225137))

(declare-fun m!225139 () Bool)

(assert (=> bs!11481 m!225139))

(declare-fun m!225141 () Bool)

(assert (=> bs!11481 m!225141))

(assert (=> bs!11481 m!224759))

(assert (=> bs!11481 m!224751))

(declare-fun m!225143 () Bool)

(assert (=> bs!11481 m!225143))

(assert (=> bs!11481 m!224735))

(assert (=> b!145925 d!46802))

(declare-fun d!46804 () Bool)

(declare-fun res!122232 () Bool)

(declare-fun e!97400 () Bool)

(assert (=> d!46804 (=> res!122232 e!97400)))

(assert (=> d!46804 (= res!122232 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!46804 (= (arrayRangesEq!319 (_2!6885 lt!226286) (_2!6885 lt!226283) #b00000000000000000000000000000000 to!404) e!97400)))

(declare-fun b!146121 () Bool)

(declare-fun e!97401 () Bool)

(assert (=> b!146121 (= e!97400 e!97401)))

(declare-fun res!122233 () Bool)

(assert (=> b!146121 (=> (not res!122233) (not e!97401))))

(assert (=> b!146121 (= res!122233 (= (select (arr!3742 (_2!6885 lt!226286)) #b00000000000000000000000000000000) (select (arr!3742 (_2!6885 lt!226283)) #b00000000000000000000000000000000)))))

(declare-fun b!146122 () Bool)

(assert (=> b!146122 (= e!97401 (arrayRangesEq!319 (_2!6885 lt!226286) (_2!6885 lt!226283) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!46804 (not res!122232)) b!146121))

(assert (= (and b!146121 res!122233) b!146122))

(assert (=> b!146121 m!225121))

(declare-fun m!225145 () Bool)

(assert (=> b!146121 m!225145))

(declare-fun m!225147 () Bool)

(assert (=> b!146122 m!225147))

(assert (=> b!145925 d!46804))

(assert (=> b!145925 d!46747))

(declare-fun d!46806 () Bool)

(assert (=> d!46806 (= (invariant!0 (currentBit!6339 thiss!1634) (currentByte!6344 thiss!1634) (size!3003 (buf!3448 thiss!1634))) (and (bvsge (currentBit!6339 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6339 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6344 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6344 thiss!1634) (size!3003 (buf!3448 thiss!1634))) (and (= (currentBit!6339 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6344 thiss!1634) (size!3003 (buf!3448 thiss!1634)))))))))

(assert (=> b!145936 d!46806))

(declare-fun d!46808 () Bool)

(declare-fun lt!226757 () tuple2!13082)

(assert (=> d!46808 (= lt!226757 (readByte!0 (_1!6886 lt!226284)))))

(assert (=> d!46808 (= (readBytePure!0 (_1!6886 lt!226284)) (tuple2!13077 (_2!6892 lt!226757) (_1!6892 lt!226757)))))

(declare-fun bs!11482 () Bool)

(assert (= bs!11482 d!46808))

(declare-fun m!225149 () Bool)

(assert (=> bs!11482 m!225149))

(assert (=> b!145932 d!46808))

(declare-fun b!146123 () Bool)

(declare-fun e!97402 () Unit!9088)

(declare-fun lt!226770 () Unit!9088)

(assert (=> b!146123 (= e!97402 lt!226770)))

(declare-fun lt!226759 () (_ BitVec 64))

(assert (=> b!146123 (= lt!226759 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!226767 () (_ BitVec 64))

(assert (=> b!146123 (= lt!226767 (bitIndex!0 (size!3003 (buf!3448 thiss!1634)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634)))))

(assert (=> b!146123 (= lt!226770 (arrayBitRangesEqSymmetric!0 (buf!3448 thiss!1634) (buf!3448 (_2!6888 lt!226290)) lt!226759 lt!226767))))

(assert (=> b!146123 (arrayBitRangesEq!0 (buf!3448 (_2!6888 lt!226290)) (buf!3448 thiss!1634) lt!226759 lt!226767)))

(declare-fun d!46810 () Bool)

(declare-fun e!97403 () Bool)

(assert (=> d!46810 e!97403))

(declare-fun res!122236 () Bool)

(assert (=> d!46810 (=> (not res!122236) (not e!97403))))

(declare-fun lt!226763 () tuple2!13074)

(assert (=> d!46810 (= res!122236 (isPrefixOf!0 (_1!6886 lt!226763) (_2!6886 lt!226763)))))

(declare-fun lt!226766 () BitStream!5264)

(assert (=> d!46810 (= lt!226763 (tuple2!13075 lt!226766 (_2!6888 lt!226290)))))

(declare-fun lt!226775 () Unit!9088)

(declare-fun lt!226758 () Unit!9088)

(assert (=> d!46810 (= lt!226775 lt!226758)))

(assert (=> d!46810 (isPrefixOf!0 lt!226766 (_2!6888 lt!226290))))

(assert (=> d!46810 (= lt!226758 (lemmaIsPrefixTransitive!0 lt!226766 (_2!6888 lt!226290) (_2!6888 lt!226290)))))

(declare-fun lt!226777 () Unit!9088)

(declare-fun lt!226769 () Unit!9088)

(assert (=> d!46810 (= lt!226777 lt!226769)))

(assert (=> d!46810 (isPrefixOf!0 lt!226766 (_2!6888 lt!226290))))

(assert (=> d!46810 (= lt!226769 (lemmaIsPrefixTransitive!0 lt!226766 thiss!1634 (_2!6888 lt!226290)))))

(declare-fun lt!226762 () Unit!9088)

(assert (=> d!46810 (= lt!226762 e!97402)))

(declare-fun c!7910 () Bool)

(assert (=> d!46810 (= c!7910 (not (= (size!3003 (buf!3448 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!226771 () Unit!9088)

(declare-fun lt!226765 () Unit!9088)

(assert (=> d!46810 (= lt!226771 lt!226765)))

(assert (=> d!46810 (isPrefixOf!0 (_2!6888 lt!226290) (_2!6888 lt!226290))))

(assert (=> d!46810 (= lt!226765 (lemmaIsPrefixRefl!0 (_2!6888 lt!226290)))))

(declare-fun lt!226774 () Unit!9088)

(declare-fun lt!226773 () Unit!9088)

(assert (=> d!46810 (= lt!226774 lt!226773)))

(assert (=> d!46810 (= lt!226773 (lemmaIsPrefixRefl!0 (_2!6888 lt!226290)))))

(declare-fun lt!226760 () Unit!9088)

(declare-fun lt!226772 () Unit!9088)

(assert (=> d!46810 (= lt!226760 lt!226772)))

(assert (=> d!46810 (isPrefixOf!0 lt!226766 lt!226766)))

(assert (=> d!46810 (= lt!226772 (lemmaIsPrefixRefl!0 lt!226766))))

(declare-fun lt!226776 () Unit!9088)

(declare-fun lt!226768 () Unit!9088)

(assert (=> d!46810 (= lt!226776 lt!226768)))

(assert (=> d!46810 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!46810 (= lt!226768 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!46810 (= lt!226766 (BitStream!5265 (buf!3448 (_2!6888 lt!226290)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634)))))

(assert (=> d!46810 (isPrefixOf!0 thiss!1634 (_2!6888 lt!226290))))

(assert (=> d!46810 (= (reader!0 thiss!1634 (_2!6888 lt!226290)) lt!226763)))

(declare-fun b!146124 () Bool)

(declare-fun res!122235 () Bool)

(assert (=> b!146124 (=> (not res!122235) (not e!97403))))

(assert (=> b!146124 (= res!122235 (isPrefixOf!0 (_2!6886 lt!226763) (_2!6888 lt!226290)))))

(declare-fun b!146125 () Bool)

(declare-fun res!122234 () Bool)

(assert (=> b!146125 (=> (not res!122234) (not e!97403))))

(assert (=> b!146125 (= res!122234 (isPrefixOf!0 (_1!6886 lt!226763) thiss!1634))))

(declare-fun lt!226761 () (_ BitVec 64))

(declare-fun b!146126 () Bool)

(declare-fun lt!226764 () (_ BitVec 64))

(assert (=> b!146126 (= e!97403 (= (_1!6886 lt!226763) (withMovedBitIndex!0 (_2!6886 lt!226763) (bvsub lt!226761 lt!226764))))))

(assert (=> b!146126 (or (= (bvand lt!226761 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226764 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!226761 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226761 lt!226764) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146126 (= lt!226764 (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226290))) (currentByte!6344 (_2!6888 lt!226290)) (currentBit!6339 (_2!6888 lt!226290))))))

(assert (=> b!146126 (= lt!226761 (bitIndex!0 (size!3003 (buf!3448 thiss!1634)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634)))))

(declare-fun b!146127 () Bool)

(declare-fun Unit!9095 () Unit!9088)

(assert (=> b!146127 (= e!97402 Unit!9095)))

(assert (= (and d!46810 c!7910) b!146123))

(assert (= (and d!46810 (not c!7910)) b!146127))

(assert (= (and d!46810 res!122236) b!146125))

(assert (= (and b!146125 res!122234) b!146124))

(assert (= (and b!146124 res!122235) b!146126))

(assert (=> b!146123 m!224711))

(declare-fun m!225151 () Bool)

(assert (=> b!146123 m!225151))

(declare-fun m!225153 () Bool)

(assert (=> b!146123 m!225153))

(declare-fun m!225155 () Bool)

(assert (=> d!46810 m!225155))

(assert (=> d!46810 m!225049))

(assert (=> d!46810 m!225005))

(declare-fun m!225157 () Bool)

(assert (=> d!46810 m!225157))

(assert (=> d!46810 m!225053))

(assert (=> d!46810 m!225011))

(declare-fun m!225159 () Bool)

(assert (=> d!46810 m!225159))

(declare-fun m!225161 () Bool)

(assert (=> d!46810 m!225161))

(declare-fun m!225163 () Bool)

(assert (=> d!46810 m!225163))

(declare-fun m!225165 () Bool)

(assert (=> d!46810 m!225165))

(assert (=> d!46810 m!224697))

(declare-fun m!225167 () Bool)

(assert (=> b!146125 m!225167))

(declare-fun m!225169 () Bool)

(assert (=> b!146124 m!225169))

(declare-fun m!225171 () Bool)

(assert (=> b!146126 m!225171))

(assert (=> b!146126 m!224703))

(assert (=> b!146126 m!224711))

(assert (=> b!145932 d!46810))

(push 1)

(assert (not d!46741))

(assert (not d!46795))

(assert (not b!146124))

(assert (not d!46791))

(assert (not d!46729))

(assert (not d!46739))

(assert (not d!46771))

(assert (not b!146079))

(assert (not b!146083))

(assert (not d!46769))

(assert (not d!46785))

(assert (not d!46747))

(assert (not d!46737))

(assert (not b!146114))

(assert (not b!146085))

(assert (not b!146122))

(assert (not d!46783))

(assert (not b!146097))

(assert (not b!146120))

(assert (not b!146096))

(assert (not d!46810))

(assert (not d!46727))

(assert (not d!46800))

(assert (not d!46745))

(assert (not b!146125))

(assert (not d!46808))

(assert (not b!146076))

(assert (not d!46767))

(assert (not b!146070))

(assert (not d!46757))

(assert (not b!146123))

(assert (not b!146126))

(assert (not b!146115))

(assert (not d!46802))

(assert (not d!46743))

(assert (not b!146069))

(assert (not d!46763))

(assert (not b!146098))

(assert (not b!146050))

(assert (not b!146072))

(assert (not d!46793))

(assert (not b!146077))

(assert (not b!146048))

(assert (not b!146084))

(assert (not d!46765))

(assert (not b!146111))

(assert (not d!46781))

(assert (not d!46797))

(assert (not b!146086))

(assert (not b!146056))

(assert (not d!46775))

(assert (not b!146071))

(assert (not b!146112))

(assert (not d!46777))

(assert (not d!46761))

(assert (not b!146074))

(assert (not d!46753))

(assert (not b!146113))

(assert (not d!46779))

(assert (not d!46787))

(assert (not b!146117))

(assert (not d!46773))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!47083 () Bool)

(declare-fun lt!227442 () (_ BitVec 8))

(declare-fun lt!227440 () (_ BitVec 8))

(assert (=> d!47083 (= lt!227442 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3742 (buf!3448 (_1!6886 lt!226293))) (currentByte!6344 (_1!6886 lt!226293)))) ((_ sign_extend 24) lt!227440))))))

(assert (=> d!47083 (= lt!227440 ((_ extract 7 0) (currentBit!6339 (_1!6886 lt!226293))))))

(declare-fun e!97631 () Bool)

(assert (=> d!47083 e!97631))

(declare-fun res!122513 () Bool)

(assert (=> d!47083 (=> (not res!122513) (not e!97631))))

(assert (=> d!47083 (= res!122513 (validate_offset_bits!1 ((_ sign_extend 32) (size!3003 (buf!3448 (_1!6886 lt!226293)))) ((_ sign_extend 32) (currentByte!6344 (_1!6886 lt!226293))) ((_ sign_extend 32) (currentBit!6339 (_1!6886 lt!226293))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!13088 0))(
  ( (tuple2!13089 (_1!6897 Unit!9088) (_2!6897 (_ BitVec 8))) )
))
(declare-fun Unit!9146 () Unit!9088)

(declare-fun Unit!9147 () Unit!9088)

(assert (=> d!47083 (= (readByte!0 (_1!6886 lt!226293)) (tuple2!13083 (_2!6897 (ite (bvsgt ((_ sign_extend 24) lt!227440) #b00000000000000000000000000000000) (tuple2!13089 Unit!9146 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!227442) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3742 (buf!3448 (_1!6886 lt!226293))) (bvadd (currentByte!6344 (_1!6886 lt!226293)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!227440)))))))) (tuple2!13089 Unit!9147 lt!227442))) (BitStream!5265 (buf!3448 (_1!6886 lt!226293)) (bvadd (currentByte!6344 (_1!6886 lt!226293)) #b00000000000000000000000000000001) (currentBit!6339 (_1!6886 lt!226293)))))))

(declare-fun b!146450 () Bool)

(declare-fun e!97632 () Bool)

(assert (=> b!146450 (= e!97631 e!97632)))

(declare-fun res!122514 () Bool)

(assert (=> b!146450 (=> (not res!122514) (not e!97632))))

(declare-fun lt!227438 () tuple2!13082)

(assert (=> b!146450 (= res!122514 (= (buf!3448 (_2!6892 lt!227438)) (buf!3448 (_1!6886 lt!226293))))))

(declare-fun lt!227444 () (_ BitVec 8))

(declare-fun lt!227441 () (_ BitVec 8))

(declare-fun Unit!9148 () Unit!9088)

(declare-fun Unit!9149 () Unit!9088)

(assert (=> b!146450 (= lt!227438 (tuple2!13083 (_2!6897 (ite (bvsgt ((_ sign_extend 24) lt!227444) #b00000000000000000000000000000000) (tuple2!13089 Unit!9148 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!227441) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3742 (buf!3448 (_1!6886 lt!226293))) (bvadd (currentByte!6344 (_1!6886 lt!226293)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!227444)))))))) (tuple2!13089 Unit!9149 lt!227441))) (BitStream!5265 (buf!3448 (_1!6886 lt!226293)) (bvadd (currentByte!6344 (_1!6886 lt!226293)) #b00000000000000000000000000000001) (currentBit!6339 (_1!6886 lt!226293)))))))

(assert (=> b!146450 (= lt!227441 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3742 (buf!3448 (_1!6886 lt!226293))) (currentByte!6344 (_1!6886 lt!226293)))) ((_ sign_extend 24) lt!227444))))))

(assert (=> b!146450 (= lt!227444 ((_ extract 7 0) (currentBit!6339 (_1!6886 lt!226293))))))

(declare-fun b!146451 () Bool)

(declare-fun lt!227439 () (_ BitVec 64))

(declare-fun lt!227443 () (_ BitVec 64))

(assert (=> b!146451 (= e!97632 (= (bitIndex!0 (size!3003 (buf!3448 (_2!6892 lt!227438))) (currentByte!6344 (_2!6892 lt!227438)) (currentBit!6339 (_2!6892 lt!227438))) (bvadd lt!227443 lt!227439)))))

(assert (=> b!146451 (or (not (= (bvand lt!227443 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!227439 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!227443 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!227443 lt!227439) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146451 (= lt!227439 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!146451 (= lt!227443 (bitIndex!0 (size!3003 (buf!3448 (_1!6886 lt!226293))) (currentByte!6344 (_1!6886 lt!226293)) (currentBit!6339 (_1!6886 lt!226293))))))

(assert (= (and d!47083 res!122513) b!146450))

(assert (= (and b!146450 res!122514) b!146451))

(declare-fun m!225933 () Bool)

(assert (=> d!47083 m!225933))

(declare-fun m!225935 () Bool)

(assert (=> d!47083 m!225935))

(declare-fun m!225937 () Bool)

(assert (=> d!47083 m!225937))

(assert (=> b!146450 m!225937))

(assert (=> b!146450 m!225933))

(declare-fun m!225939 () Bool)

(assert (=> b!146451 m!225939))

(declare-fun m!225941 () Bool)

(assert (=> b!146451 m!225941))

(assert (=> d!46767 d!47083))

(declare-fun d!47085 () Bool)

(declare-fun e!97635 () Bool)

(assert (=> d!47085 e!97635))

(declare-fun res!122517 () Bool)

(assert (=> d!47085 (=> (not res!122517) (not e!97635))))

(declare-fun lt!227449 () BitStream!5264)

(declare-fun lt!227450 () (_ BitVec 64))

(assert (=> d!47085 (= res!122517 (= (bvadd lt!227450 (bvsub lt!226618 lt!226621)) (bitIndex!0 (size!3003 (buf!3448 lt!227449)) (currentByte!6344 lt!227449) (currentBit!6339 lt!227449))))))

(assert (=> d!47085 (or (not (= (bvand lt!227450 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226618 lt!226621) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!227450 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!227450 (bvsub lt!226618 lt!226621)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47085 (= lt!227450 (bitIndex!0 (size!3003 (buf!3448 (_2!6886 lt!226620))) (currentByte!6344 (_2!6886 lt!226620)) (currentBit!6339 (_2!6886 lt!226620))))))

(declare-fun moveBitIndex!0 (BitStream!5264 (_ BitVec 64)) tuple2!13078)

(assert (=> d!47085 (= lt!227449 (_2!6888 (moveBitIndex!0 (_2!6886 lt!226620) (bvsub lt!226618 lt!226621))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!5264 (_ BitVec 64)) Bool)

(assert (=> d!47085 (moveBitIndexPrecond!0 (_2!6886 lt!226620) (bvsub lt!226618 lt!226621))))

(assert (=> d!47085 (= (withMovedBitIndex!0 (_2!6886 lt!226620) (bvsub lt!226618 lt!226621)) lt!227449)))

(declare-fun b!146454 () Bool)

(assert (=> b!146454 (= e!97635 (= (size!3003 (buf!3448 (_2!6886 lt!226620))) (size!3003 (buf!3448 lt!227449))))))

(assert (= (and d!47085 res!122517) b!146454))

(declare-fun m!225943 () Bool)

(assert (=> d!47085 m!225943))

(declare-fun m!225945 () Bool)

(assert (=> d!47085 m!225945))

(declare-fun m!225947 () Bool)

(assert (=> d!47085 m!225947))

(declare-fun m!225949 () Bool)

(assert (=> d!47085 m!225949))

(assert (=> b!146072 d!47085))

(assert (=> b!146072 d!46727))

(assert (=> b!146072 d!46729))

(declare-fun d!47087 () Bool)

(declare-fun e!97636 () Bool)

(assert (=> d!47087 e!97636))

(declare-fun res!122518 () Bool)

(assert (=> d!47087 (=> (not res!122518) (not e!97636))))

(declare-fun lt!227452 () (_ BitVec 64))

(declare-fun lt!227454 () (_ BitVec 64))

(declare-fun lt!227453 () (_ BitVec 64))

(assert (=> d!47087 (= res!122518 (= lt!227453 (bvsub lt!227454 lt!227452)))))

(assert (=> d!47087 (or (= (bvand lt!227454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!227452 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!227454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!227454 lt!227452) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47087 (= lt!227452 (remainingBits!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226724)))) ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226724))) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226724)))))))

(declare-fun lt!227455 () (_ BitVec 64))

(declare-fun lt!227456 () (_ BitVec 64))

(assert (=> d!47087 (= lt!227454 (bvmul lt!227455 lt!227456))))

(assert (=> d!47087 (or (= lt!227455 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!227456 (bvsdiv (bvmul lt!227455 lt!227456) lt!227455)))))

(assert (=> d!47087 (= lt!227456 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47087 (= lt!227455 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226724)))))))

(assert (=> d!47087 (= lt!227453 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226724))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226724)))))))

(assert (=> d!47087 (invariant!0 (currentBit!6339 (_2!6888 lt!226724)) (currentByte!6344 (_2!6888 lt!226724)) (size!3003 (buf!3448 (_2!6888 lt!226724))))))

(assert (=> d!47087 (= (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226724))) (currentByte!6344 (_2!6888 lt!226724)) (currentBit!6339 (_2!6888 lt!226724))) lt!227453)))

(declare-fun b!146455 () Bool)

(declare-fun res!122519 () Bool)

(assert (=> b!146455 (=> (not res!122519) (not e!97636))))

(assert (=> b!146455 (= res!122519 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!227453))))

(declare-fun b!146456 () Bool)

(declare-fun lt!227451 () (_ BitVec 64))

(assert (=> b!146456 (= e!97636 (bvsle lt!227453 (bvmul lt!227451 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146456 (or (= lt!227451 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!227451 #b0000000000000000000000000000000000000000000000000000000000001000) lt!227451)))))

(assert (=> b!146456 (= lt!227451 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226724)))))))

(assert (= (and d!47087 res!122518) b!146455))

(assert (= (and b!146455 res!122519) b!146456))

(declare-fun m!225951 () Bool)

(assert (=> d!47087 m!225951))

(declare-fun m!225953 () Bool)

(assert (=> d!47087 m!225953))

(assert (=> b!146111 d!47087))

(assert (=> b!146111 d!46729))

(declare-fun d!47089 () Bool)

(declare-fun res!122521 () Bool)

(declare-fun e!97638 () Bool)

(assert (=> d!47089 (=> (not res!122521) (not e!97638))))

(assert (=> d!47089 (= res!122521 (= (size!3003 (buf!3448 (_2!6888 lt!226290))) (size!3003 (buf!3448 (_2!6888 lt!226724)))))))

(assert (=> d!47089 (= (isPrefixOf!0 (_2!6888 lt!226290) (_2!6888 lt!226724)) e!97638)))

(declare-fun b!146457 () Bool)

(declare-fun res!122522 () Bool)

(assert (=> b!146457 (=> (not res!122522) (not e!97638))))

(assert (=> b!146457 (= res!122522 (bvsle (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226290))) (currentByte!6344 (_2!6888 lt!226290)) (currentBit!6339 (_2!6888 lt!226290))) (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226724))) (currentByte!6344 (_2!6888 lt!226724)) (currentBit!6339 (_2!6888 lt!226724)))))))

(declare-fun b!146458 () Bool)

(declare-fun e!97637 () Bool)

(assert (=> b!146458 (= e!97638 e!97637)))

(declare-fun res!122520 () Bool)

(assert (=> b!146458 (=> res!122520 e!97637)))

(assert (=> b!146458 (= res!122520 (= (size!3003 (buf!3448 (_2!6888 lt!226290))) #b00000000000000000000000000000000))))

(declare-fun b!146459 () Bool)

(assert (=> b!146459 (= e!97637 (arrayBitRangesEq!0 (buf!3448 (_2!6888 lt!226290)) (buf!3448 (_2!6888 lt!226724)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226290))) (currentByte!6344 (_2!6888 lt!226290)) (currentBit!6339 (_2!6888 lt!226290)))))))

(assert (= (and d!47089 res!122521) b!146457))

(assert (= (and b!146457 res!122522) b!146458))

(assert (= (and b!146458 (not res!122520)) b!146459))

(assert (=> b!146457 m!224703))

(assert (=> b!146457 m!225105))

(assert (=> b!146459 m!224703))

(assert (=> b!146459 m!224703))

(declare-fun m!225955 () Bool)

(assert (=> b!146459 m!225955))

(assert (=> b!146113 d!47089))

(declare-fun d!47091 () Bool)

(assert (=> d!47091 (= (remainingBits!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226295)))) ((_ sign_extend 32) (currentByte!6344 thiss!1634)) ((_ sign_extend 32) (currentBit!6339 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226295)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6344 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6339 thiss!1634)))))))

(assert (=> d!46791 d!47091))

(declare-fun d!47093 () Bool)

(assert (=> d!47093 (= (remainingBits!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226290)))) ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226290))) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226290)))) (bvsub (bvmul ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226290)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226290))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226290))))))))

(assert (=> d!46781 d!47093))

(declare-fun d!47095 () Bool)

(assert (=> d!47095 (= (remainingBits!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_1!6887 lt!226288)))) ((_ sign_extend 32) (currentByte!6344 (_1!6887 lt!226288))) ((_ sign_extend 32) (currentBit!6339 (_1!6887 lt!226288)))) (bvsub (bvmul ((_ sign_extend 32) (size!3003 (buf!3448 (_1!6887 lt!226288)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6344 (_1!6887 lt!226288))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6339 (_1!6887 lt!226288))))))))

(assert (=> d!46765 d!47095))

(declare-fun d!47097 () Bool)

(assert (=> d!47097 (= (invariant!0 (currentBit!6339 (_1!6887 lt!226288)) (currentByte!6344 (_1!6887 lt!226288)) (size!3003 (buf!3448 (_1!6887 lt!226288)))) (and (bvsge (currentBit!6339 (_1!6887 lt!226288)) #b00000000000000000000000000000000) (bvslt (currentBit!6339 (_1!6887 lt!226288)) #b00000000000000000000000000001000) (bvsge (currentByte!6344 (_1!6887 lt!226288)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6344 (_1!6887 lt!226288)) (size!3003 (buf!3448 (_1!6887 lt!226288)))) (and (= (currentBit!6339 (_1!6887 lt!226288)) #b00000000000000000000000000000000) (= (currentByte!6344 (_1!6887 lt!226288)) (size!3003 (buf!3448 (_1!6887 lt!226288))))))))))

(assert (=> d!46765 d!47097))

(declare-fun d!47099 () Bool)

(declare-fun e!97641 () Bool)

(assert (=> d!47099 e!97641))

(declare-fun res!122525 () Bool)

(assert (=> d!47099 (=> (not res!122525) (not e!97641))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5264 (_ BitVec 32)) Bool)

(assert (=> d!47099 (= res!122525 (moveByteIndexPrecond!0 (_1!6886 lt!226293) #b00000000000000000000000000000001))))

(declare-fun Unit!9150 () Unit!9088)

(assert (=> d!47099 (= (moveByteIndex!0 (_1!6886 lt!226293) #b00000000000000000000000000000001) (tuple2!13079 Unit!9150 (BitStream!5265 (buf!3448 (_1!6886 lt!226293)) (bvadd (currentByte!6344 (_1!6886 lt!226293)) #b00000000000000000000000000000001) (currentBit!6339 (_1!6886 lt!226293)))))))

(declare-fun b!146462 () Bool)

(assert (=> b!146462 (= e!97641 (and (or (not (= (bvand (currentByte!6344 (_1!6886 lt!226293)) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6344 (_1!6886 lt!226293)) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6344 (_1!6886 lt!226293)) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6344 (_1!6886 lt!226293)) #b00000000000000000000000000000001) (bvadd (currentByte!6344 (_1!6886 lt!226293)) #b00000000000000000000000000000001))))))

(assert (= (and d!47099 res!122525) b!146462))

(declare-fun m!225957 () Bool)

(assert (=> d!47099 m!225957))

(assert (=> d!46773 d!47099))

(declare-fun d!47101 () Bool)

(declare-fun res!122527 () Bool)

(declare-fun e!97643 () Bool)

(assert (=> d!47101 (=> (not res!122527) (not e!97643))))

(assert (=> d!47101 (= res!122527 (= (size!3003 (buf!3448 (_2!6886 lt!226763))) (size!3003 (buf!3448 (_2!6888 lt!226290)))))))

(assert (=> d!47101 (= (isPrefixOf!0 (_2!6886 lt!226763) (_2!6888 lt!226290)) e!97643)))

(declare-fun b!146463 () Bool)

(declare-fun res!122528 () Bool)

(assert (=> b!146463 (=> (not res!122528) (not e!97643))))

(assert (=> b!146463 (= res!122528 (bvsle (bitIndex!0 (size!3003 (buf!3448 (_2!6886 lt!226763))) (currentByte!6344 (_2!6886 lt!226763)) (currentBit!6339 (_2!6886 lt!226763))) (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226290))) (currentByte!6344 (_2!6888 lt!226290)) (currentBit!6339 (_2!6888 lt!226290)))))))

(declare-fun b!146464 () Bool)

(declare-fun e!97642 () Bool)

(assert (=> b!146464 (= e!97643 e!97642)))

(declare-fun res!122526 () Bool)

(assert (=> b!146464 (=> res!122526 e!97642)))

(assert (=> b!146464 (= res!122526 (= (size!3003 (buf!3448 (_2!6886 lt!226763))) #b00000000000000000000000000000000))))

(declare-fun b!146465 () Bool)

(assert (=> b!146465 (= e!97642 (arrayBitRangesEq!0 (buf!3448 (_2!6886 lt!226763)) (buf!3448 (_2!6888 lt!226290)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3003 (buf!3448 (_2!6886 lt!226763))) (currentByte!6344 (_2!6886 lt!226763)) (currentBit!6339 (_2!6886 lt!226763)))))))

(assert (= (and d!47101 res!122527) b!146463))

(assert (= (and b!146463 res!122528) b!146464))

(assert (= (and b!146464 (not res!122526)) b!146465))

(declare-fun m!225959 () Bool)

(assert (=> b!146463 m!225959))

(assert (=> b!146463 m!224703))

(assert (=> b!146465 m!225959))

(assert (=> b!146465 m!225959))

(declare-fun m!225961 () Bool)

(assert (=> b!146465 m!225961))

(assert (=> b!146124 d!47101))

(assert (=> b!146074 d!46739))

(assert (=> b!146074 d!46729))

(declare-fun d!47103 () Bool)

(declare-fun lt!227457 () tuple3!566)

(assert (=> d!47103 (= lt!227457 (readByteArrayLoop!0 (_1!6886 lt!226728) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!47103 (= (readByteArrayLoopPure!0 (_1!6886 lt!226728) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13073 (_2!6891 lt!227457) (_3!350 lt!227457)))))

(declare-fun bs!11536 () Bool)

(assert (= bs!11536 d!47103))

(declare-fun m!225963 () Bool)

(assert (=> bs!11536 m!225963))

(assert (=> b!146115 d!47103))

(declare-fun d!47105 () Bool)

(assert (=> d!47105 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226724)))) ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226290))) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226290))) lt!226725) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226724)))) ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226290))) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226290)))) lt!226725))))

(declare-fun bs!11537 () Bool)

(assert (= bs!11537 d!47105))

(declare-fun m!225965 () Bool)

(assert (=> bs!11537 m!225965))

(assert (=> b!146115 d!47105))

(declare-fun d!47107 () Bool)

(assert (=> d!47107 (validate_offset_bits!1 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226724)))) ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226290))) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226290))) lt!226725)))

(declare-fun lt!227458 () Unit!9088)

(assert (=> d!47107 (= lt!227458 (choose!9 (_2!6888 lt!226290) (buf!3448 (_2!6888 lt!226724)) lt!226725 (BitStream!5265 (buf!3448 (_2!6888 lt!226724)) (currentByte!6344 (_2!6888 lt!226290)) (currentBit!6339 (_2!6888 lt!226290)))))))

(assert (=> d!47107 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6888 lt!226290) (buf!3448 (_2!6888 lt!226724)) lt!226725) lt!227458)))

(declare-fun bs!11538 () Bool)

(assert (= bs!11538 d!47107))

(assert (=> bs!11538 m!225113))

(declare-fun m!225967 () Bool)

(assert (=> bs!11538 m!225967))

(assert (=> b!146115 d!47107))

(declare-fun b!146466 () Bool)

(declare-fun e!97644 () Unit!9088)

(declare-fun lt!227471 () Unit!9088)

(assert (=> b!146466 (= e!97644 lt!227471)))

(declare-fun lt!227460 () (_ BitVec 64))

(assert (=> b!146466 (= lt!227460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!227468 () (_ BitVec 64))

(assert (=> b!146466 (= lt!227468 (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226290))) (currentByte!6344 (_2!6888 lt!226290)) (currentBit!6339 (_2!6888 lt!226290))))))

(assert (=> b!146466 (= lt!227471 (arrayBitRangesEqSymmetric!0 (buf!3448 (_2!6888 lt!226290)) (buf!3448 (_2!6888 lt!226724)) lt!227460 lt!227468))))

(assert (=> b!146466 (arrayBitRangesEq!0 (buf!3448 (_2!6888 lt!226724)) (buf!3448 (_2!6888 lt!226290)) lt!227460 lt!227468)))

(declare-fun d!47109 () Bool)

(declare-fun e!97645 () Bool)

(assert (=> d!47109 e!97645))

(declare-fun res!122531 () Bool)

(assert (=> d!47109 (=> (not res!122531) (not e!97645))))

(declare-fun lt!227464 () tuple2!13074)

(assert (=> d!47109 (= res!122531 (isPrefixOf!0 (_1!6886 lt!227464) (_2!6886 lt!227464)))))

(declare-fun lt!227467 () BitStream!5264)

(assert (=> d!47109 (= lt!227464 (tuple2!13075 lt!227467 (_2!6888 lt!226724)))))

(declare-fun lt!227476 () Unit!9088)

(declare-fun lt!227459 () Unit!9088)

(assert (=> d!47109 (= lt!227476 lt!227459)))

(assert (=> d!47109 (isPrefixOf!0 lt!227467 (_2!6888 lt!226724))))

(assert (=> d!47109 (= lt!227459 (lemmaIsPrefixTransitive!0 lt!227467 (_2!6888 lt!226724) (_2!6888 lt!226724)))))

(declare-fun lt!227478 () Unit!9088)

(declare-fun lt!227470 () Unit!9088)

(assert (=> d!47109 (= lt!227478 lt!227470)))

(assert (=> d!47109 (isPrefixOf!0 lt!227467 (_2!6888 lt!226724))))

(assert (=> d!47109 (= lt!227470 (lemmaIsPrefixTransitive!0 lt!227467 (_2!6888 lt!226290) (_2!6888 lt!226724)))))

(declare-fun lt!227463 () Unit!9088)

(assert (=> d!47109 (= lt!227463 e!97644)))

(declare-fun c!7932 () Bool)

(assert (=> d!47109 (= c!7932 (not (= (size!3003 (buf!3448 (_2!6888 lt!226290))) #b00000000000000000000000000000000)))))

(declare-fun lt!227472 () Unit!9088)

(declare-fun lt!227466 () Unit!9088)

(assert (=> d!47109 (= lt!227472 lt!227466)))

(assert (=> d!47109 (isPrefixOf!0 (_2!6888 lt!226724) (_2!6888 lt!226724))))

(assert (=> d!47109 (= lt!227466 (lemmaIsPrefixRefl!0 (_2!6888 lt!226724)))))

(declare-fun lt!227475 () Unit!9088)

(declare-fun lt!227474 () Unit!9088)

(assert (=> d!47109 (= lt!227475 lt!227474)))

(assert (=> d!47109 (= lt!227474 (lemmaIsPrefixRefl!0 (_2!6888 lt!226724)))))

(declare-fun lt!227461 () Unit!9088)

(declare-fun lt!227473 () Unit!9088)

(assert (=> d!47109 (= lt!227461 lt!227473)))

(assert (=> d!47109 (isPrefixOf!0 lt!227467 lt!227467)))

(assert (=> d!47109 (= lt!227473 (lemmaIsPrefixRefl!0 lt!227467))))

(declare-fun lt!227477 () Unit!9088)

(declare-fun lt!227469 () Unit!9088)

(assert (=> d!47109 (= lt!227477 lt!227469)))

(assert (=> d!47109 (isPrefixOf!0 (_2!6888 lt!226290) (_2!6888 lt!226290))))

(assert (=> d!47109 (= lt!227469 (lemmaIsPrefixRefl!0 (_2!6888 lt!226290)))))

(assert (=> d!47109 (= lt!227467 (BitStream!5265 (buf!3448 (_2!6888 lt!226724)) (currentByte!6344 (_2!6888 lt!226290)) (currentBit!6339 (_2!6888 lt!226290))))))

(assert (=> d!47109 (isPrefixOf!0 (_2!6888 lt!226290) (_2!6888 lt!226724))))

(assert (=> d!47109 (= (reader!0 (_2!6888 lt!226290) (_2!6888 lt!226724)) lt!227464)))

(declare-fun b!146467 () Bool)

(declare-fun res!122530 () Bool)

(assert (=> b!146467 (=> (not res!122530) (not e!97645))))

(assert (=> b!146467 (= res!122530 (isPrefixOf!0 (_2!6886 lt!227464) (_2!6888 lt!226724)))))

(declare-fun b!146468 () Bool)

(declare-fun res!122529 () Bool)

(assert (=> b!146468 (=> (not res!122529) (not e!97645))))

(assert (=> b!146468 (= res!122529 (isPrefixOf!0 (_1!6886 lt!227464) (_2!6888 lt!226290)))))

(declare-fun lt!227465 () (_ BitVec 64))

(declare-fun b!146469 () Bool)

(declare-fun lt!227462 () (_ BitVec 64))

(assert (=> b!146469 (= e!97645 (= (_1!6886 lt!227464) (withMovedBitIndex!0 (_2!6886 lt!227464) (bvsub lt!227462 lt!227465))))))

(assert (=> b!146469 (or (= (bvand lt!227462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!227465 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!227462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!227462 lt!227465) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146469 (= lt!227465 (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226724))) (currentByte!6344 (_2!6888 lt!226724)) (currentBit!6339 (_2!6888 lt!226724))))))

(assert (=> b!146469 (= lt!227462 (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226290))) (currentByte!6344 (_2!6888 lt!226290)) (currentBit!6339 (_2!6888 lt!226290))))))

(declare-fun b!146470 () Bool)

(declare-fun Unit!9151 () Unit!9088)

(assert (=> b!146470 (= e!97644 Unit!9151)))

(assert (= (and d!47109 c!7932) b!146466))

(assert (= (and d!47109 (not c!7932)) b!146470))

(assert (= (and d!47109 res!122531) b!146468))

(assert (= (and b!146468 res!122529) b!146467))

(assert (= (and b!146467 res!122530) b!146469))

(assert (=> b!146466 m!224703))

(declare-fun m!225969 () Bool)

(assert (=> b!146466 m!225969))

(declare-fun m!225971 () Bool)

(assert (=> b!146466 m!225971))

(declare-fun m!225973 () Bool)

(assert (=> d!47109 m!225973))

(assert (=> d!47109 m!225005))

(declare-fun m!225975 () Bool)

(assert (=> d!47109 m!225975))

(declare-fun m!225977 () Bool)

(assert (=> d!47109 m!225977))

(assert (=> d!47109 m!225011))

(declare-fun m!225979 () Bool)

(assert (=> d!47109 m!225979))

(declare-fun m!225981 () Bool)

(assert (=> d!47109 m!225981))

(declare-fun m!225983 () Bool)

(assert (=> d!47109 m!225983))

(declare-fun m!225985 () Bool)

(assert (=> d!47109 m!225985))

(declare-fun m!225987 () Bool)

(assert (=> d!47109 m!225987))

(assert (=> d!47109 m!225103))

(declare-fun m!225989 () Bool)

(assert (=> b!146468 m!225989))

(declare-fun m!225991 () Bool)

(assert (=> b!146467 m!225991))

(declare-fun m!225993 () Bool)

(assert (=> b!146469 m!225993))

(assert (=> b!146469 m!225105))

(assert (=> b!146469 m!224703))

(assert (=> b!146115 d!47109))

(declare-fun d!47111 () Bool)

(assert (=> d!47111 (= (remainingBits!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226295)))) ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226290))) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226290)))) (bvsub (bvmul ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226295)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226290))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226290))))))))

(assert (=> d!46743 d!47111))

(declare-fun lt!227571 () tuple2!13082)

(declare-fun c!7935 () Bool)

(declare-fun lt!227570 () array!6633)

(declare-fun lt!227554 () array!6633)

(declare-fun bm!1924 () Bool)

(declare-fun lt!227580 () (_ BitVec 32))

(declare-fun call!1928 () Bool)

(declare-fun lt!227572 () (_ BitVec 32))

(assert (=> bm!1924 (= call!1928 (arrayRangesEq!319 (ite c!7935 arr!237 lt!227570) (ite c!7935 (array!6634 (store (arr!3742 arr!237) from!447 (_1!6892 lt!227571)) (size!3003 arr!237)) lt!227554) (ite c!7935 #b00000000000000000000000000000000 lt!227572) (ite c!7935 from!447 lt!227580)))))

(declare-fun lt!227579 () tuple3!566)

(declare-fun b!146481 () Bool)

(declare-fun e!97654 () Bool)

(assert (=> b!146481 (= e!97654 (= (select (arr!3742 (_3!350 lt!227579)) from!447) (_2!6887 (readBytePure!0 (_1!6886 lt!226293)))))))

(assert (=> b!146481 (and (bvsge from!447 #b00000000000000000000000000000000) (bvslt from!447 (size!3003 (_3!350 lt!227579))))))

(declare-fun bm!1925 () Bool)

(declare-fun call!1929 () (_ BitVec 64))

(assert (=> bm!1925 (= call!1929 (bitIndex!0 (size!3003 (buf!3448 (_1!6886 lt!226293))) (currentByte!6344 (_1!6886 lt!226293)) (currentBit!6339 (_1!6886 lt!226293))))))

(declare-fun lt!227556 () tuple3!566)

(declare-fun call!1927 () Bool)

(declare-fun bm!1926 () Bool)

(assert (=> bm!1926 (= call!1927 (arrayRangesEq!319 arr!237 (ite c!7935 (_3!350 lt!227556) arr!237) #b00000000000000000000000000000000 (ite c!7935 from!447 (size!3003 arr!237))))))

(declare-fun b!146482 () Bool)

(declare-fun e!97652 () tuple3!566)

(declare-fun lt!227584 () Unit!9088)

(assert (=> b!146482 (= e!97652 (tuple3!567 lt!227584 (_2!6891 lt!227556) (_3!350 lt!227556)))))

(assert (=> b!146482 (= lt!227571 (readByte!0 (_1!6886 lt!226293)))))

(declare-fun lt!227566 () array!6633)

(assert (=> b!146482 (= lt!227566 (array!6634 (store (arr!3742 arr!237) from!447 (_1!6892 lt!227571)) (size!3003 arr!237)))))

(declare-fun lt!227563 () (_ BitVec 64))

(assert (=> b!146482 (= lt!227563 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!227574 () (_ BitVec 32))

(assert (=> b!146482 (= lt!227574 (bvsub to!404 from!447))))

(declare-fun lt!227558 () Unit!9088)

(assert (=> b!146482 (= lt!227558 (validateOffsetBytesFromBitIndexLemma!0 (_1!6886 lt!226293) (_2!6892 lt!227571) lt!227563 lt!227574))))

(assert (=> b!146482 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6892 lt!227571)))) ((_ sign_extend 32) (currentByte!6344 (_2!6892 lt!227571))) ((_ sign_extend 32) (currentBit!6339 (_2!6892 lt!227571))) (bvsub lt!227574 ((_ extract 31 0) (bvsdiv (bvadd lt!227563 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!227577 () Unit!9088)

(assert (=> b!146482 (= lt!227577 lt!227558)))

(assert (=> b!146482 (= lt!227556 (readByteArrayLoop!0 (_2!6892 lt!227571) lt!227566 (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!146482 (= (bitIndex!0 (size!3003 (buf!3448 (_2!6892 lt!227571))) (currentByte!6344 (_2!6892 lt!227571)) (currentBit!6339 (_2!6892 lt!227571))) (bvadd call!1929 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!227552 () Unit!9088)

(declare-fun Unit!9152 () Unit!9088)

(assert (=> b!146482 (= lt!227552 Unit!9152)))

(assert (=> b!146482 (= (bvadd (bitIndex!0 (size!3003 (buf!3448 (_2!6892 lt!227571))) (currentByte!6344 (_2!6892 lt!227571)) (currentBit!6339 (_2!6892 lt!227571))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3003 (buf!3448 (_2!6891 lt!227556))) (currentByte!6344 (_2!6891 lt!227556)) (currentBit!6339 (_2!6891 lt!227556))))))

(declare-fun lt!227561 () Unit!9088)

(declare-fun Unit!9153 () Unit!9088)

(assert (=> b!146482 (= lt!227561 Unit!9153)))

(assert (=> b!146482 (= (bvadd call!1929 (bvmul ((_ sign_extend 32) (bvsub to!404 from!447)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3003 (buf!3448 (_2!6891 lt!227556))) (currentByte!6344 (_2!6891 lt!227556)) (currentBit!6339 (_2!6891 lt!227556))))))

(declare-fun lt!227568 () Unit!9088)

(declare-fun Unit!9154 () Unit!9088)

(assert (=> b!146482 (= lt!227568 Unit!9154)))

(assert (=> b!146482 (and (= (buf!3448 (_1!6886 lt!226293)) (buf!3448 (_2!6891 lt!227556))) (= (size!3003 arr!237) (size!3003 (_3!350 lt!227556))))))

(declare-fun lt!227575 () Unit!9088)

(declare-fun Unit!9155 () Unit!9088)

(assert (=> b!146482 (= lt!227575 Unit!9155)))

(declare-fun lt!227576 () Unit!9088)

(declare-fun arrayUpdatedAtPrefixLemma!11 (array!6633 (_ BitVec 32) (_ BitVec 8)) Unit!9088)

(assert (=> b!146482 (= lt!227576 (arrayUpdatedAtPrefixLemma!11 arr!237 from!447 (_1!6892 lt!227571)))))

(assert (=> b!146482 call!1928))

(declare-fun lt!227585 () Unit!9088)

(assert (=> b!146482 (= lt!227585 lt!227576)))

(declare-fun lt!227564 () (_ BitVec 32))

(assert (=> b!146482 (= lt!227564 #b00000000000000000000000000000000)))

(declare-fun lt!227578 () Unit!9088)

(declare-fun arrayRangesEqTransitive!51 (array!6633 array!6633 array!6633 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9088)

(assert (=> b!146482 (= lt!227578 (arrayRangesEqTransitive!51 arr!237 lt!227566 (_3!350 lt!227556) lt!227564 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!146482 (arrayRangesEq!319 arr!237 (_3!350 lt!227556) lt!227564 from!447)))

(declare-fun lt!227581 () Unit!9088)

(assert (=> b!146482 (= lt!227581 lt!227578)))

(assert (=> b!146482 call!1927))

(declare-fun lt!227555 () Unit!9088)

(declare-fun Unit!9156 () Unit!9088)

(assert (=> b!146482 (= lt!227555 Unit!9156)))

(declare-fun lt!227573 () Unit!9088)

(declare-fun arrayRangesEqImpliesEq!11 (array!6633 array!6633 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9088)

(assert (=> b!146482 (= lt!227573 (arrayRangesEqImpliesEq!11 lt!227566 (_3!350 lt!227556) #b00000000000000000000000000000000 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!146482 (= (select (store (arr!3742 arr!237) from!447 (_1!6892 lt!227571)) from!447) (select (arr!3742 (_3!350 lt!227556)) from!447))))

(declare-fun lt!227582 () Unit!9088)

(assert (=> b!146482 (= lt!227582 lt!227573)))

(declare-fun lt!227562 () Bool)

(assert (=> b!146482 (= lt!227562 (= (select (arr!3742 (_3!350 lt!227556)) from!447) (_1!6892 lt!227571)))))

(declare-fun Unit!9157 () Unit!9088)

(assert (=> b!146482 (= lt!227584 Unit!9157)))

(assert (=> b!146482 lt!227562))

(declare-fun e!97653 () Bool)

(declare-fun b!146483 () Bool)

(assert (=> b!146483 (= e!97653 (arrayRangesEq!319 arr!237 (_3!350 lt!227579) #b00000000000000000000000000000000 from!447))))

(declare-fun b!146484 () Bool)

(declare-fun lt!227553 () Unit!9088)

(assert (=> b!146484 (= e!97652 (tuple3!567 lt!227553 (_1!6886 lt!226293) arr!237))))

(assert (=> b!146484 (= call!1929 call!1929)))

(declare-fun lt!227583 () Unit!9088)

(declare-fun Unit!9158 () Unit!9088)

(assert (=> b!146484 (= lt!227583 Unit!9158)))

(declare-fun lt!227551 () Unit!9088)

(declare-fun arrayRangesEqReflexiveLemma!11 (array!6633) Unit!9088)

(assert (=> b!146484 (= lt!227551 (arrayRangesEqReflexiveLemma!11 arr!237))))

(assert (=> b!146484 call!1927))

(declare-fun lt!227559 () Unit!9088)

(assert (=> b!146484 (= lt!227559 lt!227551)))

(assert (=> b!146484 (= lt!227570 arr!237)))

(assert (=> b!146484 (= lt!227554 arr!237)))

(declare-fun lt!227565 () (_ BitVec 32))

(assert (=> b!146484 (= lt!227565 #b00000000000000000000000000000000)))

(declare-fun lt!227560 () (_ BitVec 32))

(assert (=> b!146484 (= lt!227560 (size!3003 arr!237))))

(assert (=> b!146484 (= lt!227572 #b00000000000000000000000000000000)))

(assert (=> b!146484 (= lt!227580 from!447)))

(declare-fun arrayRangesEqSlicedLemma!11 (array!6633 array!6633 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9088)

(assert (=> b!146484 (= lt!227553 (arrayRangesEqSlicedLemma!11 lt!227570 lt!227554 lt!227565 lt!227560 lt!227572 lt!227580))))

(assert (=> b!146484 call!1928))

(declare-fun b!146485 () Bool)

(declare-fun res!122538 () Bool)

(assert (=> b!146485 (=> (not res!122538) (not e!97653))))

(assert (=> b!146485 (= res!122538 (and (= (buf!3448 (_1!6886 lt!226293)) (buf!3448 (_2!6891 lt!227579))) (= (size!3003 arr!237) (size!3003 (_3!350 lt!227579)))))))

(declare-fun d!47113 () Bool)

(assert (=> d!47113 e!97654))

(declare-fun res!122539 () Bool)

(assert (=> d!47113 (=> res!122539 e!97654)))

(assert (=> d!47113 (= res!122539 (bvsge from!447 to!404))))

(declare-fun lt!227567 () Bool)

(assert (=> d!47113 (= lt!227567 e!97653)))

(declare-fun res!122540 () Bool)

(assert (=> d!47113 (=> (not res!122540) (not e!97653))))

(declare-fun lt!227569 () (_ BitVec 64))

(declare-fun lt!227586 () (_ BitVec 64))

(assert (=> d!47113 (= res!122540 (= (bvadd lt!227586 lt!227569) (bitIndex!0 (size!3003 (buf!3448 (_2!6891 lt!227579))) (currentByte!6344 (_2!6891 lt!227579)) (currentBit!6339 (_2!6891 lt!227579)))))))

(assert (=> d!47113 (or (not (= (bvand lt!227586 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!227569 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!227586 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!227586 lt!227569) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!227557 () (_ BitVec 64))

(assert (=> d!47113 (= lt!227569 (bvmul lt!227557 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!47113 (or (= lt!227557 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!227557 #b0000000000000000000000000000000000000000000000000000000000001000) lt!227557)))))

(assert (=> d!47113 (= lt!227557 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(assert (=> d!47113 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))

(assert (=> d!47113 (= lt!227586 (bitIndex!0 (size!3003 (buf!3448 (_1!6886 lt!226293))) (currentByte!6344 (_1!6886 lt!226293)) (currentBit!6339 (_1!6886 lt!226293))))))

(assert (=> d!47113 (= lt!227579 e!97652)))

(assert (=> d!47113 (= c!7935 (bvslt from!447 to!404))))

(assert (=> d!47113 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3003 arr!237)))))

(assert (=> d!47113 (= (readByteArrayLoop!0 (_1!6886 lt!226293) arr!237 from!447 to!404) lt!227579)))

(assert (= (and d!47113 c!7935) b!146482))

(assert (= (and d!47113 (not c!7935)) b!146484))

(assert (= (or b!146482 b!146484) bm!1924))

(assert (= (or b!146482 b!146484) bm!1926))

(assert (= (or b!146482 b!146484) bm!1925))

(assert (= (and d!47113 res!122540) b!146485))

(assert (= (and b!146485 res!122538) b!146483))

(assert (= (and d!47113 (not res!122539)) b!146481))

(assert (=> bm!1925 m!225941))

(declare-fun m!225995 () Bool)

(assert (=> bm!1926 m!225995))

(declare-fun m!225997 () Bool)

(assert (=> b!146484 m!225997))

(declare-fun m!225999 () Bool)

(assert (=> b!146484 m!225999))

(declare-fun m!226001 () Bool)

(assert (=> b!146481 m!226001))

(assert (=> b!146481 m!224751))

(declare-fun m!226003 () Bool)

(assert (=> b!146483 m!226003))

(declare-fun m!226005 () Bool)

(assert (=> bm!1924 m!226005))

(declare-fun m!226007 () Bool)

(assert (=> bm!1924 m!226007))

(declare-fun m!226009 () Bool)

(assert (=> b!146482 m!226009))

(assert (=> b!146482 m!226005))

(declare-fun m!226011 () Bool)

(assert (=> b!146482 m!226011))

(declare-fun m!226013 () Bool)

(assert (=> b!146482 m!226013))

(assert (=> b!146482 m!225073))

(declare-fun m!226015 () Bool)

(assert (=> b!146482 m!226015))

(declare-fun m!226017 () Bool)

(assert (=> b!146482 m!226017))

(declare-fun m!226019 () Bool)

(assert (=> b!146482 m!226019))

(declare-fun m!226021 () Bool)

(assert (=> b!146482 m!226021))

(declare-fun m!226023 () Bool)

(assert (=> b!146482 m!226023))

(declare-fun m!226025 () Bool)

(assert (=> b!146482 m!226025))

(declare-fun m!226027 () Bool)

(assert (=> b!146482 m!226027))

(declare-fun m!226029 () Bool)

(assert (=> b!146482 m!226029))

(declare-fun m!226031 () Bool)

(assert (=> d!47113 m!226031))

(assert (=> d!47113 m!225941))

(assert (=> d!46769 d!47113))

(declare-fun d!47115 () Bool)

(declare-fun lt!227591 () (_ BitVec 8))

(declare-fun lt!227589 () (_ BitVec 8))

(assert (=> d!47115 (= lt!227591 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3742 (buf!3448 lt!226287)) (currentByte!6344 lt!226287))) ((_ sign_extend 24) lt!227589))))))

(assert (=> d!47115 (= lt!227589 ((_ extract 7 0) (currentBit!6339 lt!226287)))))

(declare-fun e!97655 () Bool)

(assert (=> d!47115 e!97655))

(declare-fun res!122541 () Bool)

(assert (=> d!47115 (=> (not res!122541) (not e!97655))))

(assert (=> d!47115 (= res!122541 (validate_offset_bits!1 ((_ sign_extend 32) (size!3003 (buf!3448 lt!226287))) ((_ sign_extend 32) (currentByte!6344 lt!226287)) ((_ sign_extend 32) (currentBit!6339 lt!226287)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9159 () Unit!9088)

(declare-fun Unit!9160 () Unit!9088)

(assert (=> d!47115 (= (readByte!0 lt!226287) (tuple2!13083 (_2!6897 (ite (bvsgt ((_ sign_extend 24) lt!227589) #b00000000000000000000000000000000) (tuple2!13089 Unit!9159 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!227591) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3742 (buf!3448 lt!226287)) (bvadd (currentByte!6344 lt!226287) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!227589)))))))) (tuple2!13089 Unit!9160 lt!227591))) (BitStream!5265 (buf!3448 lt!226287) (bvadd (currentByte!6344 lt!226287) #b00000000000000000000000000000001) (currentBit!6339 lt!226287))))))

(declare-fun b!146486 () Bool)

(declare-fun e!97656 () Bool)

(assert (=> b!146486 (= e!97655 e!97656)))

(declare-fun res!122542 () Bool)

(assert (=> b!146486 (=> (not res!122542) (not e!97656))))

(declare-fun lt!227587 () tuple2!13082)

(assert (=> b!146486 (= res!122542 (= (buf!3448 (_2!6892 lt!227587)) (buf!3448 lt!226287)))))

(declare-fun lt!227590 () (_ BitVec 8))

(declare-fun lt!227593 () (_ BitVec 8))

(declare-fun Unit!9161 () Unit!9088)

(declare-fun Unit!9162 () Unit!9088)

(assert (=> b!146486 (= lt!227587 (tuple2!13083 (_2!6897 (ite (bvsgt ((_ sign_extend 24) lt!227593) #b00000000000000000000000000000000) (tuple2!13089 Unit!9161 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!227590) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3742 (buf!3448 lt!226287)) (bvadd (currentByte!6344 lt!226287) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!227593)))))))) (tuple2!13089 Unit!9162 lt!227590))) (BitStream!5265 (buf!3448 lt!226287) (bvadd (currentByte!6344 lt!226287) #b00000000000000000000000000000001) (currentBit!6339 lt!226287))))))

(assert (=> b!146486 (= lt!227590 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3742 (buf!3448 lt!226287)) (currentByte!6344 lt!226287))) ((_ sign_extend 24) lt!227593))))))

(assert (=> b!146486 (= lt!227593 ((_ extract 7 0) (currentBit!6339 lt!226287)))))

(declare-fun lt!227592 () (_ BitVec 64))

(declare-fun b!146487 () Bool)

(declare-fun lt!227588 () (_ BitVec 64))

(assert (=> b!146487 (= e!97656 (= (bitIndex!0 (size!3003 (buf!3448 (_2!6892 lt!227587))) (currentByte!6344 (_2!6892 lt!227587)) (currentBit!6339 (_2!6892 lt!227587))) (bvadd lt!227592 lt!227588)))))

(assert (=> b!146487 (or (not (= (bvand lt!227592 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!227588 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!227592 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!227592 lt!227588) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146487 (= lt!227588 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!146487 (= lt!227592 (bitIndex!0 (size!3003 (buf!3448 lt!226287)) (currentByte!6344 lt!226287) (currentBit!6339 lt!226287)))))

(assert (= (and d!47115 res!122541) b!146486))

(assert (= (and b!146486 res!122542) b!146487))

(declare-fun m!226033 () Bool)

(assert (=> d!47115 m!226033))

(declare-fun m!226035 () Bool)

(assert (=> d!47115 m!226035))

(declare-fun m!226037 () Bool)

(assert (=> d!47115 m!226037))

(assert (=> b!146486 m!226037))

(assert (=> b!146486 m!226033))

(declare-fun m!226039 () Bool)

(assert (=> b!146487 m!226039))

(declare-fun m!226041 () Bool)

(assert (=> b!146487 m!226041))

(assert (=> d!46800 d!47115))

(declare-fun d!47117 () Bool)

(assert (=> d!47117 (= (remainingBits!0 ((_ sign_extend 32) (size!3003 (buf!3448 thiss!1634))) ((_ sign_extend 32) (currentByte!6344 thiss!1634)) ((_ sign_extend 32) (currentBit!6339 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!3003 (buf!3448 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6344 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6339 thiss!1634)))))))

(assert (=> d!46737 d!47117))

(declare-fun d!47119 () Bool)

(assert (=> d!47119 (isPrefixOf!0 lt!226623 lt!226623)))

(declare-fun lt!227596 () Unit!9088)

(declare-fun choose!11 (BitStream!5264) Unit!9088)

(assert (=> d!47119 (= lt!227596 (choose!11 lt!226623))))

(assert (=> d!47119 (= (lemmaIsPrefixRefl!0 lt!226623) lt!227596)))

(declare-fun bs!11540 () Bool)

(assert (= bs!11540 d!47119))

(assert (=> bs!11540 m!225009))

(declare-fun m!226043 () Bool)

(assert (=> bs!11540 m!226043))

(assert (=> d!46747 d!47119))

(declare-fun d!47121 () Bool)

(assert (=> d!47121 (isPrefixOf!0 (_2!6888 lt!226290) (_2!6888 lt!226290))))

(declare-fun lt!227597 () Unit!9088)

(assert (=> d!47121 (= lt!227597 (choose!11 (_2!6888 lt!226290)))))

(assert (=> d!47121 (= (lemmaIsPrefixRefl!0 (_2!6888 lt!226290)) lt!227597)))

(declare-fun bs!11541 () Bool)

(assert (= bs!11541 d!47121))

(assert (=> bs!11541 m!225011))

(declare-fun m!226045 () Bool)

(assert (=> bs!11541 m!226045))

(assert (=> d!46747 d!47121))

(declare-fun d!47123 () Bool)

(declare-fun res!122544 () Bool)

(declare-fun e!97658 () Bool)

(assert (=> d!47123 (=> (not res!122544) (not e!97658))))

(assert (=> d!47123 (= res!122544 (= (size!3003 (buf!3448 lt!226623)) (size!3003 (buf!3448 (_2!6888 lt!226295)))))))

(assert (=> d!47123 (= (isPrefixOf!0 lt!226623 (_2!6888 lt!226295)) e!97658)))

(declare-fun b!146488 () Bool)

(declare-fun res!122545 () Bool)

(assert (=> b!146488 (=> (not res!122545) (not e!97658))))

(assert (=> b!146488 (= res!122545 (bvsle (bitIndex!0 (size!3003 (buf!3448 lt!226623)) (currentByte!6344 lt!226623) (currentBit!6339 lt!226623)) (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226295))) (currentByte!6344 (_2!6888 lt!226295)) (currentBit!6339 (_2!6888 lt!226295)))))))

(declare-fun b!146489 () Bool)

(declare-fun e!97657 () Bool)

(assert (=> b!146489 (= e!97658 e!97657)))

(declare-fun res!122543 () Bool)

(assert (=> b!146489 (=> res!122543 e!97657)))

(assert (=> b!146489 (= res!122543 (= (size!3003 (buf!3448 lt!226623)) #b00000000000000000000000000000000))))

(declare-fun b!146490 () Bool)

(assert (=> b!146490 (= e!97657 (arrayBitRangesEq!0 (buf!3448 lt!226623) (buf!3448 (_2!6888 lt!226295)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3003 (buf!3448 lt!226623)) (currentByte!6344 lt!226623) (currentBit!6339 lt!226623))))))

(assert (= (and d!47123 res!122544) b!146488))

(assert (= (and b!146488 res!122545) b!146489))

(assert (= (and b!146489 (not res!122543)) b!146490))

(declare-fun m!226047 () Bool)

(assert (=> b!146488 m!226047))

(assert (=> b!146488 m!224701))

(assert (=> b!146490 m!226047))

(assert (=> b!146490 m!226047))

(declare-fun m!226049 () Bool)

(assert (=> b!146490 m!226049))

(assert (=> d!46747 d!47123))

(declare-fun d!47125 () Bool)

(assert (=> d!47125 (isPrefixOf!0 lt!226623 (_2!6888 lt!226295))))

(declare-fun lt!227598 () Unit!9088)

(assert (=> d!47125 (= lt!227598 (choose!30 lt!226623 (_2!6888 lt!226295) (_2!6888 lt!226295)))))

(assert (=> d!47125 (isPrefixOf!0 lt!226623 (_2!6888 lt!226295))))

(assert (=> d!47125 (= (lemmaIsPrefixTransitive!0 lt!226623 (_2!6888 lt!226295) (_2!6888 lt!226295)) lt!227598)))

(declare-fun bs!11542 () Bool)

(assert (= bs!11542 d!47125))

(assert (=> bs!11542 m!225015))

(declare-fun m!226051 () Bool)

(assert (=> bs!11542 m!226051))

(assert (=> bs!11542 m!225015))

(assert (=> d!46747 d!47125))

(declare-fun d!47127 () Bool)

(declare-fun res!122547 () Bool)

(declare-fun e!97660 () Bool)

(assert (=> d!47127 (=> (not res!122547) (not e!97660))))

(assert (=> d!47127 (= res!122547 (= (size!3003 (buf!3448 (_2!6888 lt!226290))) (size!3003 (buf!3448 (_2!6888 lt!226290)))))))

(assert (=> d!47127 (= (isPrefixOf!0 (_2!6888 lt!226290) (_2!6888 lt!226290)) e!97660)))

(declare-fun b!146491 () Bool)

(declare-fun res!122548 () Bool)

(assert (=> b!146491 (=> (not res!122548) (not e!97660))))

(assert (=> b!146491 (= res!122548 (bvsle (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226290))) (currentByte!6344 (_2!6888 lt!226290)) (currentBit!6339 (_2!6888 lt!226290))) (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226290))) (currentByte!6344 (_2!6888 lt!226290)) (currentBit!6339 (_2!6888 lt!226290)))))))

(declare-fun b!146492 () Bool)

(declare-fun e!97659 () Bool)

(assert (=> b!146492 (= e!97660 e!97659)))

(declare-fun res!122546 () Bool)

(assert (=> b!146492 (=> res!122546 e!97659)))

(assert (=> b!146492 (= res!122546 (= (size!3003 (buf!3448 (_2!6888 lt!226290))) #b00000000000000000000000000000000))))

(declare-fun b!146493 () Bool)

(assert (=> b!146493 (= e!97659 (arrayBitRangesEq!0 (buf!3448 (_2!6888 lt!226290)) (buf!3448 (_2!6888 lt!226290)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226290))) (currentByte!6344 (_2!6888 lt!226290)) (currentBit!6339 (_2!6888 lt!226290)))))))

(assert (= (and d!47127 res!122547) b!146491))

(assert (= (and b!146491 res!122548) b!146492))

(assert (= (and b!146492 (not res!122546)) b!146493))

(assert (=> b!146491 m!224703))

(assert (=> b!146491 m!224703))

(assert (=> b!146493 m!224703))

(assert (=> b!146493 m!224703))

(declare-fun m!226053 () Bool)

(assert (=> b!146493 m!226053))

(assert (=> d!46747 d!47127))

(declare-fun d!47129 () Bool)

(declare-fun res!122550 () Bool)

(declare-fun e!97662 () Bool)

(assert (=> d!47129 (=> (not res!122550) (not e!97662))))

(assert (=> d!47129 (= res!122550 (= (size!3003 (buf!3448 (_2!6888 lt!226295))) (size!3003 (buf!3448 (_2!6888 lt!226295)))))))

(assert (=> d!47129 (= (isPrefixOf!0 (_2!6888 lt!226295) (_2!6888 lt!226295)) e!97662)))

(declare-fun b!146494 () Bool)

(declare-fun res!122551 () Bool)

(assert (=> b!146494 (=> (not res!122551) (not e!97662))))

(assert (=> b!146494 (= res!122551 (bvsle (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226295))) (currentByte!6344 (_2!6888 lt!226295)) (currentBit!6339 (_2!6888 lt!226295))) (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226295))) (currentByte!6344 (_2!6888 lt!226295)) (currentBit!6339 (_2!6888 lt!226295)))))))

(declare-fun b!146495 () Bool)

(declare-fun e!97661 () Bool)

(assert (=> b!146495 (= e!97662 e!97661)))

(declare-fun res!122549 () Bool)

(assert (=> b!146495 (=> res!122549 e!97661)))

(assert (=> b!146495 (= res!122549 (= (size!3003 (buf!3448 (_2!6888 lt!226295))) #b00000000000000000000000000000000))))

(declare-fun b!146496 () Bool)

(assert (=> b!146496 (= e!97661 (arrayBitRangesEq!0 (buf!3448 (_2!6888 lt!226295)) (buf!3448 (_2!6888 lt!226295)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226295))) (currentByte!6344 (_2!6888 lt!226295)) (currentBit!6339 (_2!6888 lt!226295)))))))

(assert (= (and d!47129 res!122550) b!146494))

(assert (= (and b!146494 res!122551) b!146495))

(assert (= (and b!146495 (not res!122549)) b!146496))

(assert (=> b!146494 m!224701))

(assert (=> b!146494 m!224701))

(assert (=> b!146496 m!224701))

(assert (=> b!146496 m!224701))

(declare-fun m!226055 () Bool)

(assert (=> b!146496 m!226055))

(assert (=> d!46747 d!47129))

(declare-fun d!47131 () Bool)

(declare-fun res!122553 () Bool)

(declare-fun e!97664 () Bool)

(assert (=> d!47131 (=> (not res!122553) (not e!97664))))

(assert (=> d!47131 (= res!122553 (= (size!3003 (buf!3448 (_1!6886 lt!226620))) (size!3003 (buf!3448 (_2!6886 lt!226620)))))))

(assert (=> d!47131 (= (isPrefixOf!0 (_1!6886 lt!226620) (_2!6886 lt!226620)) e!97664)))

(declare-fun b!146497 () Bool)

(declare-fun res!122554 () Bool)

(assert (=> b!146497 (=> (not res!122554) (not e!97664))))

(assert (=> b!146497 (= res!122554 (bvsle (bitIndex!0 (size!3003 (buf!3448 (_1!6886 lt!226620))) (currentByte!6344 (_1!6886 lt!226620)) (currentBit!6339 (_1!6886 lt!226620))) (bitIndex!0 (size!3003 (buf!3448 (_2!6886 lt!226620))) (currentByte!6344 (_2!6886 lt!226620)) (currentBit!6339 (_2!6886 lt!226620)))))))

(declare-fun b!146498 () Bool)

(declare-fun e!97663 () Bool)

(assert (=> b!146498 (= e!97664 e!97663)))

(declare-fun res!122552 () Bool)

(assert (=> b!146498 (=> res!122552 e!97663)))

(assert (=> b!146498 (= res!122552 (= (size!3003 (buf!3448 (_1!6886 lt!226620))) #b00000000000000000000000000000000))))

(declare-fun b!146499 () Bool)

(assert (=> b!146499 (= e!97663 (arrayBitRangesEq!0 (buf!3448 (_1!6886 lt!226620)) (buf!3448 (_2!6886 lt!226620)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3003 (buf!3448 (_1!6886 lt!226620))) (currentByte!6344 (_1!6886 lt!226620)) (currentBit!6339 (_1!6886 lt!226620)))))))

(assert (= (and d!47131 res!122553) b!146497))

(assert (= (and b!146497 res!122554) b!146498))

(assert (= (and b!146498 (not res!122552)) b!146499))

(declare-fun m!226057 () Bool)

(assert (=> b!146497 m!226057))

(assert (=> b!146497 m!225945))

(assert (=> b!146499 m!226057))

(assert (=> b!146499 m!226057))

(declare-fun m!226059 () Bool)

(assert (=> b!146499 m!226059))

(assert (=> d!46747 d!47131))

(declare-fun d!47133 () Bool)

(assert (=> d!47133 (isPrefixOf!0 lt!226623 (_2!6888 lt!226295))))

(declare-fun lt!227599 () Unit!9088)

(assert (=> d!47133 (= lt!227599 (choose!30 lt!226623 (_2!6888 lt!226290) (_2!6888 lt!226295)))))

(assert (=> d!47133 (isPrefixOf!0 lt!226623 (_2!6888 lt!226290))))

(assert (=> d!47133 (= (lemmaIsPrefixTransitive!0 lt!226623 (_2!6888 lt!226290) (_2!6888 lt!226295)) lt!227599)))

(declare-fun bs!11543 () Bool)

(assert (= bs!11543 d!47133))

(assert (=> bs!11543 m!225015))

(declare-fun m!226061 () Bool)

(assert (=> bs!11543 m!226061))

(declare-fun m!226063 () Bool)

(assert (=> bs!11543 m!226063))

(assert (=> d!46747 d!47133))

(declare-fun d!47135 () Bool)

(declare-fun res!122556 () Bool)

(declare-fun e!97666 () Bool)

(assert (=> d!47135 (=> (not res!122556) (not e!97666))))

(assert (=> d!47135 (= res!122556 (= (size!3003 (buf!3448 lt!226623)) (size!3003 (buf!3448 lt!226623))))))

(assert (=> d!47135 (= (isPrefixOf!0 lt!226623 lt!226623) e!97666)))

(declare-fun b!146500 () Bool)

(declare-fun res!122557 () Bool)

(assert (=> b!146500 (=> (not res!122557) (not e!97666))))

(assert (=> b!146500 (= res!122557 (bvsle (bitIndex!0 (size!3003 (buf!3448 lt!226623)) (currentByte!6344 lt!226623) (currentBit!6339 lt!226623)) (bitIndex!0 (size!3003 (buf!3448 lt!226623)) (currentByte!6344 lt!226623) (currentBit!6339 lt!226623))))))

(declare-fun b!146501 () Bool)

(declare-fun e!97665 () Bool)

(assert (=> b!146501 (= e!97666 e!97665)))

(declare-fun res!122555 () Bool)

(assert (=> b!146501 (=> res!122555 e!97665)))

(assert (=> b!146501 (= res!122555 (= (size!3003 (buf!3448 lt!226623)) #b00000000000000000000000000000000))))

(declare-fun b!146502 () Bool)

(assert (=> b!146502 (= e!97665 (arrayBitRangesEq!0 (buf!3448 lt!226623) (buf!3448 lt!226623) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3003 (buf!3448 lt!226623)) (currentByte!6344 lt!226623) (currentBit!6339 lt!226623))))))

(assert (= (and d!47135 res!122556) b!146500))

(assert (= (and b!146500 res!122557) b!146501))

(assert (= (and b!146501 (not res!122555)) b!146502))

(assert (=> b!146500 m!226047))

(assert (=> b!146500 m!226047))

(assert (=> b!146502 m!226047))

(assert (=> b!146502 m!226047))

(declare-fun m!226065 () Bool)

(assert (=> b!146502 m!226065))

(assert (=> d!46747 d!47135))

(declare-fun d!47137 () Bool)

(assert (=> d!47137 (isPrefixOf!0 (_2!6888 lt!226295) (_2!6888 lt!226295))))

(declare-fun lt!227600 () Unit!9088)

(assert (=> d!47137 (= lt!227600 (choose!11 (_2!6888 lt!226295)))))

(assert (=> d!47137 (= (lemmaIsPrefixRefl!0 (_2!6888 lt!226295)) lt!227600)))

(declare-fun bs!11544 () Bool)

(assert (= bs!11544 d!47137))

(assert (=> bs!11544 m!225013))

(declare-fun m!226067 () Bool)

(assert (=> bs!11544 m!226067))

(assert (=> d!46747 d!47137))

(assert (=> d!46747 d!46733))

(declare-fun d!47139 () Bool)

(declare-fun res!122559 () Bool)

(declare-fun e!97668 () Bool)

(assert (=> d!47139 (=> (not res!122559) (not e!97668))))

(assert (=> d!47139 (= res!122559 (= (size!3003 (buf!3448 (_1!6886 lt!226763))) (size!3003 (buf!3448 thiss!1634))))))

(assert (=> d!47139 (= (isPrefixOf!0 (_1!6886 lt!226763) thiss!1634) e!97668)))

(declare-fun b!146503 () Bool)

(declare-fun res!122560 () Bool)

(assert (=> b!146503 (=> (not res!122560) (not e!97668))))

(assert (=> b!146503 (= res!122560 (bvsle (bitIndex!0 (size!3003 (buf!3448 (_1!6886 lt!226763))) (currentByte!6344 (_1!6886 lt!226763)) (currentBit!6339 (_1!6886 lt!226763))) (bitIndex!0 (size!3003 (buf!3448 thiss!1634)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634))))))

(declare-fun b!146504 () Bool)

(declare-fun e!97667 () Bool)

(assert (=> b!146504 (= e!97668 e!97667)))

(declare-fun res!122558 () Bool)

(assert (=> b!146504 (=> res!122558 e!97667)))

(assert (=> b!146504 (= res!122558 (= (size!3003 (buf!3448 (_1!6886 lt!226763))) #b00000000000000000000000000000000))))

(declare-fun b!146505 () Bool)

(assert (=> b!146505 (= e!97667 (arrayBitRangesEq!0 (buf!3448 (_1!6886 lt!226763)) (buf!3448 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3003 (buf!3448 (_1!6886 lt!226763))) (currentByte!6344 (_1!6886 lt!226763)) (currentBit!6339 (_1!6886 lt!226763)))))))

(assert (= (and d!47139 res!122559) b!146503))

(assert (= (and b!146503 res!122560) b!146504))

(assert (= (and b!146504 (not res!122558)) b!146505))

(declare-fun m!226069 () Bool)

(assert (=> b!146503 m!226069))

(assert (=> b!146503 m!224711))

(assert (=> b!146505 m!226069))

(assert (=> b!146505 m!226069))

(declare-fun m!226071 () Bool)

(assert (=> b!146505 m!226071))

(assert (=> b!146125 d!47139))

(declare-fun call!1931 () Bool)

(declare-fun c!7936 () Bool)

(declare-fun lt!227630 () (_ BitVec 32))

(declare-fun lt!227621 () tuple2!13082)

(declare-fun bm!1927 () Bool)

(declare-fun lt!227622 () (_ BitVec 32))

(declare-fun lt!227620 () array!6633)

(declare-fun lt!227604 () array!6633)

(assert (=> bm!1927 (= call!1931 (arrayRangesEq!319 (ite c!7936 lt!226292 lt!227620) (ite c!7936 (array!6634 (store (arr!3742 lt!226292) (bvadd #b00000000000000000000000000000001 from!447) (_1!6892 lt!227621)) (size!3003 lt!226292)) lt!227604) (ite c!7936 #b00000000000000000000000000000000 lt!227622) (ite c!7936 (bvadd #b00000000000000000000000000000001 from!447) lt!227630)))))

(declare-fun b!146506 () Bool)

(declare-fun e!97671 () Bool)

(declare-fun lt!227629 () tuple3!566)

(assert (=> b!146506 (= e!97671 (= (select (arr!3742 (_3!350 lt!227629)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6887 (readBytePure!0 (withMovedByteIndex!0 (_1!6886 lt!226293) #b00000000000000000000000000000001)))))))

(assert (=> b!146506 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!3003 (_3!350 lt!227629))))))

(declare-fun bm!1928 () Bool)

(declare-fun call!1932 () (_ BitVec 64))

(assert (=> bm!1928 (= call!1932 (bitIndex!0 (size!3003 (buf!3448 (withMovedByteIndex!0 (_1!6886 lt!226293) #b00000000000000000000000000000001))) (currentByte!6344 (withMovedByteIndex!0 (_1!6886 lt!226293) #b00000000000000000000000000000001)) (currentBit!6339 (withMovedByteIndex!0 (_1!6886 lt!226293) #b00000000000000000000000000000001))))))

(declare-fun lt!227606 () tuple3!566)

(declare-fun call!1930 () Bool)

(declare-fun bm!1929 () Bool)

(assert (=> bm!1929 (= call!1930 (arrayRangesEq!319 lt!226292 (ite c!7936 (_3!350 lt!227606) lt!226292) #b00000000000000000000000000000000 (ite c!7936 (bvadd #b00000000000000000000000000000001 from!447) (size!3003 lt!226292))))))

(declare-fun b!146507 () Bool)

(declare-fun e!97669 () tuple3!566)

(declare-fun lt!227634 () Unit!9088)

(assert (=> b!146507 (= e!97669 (tuple3!567 lt!227634 (_2!6891 lt!227606) (_3!350 lt!227606)))))

(assert (=> b!146507 (= lt!227621 (readByte!0 (withMovedByteIndex!0 (_1!6886 lt!226293) #b00000000000000000000000000000001)))))

(declare-fun lt!227616 () array!6633)

(assert (=> b!146507 (= lt!227616 (array!6634 (store (arr!3742 lt!226292) (bvadd #b00000000000000000000000000000001 from!447) (_1!6892 lt!227621)) (size!3003 lt!226292)))))

(declare-fun lt!227613 () (_ BitVec 64))

(assert (=> b!146507 (= lt!227613 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!227624 () (_ BitVec 32))

(assert (=> b!146507 (= lt!227624 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!227608 () Unit!9088)

(assert (=> b!146507 (= lt!227608 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 (_1!6886 lt!226293) #b00000000000000000000000000000001) (_2!6892 lt!227621) lt!227613 lt!227624))))

(assert (=> b!146507 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6892 lt!227621)))) ((_ sign_extend 32) (currentByte!6344 (_2!6892 lt!227621))) ((_ sign_extend 32) (currentBit!6339 (_2!6892 lt!227621))) (bvsub lt!227624 ((_ extract 31 0) (bvsdiv (bvadd lt!227613 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!227627 () Unit!9088)

(assert (=> b!146507 (= lt!227627 lt!227608)))

(assert (=> b!146507 (= lt!227606 (readByteArrayLoop!0 (_2!6892 lt!227621) lt!227616 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!146507 (= (bitIndex!0 (size!3003 (buf!3448 (_2!6892 lt!227621))) (currentByte!6344 (_2!6892 lt!227621)) (currentBit!6339 (_2!6892 lt!227621))) (bvadd call!1932 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!227602 () Unit!9088)

(declare-fun Unit!9163 () Unit!9088)

(assert (=> b!146507 (= lt!227602 Unit!9163)))

(assert (=> b!146507 (= (bvadd (bitIndex!0 (size!3003 (buf!3448 (_2!6892 lt!227621))) (currentByte!6344 (_2!6892 lt!227621)) (currentBit!6339 (_2!6892 lt!227621))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3003 (buf!3448 (_2!6891 lt!227606))) (currentByte!6344 (_2!6891 lt!227606)) (currentBit!6339 (_2!6891 lt!227606))))))

(declare-fun lt!227611 () Unit!9088)

(declare-fun Unit!9164 () Unit!9088)

(assert (=> b!146507 (= lt!227611 Unit!9164)))

(assert (=> b!146507 (= (bvadd call!1932 (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3003 (buf!3448 (_2!6891 lt!227606))) (currentByte!6344 (_2!6891 lt!227606)) (currentBit!6339 (_2!6891 lt!227606))))))

(declare-fun lt!227618 () Unit!9088)

(declare-fun Unit!9165 () Unit!9088)

(assert (=> b!146507 (= lt!227618 Unit!9165)))

(assert (=> b!146507 (and (= (buf!3448 (withMovedByteIndex!0 (_1!6886 lt!226293) #b00000000000000000000000000000001)) (buf!3448 (_2!6891 lt!227606))) (= (size!3003 lt!226292) (size!3003 (_3!350 lt!227606))))))

(declare-fun lt!227625 () Unit!9088)

(declare-fun Unit!9166 () Unit!9088)

(assert (=> b!146507 (= lt!227625 Unit!9166)))

(declare-fun lt!227626 () Unit!9088)

(assert (=> b!146507 (= lt!227626 (arrayUpdatedAtPrefixLemma!11 lt!226292 (bvadd #b00000000000000000000000000000001 from!447) (_1!6892 lt!227621)))))

(assert (=> b!146507 call!1931))

(declare-fun lt!227635 () Unit!9088)

(assert (=> b!146507 (= lt!227635 lt!227626)))

(declare-fun lt!227614 () (_ BitVec 32))

(assert (=> b!146507 (= lt!227614 #b00000000000000000000000000000000)))

(declare-fun lt!227628 () Unit!9088)

(assert (=> b!146507 (= lt!227628 (arrayRangesEqTransitive!51 lt!226292 lt!227616 (_3!350 lt!227606) lt!227614 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!146507 (arrayRangesEq!319 lt!226292 (_3!350 lt!227606) lt!227614 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!227631 () Unit!9088)

(assert (=> b!146507 (= lt!227631 lt!227628)))

(assert (=> b!146507 call!1930))

(declare-fun lt!227605 () Unit!9088)

(declare-fun Unit!9167 () Unit!9088)

(assert (=> b!146507 (= lt!227605 Unit!9167)))

(declare-fun lt!227623 () Unit!9088)

(assert (=> b!146507 (= lt!227623 (arrayRangesEqImpliesEq!11 lt!227616 (_3!350 lt!227606) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!146507 (= (select (store (arr!3742 lt!226292) (bvadd #b00000000000000000000000000000001 from!447) (_1!6892 lt!227621)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3742 (_3!350 lt!227606)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!227632 () Unit!9088)

(assert (=> b!146507 (= lt!227632 lt!227623)))

(declare-fun lt!227612 () Bool)

(assert (=> b!146507 (= lt!227612 (= (select (arr!3742 (_3!350 lt!227606)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6892 lt!227621)))))

(declare-fun Unit!9168 () Unit!9088)

(assert (=> b!146507 (= lt!227634 Unit!9168)))

(assert (=> b!146507 lt!227612))

(declare-fun e!97670 () Bool)

(declare-fun b!146508 () Bool)

(assert (=> b!146508 (= e!97670 (arrayRangesEq!319 lt!226292 (_3!350 lt!227629) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!227603 () Unit!9088)

(declare-fun b!146509 () Bool)

(assert (=> b!146509 (= e!97669 (tuple3!567 lt!227603 (withMovedByteIndex!0 (_1!6886 lt!226293) #b00000000000000000000000000000001) lt!226292))))

(assert (=> b!146509 (= call!1932 call!1932)))

(declare-fun lt!227633 () Unit!9088)

(declare-fun Unit!9169 () Unit!9088)

(assert (=> b!146509 (= lt!227633 Unit!9169)))

(declare-fun lt!227601 () Unit!9088)

(assert (=> b!146509 (= lt!227601 (arrayRangesEqReflexiveLemma!11 lt!226292))))

(assert (=> b!146509 call!1930))

(declare-fun lt!227609 () Unit!9088)

(assert (=> b!146509 (= lt!227609 lt!227601)))

(assert (=> b!146509 (= lt!227620 lt!226292)))

(assert (=> b!146509 (= lt!227604 lt!226292)))

(declare-fun lt!227615 () (_ BitVec 32))

(assert (=> b!146509 (= lt!227615 #b00000000000000000000000000000000)))

(declare-fun lt!227610 () (_ BitVec 32))

(assert (=> b!146509 (= lt!227610 (size!3003 lt!226292))))

(assert (=> b!146509 (= lt!227622 #b00000000000000000000000000000000)))

(assert (=> b!146509 (= lt!227630 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!146509 (= lt!227603 (arrayRangesEqSlicedLemma!11 lt!227620 lt!227604 lt!227615 lt!227610 lt!227622 lt!227630))))

(assert (=> b!146509 call!1931))

(declare-fun b!146510 () Bool)

(declare-fun res!122561 () Bool)

(assert (=> b!146510 (=> (not res!122561) (not e!97670))))

(assert (=> b!146510 (= res!122561 (and (= (buf!3448 (withMovedByteIndex!0 (_1!6886 lt!226293) #b00000000000000000000000000000001)) (buf!3448 (_2!6891 lt!227629))) (= (size!3003 lt!226292) (size!3003 (_3!350 lt!227629)))))))

(declare-fun d!47141 () Bool)

(assert (=> d!47141 e!97671))

(declare-fun res!122562 () Bool)

(assert (=> d!47141 (=> res!122562 e!97671)))

(assert (=> d!47141 (= res!122562 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!227617 () Bool)

(assert (=> d!47141 (= lt!227617 e!97670)))

(declare-fun res!122563 () Bool)

(assert (=> d!47141 (=> (not res!122563) (not e!97670))))

(declare-fun lt!227619 () (_ BitVec 64))

(declare-fun lt!227636 () (_ BitVec 64))

(assert (=> d!47141 (= res!122563 (= (bvadd lt!227636 lt!227619) (bitIndex!0 (size!3003 (buf!3448 (_2!6891 lt!227629))) (currentByte!6344 (_2!6891 lt!227629)) (currentBit!6339 (_2!6891 lt!227629)))))))

(assert (=> d!47141 (or (not (= (bvand lt!227636 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!227619 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!227636 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!227636 lt!227619) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!227607 () (_ BitVec 64))

(assert (=> d!47141 (= lt!227619 (bvmul lt!227607 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!47141 (or (= lt!227607 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!227607 #b0000000000000000000000000000000000000000000000000000000000001000) lt!227607)))))

(assert (=> d!47141 (= lt!227607 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!47141 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!47141 (= lt!227636 (bitIndex!0 (size!3003 (buf!3448 (withMovedByteIndex!0 (_1!6886 lt!226293) #b00000000000000000000000000000001))) (currentByte!6344 (withMovedByteIndex!0 (_1!6886 lt!226293) #b00000000000000000000000000000001)) (currentBit!6339 (withMovedByteIndex!0 (_1!6886 lt!226293) #b00000000000000000000000000000001))))))

(assert (=> d!47141 (= lt!227629 e!97669)))

(assert (=> d!47141 (= c!7936 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!47141 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3003 lt!226292)))))

(assert (=> d!47141 (= (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6886 lt!226293) #b00000000000000000000000000000001) lt!226292 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!227629)))

(assert (= (and d!47141 c!7936) b!146507))

(assert (= (and d!47141 (not c!7936)) b!146509))

(assert (= (or b!146507 b!146509) bm!1927))

(assert (= (or b!146507 b!146509) bm!1929))

(assert (= (or b!146507 b!146509) bm!1928))

(assert (= (and d!47141 res!122563) b!146510))

(assert (= (and b!146510 res!122561) b!146508))

(assert (= (and d!47141 (not res!122562)) b!146506))

(declare-fun m!226073 () Bool)

(assert (=> bm!1928 m!226073))

(declare-fun m!226075 () Bool)

(assert (=> bm!1929 m!226075))

(declare-fun m!226077 () Bool)

(assert (=> b!146509 m!226077))

(declare-fun m!226079 () Bool)

(assert (=> b!146509 m!226079))

(declare-fun m!226081 () Bool)

(assert (=> b!146506 m!226081))

(assert (=> b!146506 m!224759))

(declare-fun m!226083 () Bool)

(assert (=> b!146506 m!226083))

(declare-fun m!226085 () Bool)

(assert (=> b!146508 m!226085))

(declare-fun m!226087 () Bool)

(assert (=> bm!1927 m!226087))

(declare-fun m!226089 () Bool)

(assert (=> bm!1927 m!226089))

(declare-fun m!226091 () Bool)

(assert (=> b!146507 m!226091))

(assert (=> b!146507 m!226087))

(declare-fun m!226093 () Bool)

(assert (=> b!146507 m!226093))

(declare-fun m!226095 () Bool)

(assert (=> b!146507 m!226095))

(assert (=> b!146507 m!224759))

(declare-fun m!226097 () Bool)

(assert (=> b!146507 m!226097))

(declare-fun m!226099 () Bool)

(assert (=> b!146507 m!226099))

(declare-fun m!226101 () Bool)

(assert (=> b!146507 m!226101))

(assert (=> b!146507 m!224759))

(declare-fun m!226103 () Bool)

(assert (=> b!146507 m!226103))

(declare-fun m!226105 () Bool)

(assert (=> b!146507 m!226105))

(declare-fun m!226107 () Bool)

(assert (=> b!146507 m!226107))

(declare-fun m!226109 () Bool)

(assert (=> b!146507 m!226109))

(declare-fun m!226111 () Bool)

(assert (=> b!146507 m!226111))

(declare-fun m!226113 () Bool)

(assert (=> b!146507 m!226113))

(declare-fun m!226115 () Bool)

(assert (=> d!47141 m!226115))

(assert (=> d!47141 m!226073))

(assert (=> d!46793 d!47141))

(assert (=> d!46775 d!46795))

(declare-fun d!47143 () Bool)

(assert (=> d!47143 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226295)))) ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226290))) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226290))) lt!226285)))

(assert (=> d!47143 true))

(declare-fun _$5!66 () Unit!9088)

(assert (=> d!47143 (= (choose!26 (_2!6888 lt!226290) (buf!3448 (_2!6888 lt!226295)) lt!226285 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 (_2!6888 lt!226290)) (currentBit!6339 (_2!6888 lt!226290)))) _$5!66)))

(declare-fun bs!11545 () Bool)

(assert (= bs!11545 d!47143))

(assert (=> bs!11545 m!224733))

(assert (=> d!46775 d!47143))

(declare-fun d!47145 () Bool)

(declare-fun lt!227637 () tuple2!13082)

(assert (=> d!47145 (= lt!227637 (readByte!0 (_1!6886 lt!226695)))))

(assert (=> d!47145 (= (readBytePure!0 (_1!6886 lt!226695)) (tuple2!13077 (_2!6892 lt!227637) (_1!6892 lt!227637)))))

(declare-fun bs!11546 () Bool)

(assert (= bs!11546 d!47145))

(declare-fun m!226117 () Bool)

(assert (=> bs!11546 m!226117))

(assert (=> b!146098 d!47145))

(declare-fun b!146511 () Bool)

(declare-fun e!97672 () Unit!9088)

(declare-fun lt!227650 () Unit!9088)

(assert (=> b!146511 (= e!97672 lt!227650)))

(declare-fun lt!227639 () (_ BitVec 64))

(assert (=> b!146511 (= lt!227639 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!227647 () (_ BitVec 64))

(assert (=> b!146511 (= lt!227647 (bitIndex!0 (size!3003 (buf!3448 thiss!1634)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634)))))

(assert (=> b!146511 (= lt!227650 (arrayBitRangesEqSymmetric!0 (buf!3448 thiss!1634) (buf!3448 (_2!6888 lt!226696)) lt!227639 lt!227647))))

(assert (=> b!146511 (arrayBitRangesEq!0 (buf!3448 (_2!6888 lt!226696)) (buf!3448 thiss!1634) lt!227639 lt!227647)))

(declare-fun d!47147 () Bool)

(declare-fun e!97673 () Bool)

(assert (=> d!47147 e!97673))

(declare-fun res!122566 () Bool)

(assert (=> d!47147 (=> (not res!122566) (not e!97673))))

(declare-fun lt!227643 () tuple2!13074)

(assert (=> d!47147 (= res!122566 (isPrefixOf!0 (_1!6886 lt!227643) (_2!6886 lt!227643)))))

(declare-fun lt!227646 () BitStream!5264)

(assert (=> d!47147 (= lt!227643 (tuple2!13075 lt!227646 (_2!6888 lt!226696)))))

(declare-fun lt!227655 () Unit!9088)

(declare-fun lt!227638 () Unit!9088)

(assert (=> d!47147 (= lt!227655 lt!227638)))

(assert (=> d!47147 (isPrefixOf!0 lt!227646 (_2!6888 lt!226696))))

(assert (=> d!47147 (= lt!227638 (lemmaIsPrefixTransitive!0 lt!227646 (_2!6888 lt!226696) (_2!6888 lt!226696)))))

(declare-fun lt!227657 () Unit!9088)

(declare-fun lt!227649 () Unit!9088)

(assert (=> d!47147 (= lt!227657 lt!227649)))

(assert (=> d!47147 (isPrefixOf!0 lt!227646 (_2!6888 lt!226696))))

(assert (=> d!47147 (= lt!227649 (lemmaIsPrefixTransitive!0 lt!227646 thiss!1634 (_2!6888 lt!226696)))))

(declare-fun lt!227642 () Unit!9088)

(assert (=> d!47147 (= lt!227642 e!97672)))

(declare-fun c!7937 () Bool)

(assert (=> d!47147 (= c!7937 (not (= (size!3003 (buf!3448 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!227651 () Unit!9088)

(declare-fun lt!227645 () Unit!9088)

(assert (=> d!47147 (= lt!227651 lt!227645)))

(assert (=> d!47147 (isPrefixOf!0 (_2!6888 lt!226696) (_2!6888 lt!226696))))

(assert (=> d!47147 (= lt!227645 (lemmaIsPrefixRefl!0 (_2!6888 lt!226696)))))

(declare-fun lt!227654 () Unit!9088)

(declare-fun lt!227653 () Unit!9088)

(assert (=> d!47147 (= lt!227654 lt!227653)))

(assert (=> d!47147 (= lt!227653 (lemmaIsPrefixRefl!0 (_2!6888 lt!226696)))))

(declare-fun lt!227640 () Unit!9088)

(declare-fun lt!227652 () Unit!9088)

(assert (=> d!47147 (= lt!227640 lt!227652)))

(assert (=> d!47147 (isPrefixOf!0 lt!227646 lt!227646)))

(assert (=> d!47147 (= lt!227652 (lemmaIsPrefixRefl!0 lt!227646))))

(declare-fun lt!227656 () Unit!9088)

(declare-fun lt!227648 () Unit!9088)

(assert (=> d!47147 (= lt!227656 lt!227648)))

(assert (=> d!47147 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!47147 (= lt!227648 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!47147 (= lt!227646 (BitStream!5265 (buf!3448 (_2!6888 lt!226696)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634)))))

(assert (=> d!47147 (isPrefixOf!0 thiss!1634 (_2!6888 lt!226696))))

(assert (=> d!47147 (= (reader!0 thiss!1634 (_2!6888 lt!226696)) lt!227643)))

(declare-fun b!146512 () Bool)

(declare-fun res!122565 () Bool)

(assert (=> b!146512 (=> (not res!122565) (not e!97673))))

(assert (=> b!146512 (= res!122565 (isPrefixOf!0 (_2!6886 lt!227643) (_2!6888 lt!226696)))))

(declare-fun b!146513 () Bool)

(declare-fun res!122564 () Bool)

(assert (=> b!146513 (=> (not res!122564) (not e!97673))))

(assert (=> b!146513 (= res!122564 (isPrefixOf!0 (_1!6886 lt!227643) thiss!1634))))

(declare-fun lt!227641 () (_ BitVec 64))

(declare-fun b!146514 () Bool)

(declare-fun lt!227644 () (_ BitVec 64))

(assert (=> b!146514 (= e!97673 (= (_1!6886 lt!227643) (withMovedBitIndex!0 (_2!6886 lt!227643) (bvsub lt!227641 lt!227644))))))

(assert (=> b!146514 (or (= (bvand lt!227641 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!227644 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!227641 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!227641 lt!227644) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146514 (= lt!227644 (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226696))) (currentByte!6344 (_2!6888 lt!226696)) (currentBit!6339 (_2!6888 lt!226696))))))

(assert (=> b!146514 (= lt!227641 (bitIndex!0 (size!3003 (buf!3448 thiss!1634)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634)))))

(declare-fun b!146515 () Bool)

(declare-fun Unit!9170 () Unit!9088)

(assert (=> b!146515 (= e!97672 Unit!9170)))

(assert (= (and d!47147 c!7937) b!146511))

(assert (= (and d!47147 (not c!7937)) b!146515))

(assert (= (and d!47147 res!122566) b!146513))

(assert (= (and b!146513 res!122564) b!146512))

(assert (= (and b!146512 res!122565) b!146514))

(assert (=> b!146511 m!224711))

(declare-fun m!226119 () Bool)

(assert (=> b!146511 m!226119))

(declare-fun m!226121 () Bool)

(assert (=> b!146511 m!226121))

(declare-fun m!226123 () Bool)

(assert (=> d!47147 m!226123))

(assert (=> d!47147 m!225049))

(declare-fun m!226125 () Bool)

(assert (=> d!47147 m!226125))

(declare-fun m!226127 () Bool)

(assert (=> d!47147 m!226127))

(assert (=> d!47147 m!225053))

(declare-fun m!226129 () Bool)

(assert (=> d!47147 m!226129))

(declare-fun m!226131 () Bool)

(assert (=> d!47147 m!226131))

(declare-fun m!226133 () Bool)

(assert (=> d!47147 m!226133))

(declare-fun m!226135 () Bool)

(assert (=> d!47147 m!226135))

(declare-fun m!226137 () Bool)

(assert (=> d!47147 m!226137))

(assert (=> d!47147 m!225089))

(declare-fun m!226139 () Bool)

(assert (=> b!146513 m!226139))

(declare-fun m!226141 () Bool)

(assert (=> b!146512 m!226141))

(declare-fun m!226143 () Bool)

(assert (=> b!146514 m!226143))

(assert (=> b!146514 m!225087))

(assert (=> b!146514 m!224711))

(assert (=> b!146098 d!47147))

(declare-fun d!47149 () Bool)

(declare-fun res!122568 () Bool)

(declare-fun e!97675 () Bool)

(assert (=> d!47149 (=> (not res!122568) (not e!97675))))

(assert (=> d!47149 (= res!122568 (= (size!3003 (buf!3448 (_2!6886 lt!226655))) (size!3003 (buf!3448 (_2!6888 lt!226295)))))))

(assert (=> d!47149 (= (isPrefixOf!0 (_2!6886 lt!226655) (_2!6888 lt!226295)) e!97675)))

(declare-fun b!146516 () Bool)

(declare-fun res!122569 () Bool)

(assert (=> b!146516 (=> (not res!122569) (not e!97675))))

(assert (=> b!146516 (= res!122569 (bvsle (bitIndex!0 (size!3003 (buf!3448 (_2!6886 lt!226655))) (currentByte!6344 (_2!6886 lt!226655)) (currentBit!6339 (_2!6886 lt!226655))) (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226295))) (currentByte!6344 (_2!6888 lt!226295)) (currentBit!6339 (_2!6888 lt!226295)))))))

(declare-fun b!146517 () Bool)

(declare-fun e!97674 () Bool)

(assert (=> b!146517 (= e!97675 e!97674)))

(declare-fun res!122567 () Bool)

(assert (=> b!146517 (=> res!122567 e!97674)))

(assert (=> b!146517 (= res!122567 (= (size!3003 (buf!3448 (_2!6886 lt!226655))) #b00000000000000000000000000000000))))

(declare-fun b!146518 () Bool)

(assert (=> b!146518 (= e!97674 (arrayBitRangesEq!0 (buf!3448 (_2!6886 lt!226655)) (buf!3448 (_2!6888 lt!226295)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3003 (buf!3448 (_2!6886 lt!226655))) (currentByte!6344 (_2!6886 lt!226655)) (currentBit!6339 (_2!6886 lt!226655)))))))

(assert (= (and d!47149 res!122568) b!146516))

(assert (= (and b!146516 res!122569) b!146517))

(assert (= (and b!146517 (not res!122567)) b!146518))

(declare-fun m!226145 () Bool)

(assert (=> b!146516 m!226145))

(assert (=> b!146516 m!224701))

(assert (=> b!146518 m!226145))

(assert (=> b!146518 m!226145))

(declare-fun m!226147 () Bool)

(assert (=> b!146518 m!226147))

(assert (=> b!146084 d!47149))

(assert (=> d!46795 d!47111))

(assert (=> b!146048 d!46729))

(assert (=> b!146048 d!46727))

(declare-fun d!47151 () Bool)

(declare-fun e!97676 () Bool)

(assert (=> d!47151 e!97676))

(declare-fun res!122570 () Bool)

(assert (=> d!47151 (=> (not res!122570) (not e!97676))))

(declare-fun lt!227661 () (_ BitVec 64))

(declare-fun lt!227660 () (_ BitVec 64))

(declare-fun lt!227659 () (_ BitVec 64))

(assert (=> d!47151 (= res!122570 (= lt!227660 (bvsub lt!227661 lt!227659)))))

(assert (=> d!47151 (or (= (bvand lt!227661 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!227659 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!227661 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!227661 lt!227659) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47151 (= lt!227659 (remainingBits!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226696)))) ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226696))) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226696)))))))

(declare-fun lt!227662 () (_ BitVec 64))

(declare-fun lt!227663 () (_ BitVec 64))

(assert (=> d!47151 (= lt!227661 (bvmul lt!227662 lt!227663))))

(assert (=> d!47151 (or (= lt!227662 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!227663 (bvsdiv (bvmul lt!227662 lt!227663) lt!227662)))))

(assert (=> d!47151 (= lt!227663 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47151 (= lt!227662 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226696)))))))

(assert (=> d!47151 (= lt!227660 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226696))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226696)))))))

(assert (=> d!47151 (invariant!0 (currentBit!6339 (_2!6888 lt!226696)) (currentByte!6344 (_2!6888 lt!226696)) (size!3003 (buf!3448 (_2!6888 lt!226696))))))

(assert (=> d!47151 (= (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226696))) (currentByte!6344 (_2!6888 lt!226696)) (currentBit!6339 (_2!6888 lt!226696))) lt!227660)))

(declare-fun b!146519 () Bool)

(declare-fun res!122571 () Bool)

(assert (=> b!146519 (=> (not res!122571) (not e!97676))))

(assert (=> b!146519 (= res!122571 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!227660))))

(declare-fun b!146520 () Bool)

(declare-fun lt!227658 () (_ BitVec 64))

(assert (=> b!146520 (= e!97676 (bvsle lt!227660 (bvmul lt!227658 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146520 (or (= lt!227658 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!227658 #b0000000000000000000000000000000000000000000000000000000000001000) lt!227658)))))

(assert (=> b!146520 (= lt!227658 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226696)))))))

(assert (= (and d!47151 res!122570) b!146519))

(assert (= (and b!146519 res!122571) b!146520))

(declare-fun m!226149 () Bool)

(assert (=> d!47151 m!226149))

(declare-fun m!226151 () Bool)

(assert (=> d!47151 m!226151))

(assert (=> b!146096 d!47151))

(assert (=> b!146096 d!46739))

(declare-fun lt!227669 () tuple2!13076)

(declare-fun b!146532 () Bool)

(declare-fun lt!227668 () tuple2!13074)

(declare-fun e!97684 () Bool)

(assert (=> b!146532 (= e!97684 (and (= (_2!6887 lt!227669) (select (arr!3742 arr!237) from!447)) (= (_1!6887 lt!227669) (_2!6886 lt!227668))))))

(assert (=> b!146532 (= lt!227669 (readBytePure!0 (_1!6886 lt!227668)))))

(declare-fun _$37!41 () tuple2!13078)

(assert (=> b!146532 (= lt!227668 (reader!0 thiss!1634 (_2!6888 _$37!41)))))

(declare-fun b!146530 () Bool)

(declare-fun res!122579 () Bool)

(assert (=> b!146530 (=> (not res!122579) (not e!97684))))

(assert (=> b!146530 (= res!122579 (= (bitIndex!0 (size!3003 (buf!3448 (_2!6888 _$37!41))) (currentByte!6344 (_2!6888 _$37!41)) (currentBit!6339 (_2!6888 _$37!41))) (bvadd (bitIndex!0 (size!3003 (buf!3448 thiss!1634)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!146529 () Bool)

(declare-fun e!97685 () Bool)

(assert (=> b!146529 (= e!97685 (array_inv!2792 (buf!3448 (_2!6888 _$37!41))))))

(declare-fun b!146531 () Bool)

(declare-fun res!122580 () Bool)

(assert (=> b!146531 (=> (not res!122580) (not e!97684))))

(assert (=> b!146531 (= res!122580 (isPrefixOf!0 thiss!1634 (_2!6888 _$37!41)))))

(declare-fun d!47153 () Bool)

(assert (=> d!47153 e!97684))

(declare-fun res!122578 () Bool)

(assert (=> d!47153 (=> (not res!122578) (not e!97684))))

(assert (=> d!47153 (= res!122578 (= (size!3003 (buf!3448 thiss!1634)) (size!3003 (buf!3448 (_2!6888 _$37!41)))))))

(assert (=> d!47153 (and (inv!12 (_2!6888 _$37!41)) e!97685)))

(assert (=> d!47153 (= (choose!6 thiss!1634 (select (arr!3742 arr!237) from!447)) _$37!41)))

(assert (= d!47153 b!146529))

(assert (= (and d!47153 res!122578) b!146530))

(assert (= (and b!146530 res!122579) b!146531))

(assert (= (and b!146531 res!122580) b!146532))

(declare-fun m!226153 () Bool)

(assert (=> d!47153 m!226153))

(declare-fun m!226155 () Bool)

(assert (=> b!146532 m!226155))

(declare-fun m!226157 () Bool)

(assert (=> b!146532 m!226157))

(declare-fun m!226159 () Bool)

(assert (=> b!146531 m!226159))

(declare-fun m!226161 () Bool)

(assert (=> b!146530 m!226161))

(assert (=> b!146530 m!224711))

(declare-fun m!226163 () Bool)

(assert (=> b!146529 m!226163))

(assert (=> d!46777 d!47153))

(declare-fun d!47155 () Bool)

(assert (=> d!47155 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3003 (buf!3448 thiss!1634))) ((_ sign_extend 32) (currentByte!6344 thiss!1634)) ((_ sign_extend 32) (currentBit!6339 thiss!1634))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3003 (buf!3448 thiss!1634))) ((_ sign_extend 32) (currentByte!6344 thiss!1634)) ((_ sign_extend 32) (currentBit!6339 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!11547 () Bool)

(assert (= bs!11547 d!47155))

(assert (=> bs!11547 m!224991))

(assert (=> d!46777 d!47155))

(declare-fun d!47157 () Bool)

(declare-fun res!122582 () Bool)

(declare-fun e!97687 () Bool)

(assert (=> d!47157 (=> (not res!122582) (not e!97687))))

(assert (=> d!47157 (= res!122582 (= (size!3003 (buf!3448 (_2!6886 lt!226620))) (size!3003 (buf!3448 (_2!6888 lt!226295)))))))

(assert (=> d!47157 (= (isPrefixOf!0 (_2!6886 lt!226620) (_2!6888 lt!226295)) e!97687)))

(declare-fun b!146533 () Bool)

(declare-fun res!122583 () Bool)

(assert (=> b!146533 (=> (not res!122583) (not e!97687))))

(assert (=> b!146533 (= res!122583 (bvsle (bitIndex!0 (size!3003 (buf!3448 (_2!6886 lt!226620))) (currentByte!6344 (_2!6886 lt!226620)) (currentBit!6339 (_2!6886 lt!226620))) (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226295))) (currentByte!6344 (_2!6888 lt!226295)) (currentBit!6339 (_2!6888 lt!226295)))))))

(declare-fun b!146534 () Bool)

(declare-fun e!97686 () Bool)

(assert (=> b!146534 (= e!97687 e!97686)))

(declare-fun res!122581 () Bool)

(assert (=> b!146534 (=> res!122581 e!97686)))

(assert (=> b!146534 (= res!122581 (= (size!3003 (buf!3448 (_2!6886 lt!226620))) #b00000000000000000000000000000000))))

(declare-fun b!146535 () Bool)

(assert (=> b!146535 (= e!97686 (arrayBitRangesEq!0 (buf!3448 (_2!6886 lt!226620)) (buf!3448 (_2!6888 lt!226295)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3003 (buf!3448 (_2!6886 lt!226620))) (currentByte!6344 (_2!6886 lt!226620)) (currentBit!6339 (_2!6886 lt!226620)))))))

(assert (= (and d!47157 res!122582) b!146533))

(assert (= (and b!146533 res!122583) b!146534))

(assert (= (and b!146534 (not res!122581)) b!146535))

(assert (=> b!146533 m!225945))

(assert (=> b!146533 m!224701))

(assert (=> b!146535 m!225945))

(assert (=> b!146535 m!225945))

(declare-fun m!226165 () Bool)

(assert (=> b!146535 m!226165))

(assert (=> b!146070 d!47157))

(declare-fun d!47159 () Bool)

(declare-fun e!97688 () Bool)

(assert (=> d!47159 e!97688))

(declare-fun res!122584 () Bool)

(assert (=> d!47159 (=> (not res!122584) (not e!97688))))

(declare-fun lt!227671 () (_ BitVec 64))

(declare-fun lt!227670 () BitStream!5264)

(assert (=> d!47159 (= res!122584 (= (bvadd lt!227671 (bvsub lt!226653 lt!226656)) (bitIndex!0 (size!3003 (buf!3448 lt!227670)) (currentByte!6344 lt!227670) (currentBit!6339 lt!227670))))))

(assert (=> d!47159 (or (not (= (bvand lt!227671 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226653 lt!226656) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!227671 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!227671 (bvsub lt!226653 lt!226656)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47159 (= lt!227671 (bitIndex!0 (size!3003 (buf!3448 (_2!6886 lt!226655))) (currentByte!6344 (_2!6886 lt!226655)) (currentBit!6339 (_2!6886 lt!226655))))))

(assert (=> d!47159 (= lt!227670 (_2!6888 (moveBitIndex!0 (_2!6886 lt!226655) (bvsub lt!226653 lt!226656))))))

(assert (=> d!47159 (moveBitIndexPrecond!0 (_2!6886 lt!226655) (bvsub lt!226653 lt!226656))))

(assert (=> d!47159 (= (withMovedBitIndex!0 (_2!6886 lt!226655) (bvsub lt!226653 lt!226656)) lt!227670)))

(declare-fun b!146536 () Bool)

(assert (=> b!146536 (= e!97688 (= (size!3003 (buf!3448 (_2!6886 lt!226655))) (size!3003 (buf!3448 lt!227670))))))

(assert (= (and d!47159 res!122584) b!146536))

(declare-fun m!226167 () Bool)

(assert (=> d!47159 m!226167))

(assert (=> d!47159 m!226145))

(declare-fun m!226169 () Bool)

(assert (=> d!47159 m!226169))

(declare-fun m!226171 () Bool)

(assert (=> d!47159 m!226171))

(assert (=> b!146086 d!47159))

(assert (=> b!146086 d!46727))

(assert (=> b!146086 d!46739))

(assert (=> d!46745 d!46743))

(declare-fun d!47161 () Bool)

(assert (=> d!47161 (validate_offset_bits!1 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226295)))) ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226290))) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226290))) lt!226279)))

(assert (=> d!47161 true))

(declare-fun _$6!310 () Unit!9088)

(assert (=> d!47161 (= (choose!9 (_2!6888 lt!226290) (buf!3448 (_2!6888 lt!226295)) lt!226279 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 (_2!6888 lt!226290)) (currentBit!6339 (_2!6888 lt!226290)))) _$6!310)))

(declare-fun bs!11548 () Bool)

(assert (= bs!11548 d!47161))

(assert (=> bs!11548 m!224773))

(assert (=> d!46745 d!47161))

(declare-fun d!47163 () Bool)

(declare-fun res!122585 () Bool)

(declare-fun e!97689 () Bool)

(assert (=> d!47163 (=> res!122585 e!97689)))

(assert (=> d!47163 (= res!122585 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!47163 (= (arrayRangesEq!319 (_2!6885 lt!226286) (_2!6885 lt!226281) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!97689)))

(declare-fun b!146537 () Bool)

(declare-fun e!97690 () Bool)

(assert (=> b!146537 (= e!97689 e!97690)))

(declare-fun res!122586 () Bool)

(assert (=> b!146537 (=> (not res!122586) (not e!97690))))

(assert (=> b!146537 (= res!122586 (= (select (arr!3742 (_2!6885 lt!226286)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3742 (_2!6885 lt!226281)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!146538 () Bool)

(assert (=> b!146538 (= e!97690 (arrayRangesEq!319 (_2!6885 lt!226286) (_2!6885 lt!226281) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!47163 (not res!122585)) b!146537))

(assert (= (and b!146537 res!122586) b!146538))

(declare-fun m!226173 () Bool)

(assert (=> b!146537 m!226173))

(declare-fun m!226175 () Bool)

(assert (=> b!146537 m!226175))

(declare-fun m!226177 () Bool)

(assert (=> b!146538 m!226177))

(assert (=> b!146117 d!47163))

(assert (=> d!46753 d!46806))

(declare-fun b!146553 () Bool)

(declare-fun res!122601 () Bool)

(declare-fun lt!227680 () (_ BitVec 32))

(assert (=> b!146553 (= res!122601 (= lt!227680 #b00000000000000000000000000000000))))

(declare-fun e!97708 () Bool)

(assert (=> b!146553 (=> res!122601 e!97708)))

(declare-fun e!97706 () Bool)

(assert (=> b!146553 (= e!97706 e!97708)))

(declare-fun b!146554 () Bool)

(declare-fun call!1935 () Bool)

(assert (=> b!146554 (= e!97708 call!1935)))

(declare-fun b!146555 () Bool)

(declare-fun e!97705 () Bool)

(declare-fun e!97707 () Bool)

(assert (=> b!146555 (= e!97705 e!97707)))

(declare-fun res!122597 () Bool)

(assert (=> b!146555 (=> (not res!122597) (not e!97707))))

(declare-fun e!97703 () Bool)

(assert (=> b!146555 (= res!122597 e!97703)))

(declare-fun res!122600 () Bool)

(assert (=> b!146555 (=> res!122600 e!97703)))

(declare-datatypes ((tuple4!136 0))(
  ( (tuple4!137 (_1!6898 (_ BitVec 32)) (_2!6898 (_ BitVec 32)) (_3!353 (_ BitVec 32)) (_4!68 (_ BitVec 32))) )
))
(declare-fun lt!227679 () tuple4!136)

(assert (=> b!146555 (= res!122600 (bvsge (_1!6898 lt!227679) (_2!6898 lt!227679)))))

(assert (=> b!146555 (= lt!227680 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226290))) (currentByte!6344 (_2!6888 lt!226290)) (currentBit!6339 (_2!6888 lt!226290))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!227678 () (_ BitVec 32))

(assert (=> b!146555 (= lt!227678 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!136)

(assert (=> b!146555 (= lt!227679 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226290))) (currentByte!6344 (_2!6888 lt!226290)) (currentBit!6339 (_2!6888 lt!226290)))))))

(declare-fun d!47165 () Bool)

(declare-fun res!122598 () Bool)

(assert (=> d!47165 (=> res!122598 e!97705)))

(assert (=> d!47165 (= res!122598 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226290))) (currentByte!6344 (_2!6888 lt!226290)) (currentBit!6339 (_2!6888 lt!226290)))))))

(assert (=> d!47165 (= (arrayBitRangesEq!0 (buf!3448 (_2!6888 lt!226290)) (buf!3448 (_2!6888 lt!226295)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226290))) (currentByte!6344 (_2!6888 lt!226290)) (currentBit!6339 (_2!6888 lt!226290)))) e!97705)))

(declare-fun b!146556 () Bool)

(declare-fun e!97704 () Bool)

(assert (=> b!146556 (= e!97707 e!97704)))

(declare-fun c!7940 () Bool)

(assert (=> b!146556 (= c!7940 (= (_3!353 lt!227679) (_4!68 lt!227679)))))

(declare-fun b!146557 () Bool)

(assert (=> b!146557 (= e!97703 (arrayRangesEq!319 (buf!3448 (_2!6888 lt!226290)) (buf!3448 (_2!6888 lt!226295)) (_1!6898 lt!227679) (_2!6898 lt!227679)))))

(declare-fun bm!1932 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1932 (= call!1935 (byteRangesEq!0 (ite c!7940 (select (arr!3742 (buf!3448 (_2!6888 lt!226290))) (_3!353 lt!227679)) (select (arr!3742 (buf!3448 (_2!6888 lt!226290))) (_4!68 lt!227679))) (ite c!7940 (select (arr!3742 (buf!3448 (_2!6888 lt!226295))) (_3!353 lt!227679)) (select (arr!3742 (buf!3448 (_2!6888 lt!226295))) (_4!68 lt!227679))) (ite c!7940 lt!227678 #b00000000000000000000000000000000) lt!227680))))

(declare-fun b!146558 () Bool)

(assert (=> b!146558 (= e!97704 e!97706)))

(declare-fun res!122599 () Bool)

(assert (=> b!146558 (= res!122599 (byteRangesEq!0 (select (arr!3742 (buf!3448 (_2!6888 lt!226290))) (_3!353 lt!227679)) (select (arr!3742 (buf!3448 (_2!6888 lt!226295))) (_3!353 lt!227679)) lt!227678 #b00000000000000000000000000001000))))

(assert (=> b!146558 (=> (not res!122599) (not e!97706))))

(declare-fun b!146559 () Bool)

(assert (=> b!146559 (= e!97704 call!1935)))

(assert (= (and d!47165 (not res!122598)) b!146555))

(assert (= (and b!146555 (not res!122600)) b!146557))

(assert (= (and b!146555 res!122597) b!146556))

(assert (= (and b!146556 c!7940) b!146559))

(assert (= (and b!146556 (not c!7940)) b!146558))

(assert (= (and b!146558 res!122599) b!146553))

(assert (= (and b!146553 (not res!122601)) b!146554))

(assert (= (or b!146559 b!146554) bm!1932))

(assert (=> b!146555 m!224703))

(declare-fun m!226179 () Bool)

(assert (=> b!146555 m!226179))

(declare-fun m!226181 () Bool)

(assert (=> b!146557 m!226181))

(declare-fun m!226183 () Bool)

(assert (=> bm!1932 m!226183))

(declare-fun m!226185 () Bool)

(assert (=> bm!1932 m!226185))

(declare-fun m!226187 () Bool)

(assert (=> bm!1932 m!226187))

(declare-fun m!226189 () Bool)

(assert (=> bm!1932 m!226189))

(declare-fun m!226191 () Bool)

(assert (=> bm!1932 m!226191))

(assert (=> b!146558 m!226189))

(assert (=> b!146558 m!226183))

(assert (=> b!146558 m!226189))

(assert (=> b!146558 m!226183))

(declare-fun m!226193 () Bool)

(assert (=> b!146558 m!226193))

(assert (=> b!146050 d!47165))

(assert (=> b!146050 d!46729))

(assert (=> d!46802 d!46767))

(declare-fun d!47167 () Bool)

(declare-fun lt!227681 () tuple3!566)

(assert (=> d!47167 (= lt!227681 (readByteArrayLoop!0 lt!226754 (array!6634 (store (arr!3742 arr!237) from!447 (_2!6887 (readBytePure!0 (_1!6886 lt!226293)))) (size!3003 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!47167 (= (readByteArrayLoopPure!0 lt!226754 (array!6634 (store (arr!3742 arr!237) from!447 (_2!6887 (readBytePure!0 (_1!6886 lt!226293)))) (size!3003 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404) (tuple2!13073 (_2!6891 lt!227681) (_3!350 lt!227681)))))

(declare-fun bs!11549 () Bool)

(assert (= bs!11549 d!47167))

(declare-fun m!226195 () Bool)

(assert (=> bs!11549 m!226195))

(assert (=> d!46802 d!47167))

(assert (=> d!46802 d!46769))

(declare-fun d!47169 () Bool)

(assert (=> d!47169 (arrayRangesEq!319 (_2!6885 (readByteArrayLoopPure!0 (_1!6886 lt!226293) arr!237 from!447 to!404)) (_2!6885 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6886 lt!226293) #b00000000000000000000000000000001) (array!6634 (store (arr!3742 arr!237) from!447 (_2!6887 (readBytePure!0 (_1!6886 lt!226293)))) (size!3003 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404)) #b00000000000000000000000000000000 to!404)))

(assert (=> d!47169 true))

(declare-fun _$13!58 () Unit!9088)

(assert (=> d!47169 (= (choose!35 (_1!6886 lt!226293) arr!237 from!447 to!404 lt!226753 (_2!6885 lt!226753) lt!226754 lt!226755 (_2!6885 lt!226755)) _$13!58)))

(declare-fun bs!11551 () Bool)

(assert (= bs!11551 d!47169))

(assert (=> bs!11551 m!224751))

(assert (=> bs!11551 m!224759))

(declare-fun m!226197 () Bool)

(assert (=> bs!11551 m!226197))

(declare-fun m!226199 () Bool)

(assert (=> bs!11551 m!226199))

(assert (=> bs!11551 m!224735))

(assert (=> bs!11551 m!224759))

(assert (=> bs!11551 m!225141))

(assert (=> d!46802 d!47169))

(assert (=> d!46802 d!46773))

(declare-fun d!47171 () Bool)

(declare-fun res!122602 () Bool)

(declare-fun e!97709 () Bool)

(assert (=> d!47171 (=> res!122602 e!97709)))

(assert (=> d!47171 (= res!122602 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!47171 (= (arrayRangesEq!319 (_2!6885 lt!226753) (_2!6885 lt!226755) #b00000000000000000000000000000000 to!404) e!97709)))

(declare-fun b!146560 () Bool)

(declare-fun e!97710 () Bool)

(assert (=> b!146560 (= e!97709 e!97710)))

(declare-fun res!122603 () Bool)

(assert (=> b!146560 (=> (not res!122603) (not e!97710))))

(assert (=> b!146560 (= res!122603 (= (select (arr!3742 (_2!6885 lt!226753)) #b00000000000000000000000000000000) (select (arr!3742 (_2!6885 lt!226755)) #b00000000000000000000000000000000)))))

(declare-fun b!146561 () Bool)

(assert (=> b!146561 (= e!97710 (arrayRangesEq!319 (_2!6885 lt!226753) (_2!6885 lt!226755) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!47171 (not res!122602)) b!146560))

(assert (= (and b!146560 res!122603) b!146561))

(declare-fun m!226201 () Bool)

(assert (=> b!146560 m!226201))

(declare-fun m!226203 () Bool)

(assert (=> b!146560 m!226203))

(declare-fun m!226205 () Bool)

(assert (=> b!146561 m!226205))

(assert (=> d!46802 d!47171))

(assert (=> d!46739 d!47117))

(assert (=> d!46739 d!46806))

(declare-fun d!47173 () Bool)

(declare-fun e!97722 () Bool)

(assert (=> d!47173 e!97722))

(declare-fun res!122614 () Bool)

(assert (=> d!47173 (=> (not res!122614) (not e!97722))))

(declare-fun _$39!45 () tuple2!13078)

(assert (=> d!47173 (= res!122614 (= (size!3003 (buf!3448 (_2!6888 lt!226290))) (size!3003 (buf!3448 (_2!6888 _$39!45)))))))

(declare-fun e!97721 () Bool)

(assert (=> d!47173 (and (inv!12 (_2!6888 _$39!45)) e!97721)))

(assert (=> d!47173 (= (choose!64 (_2!6888 lt!226290) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) _$39!45)))

(declare-fun b!146572 () Bool)

(assert (=> b!146572 (= e!97721 (array_inv!2792 (buf!3448 (_2!6888 _$39!45))))))

(declare-fun b!146573 () Bool)

(declare-fun res!122612 () Bool)

(assert (=> b!146573 (=> (not res!122612) (not e!97722))))

(assert (=> b!146573 (= res!122612 (= (bitIndex!0 (size!3003 (buf!3448 (_2!6888 _$39!45))) (currentByte!6344 (_2!6888 _$39!45)) (currentBit!6339 (_2!6888 _$39!45))) (bvadd (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226290))) (currentByte!6344 (_2!6888 lt!226290)) (currentBit!6339 (_2!6888 lt!226290))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!146574 () Bool)

(declare-fun e!97719 () Bool)

(assert (=> b!146574 (= e!97722 e!97719)))

(declare-fun res!122613 () Bool)

(assert (=> b!146574 (=> (not res!122613) (not e!97719))))

(declare-fun lt!227694 () tuple2!13072)

(declare-fun lt!227695 () tuple2!13074)

(assert (=> b!146574 (= res!122613 (and (= (size!3003 (_2!6885 lt!227694)) (size!3003 arr!237)) (= (_1!6885 lt!227694) (_2!6886 lt!227695))))))

(assert (=> b!146574 (= lt!227694 (readByteArrayLoopPure!0 (_1!6886 lt!227695) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!227692 () Unit!9088)

(declare-fun lt!227696 () Unit!9088)

(assert (=> b!146574 (= lt!227692 lt!227696)))

(declare-fun lt!227693 () (_ BitVec 64))

(assert (=> b!146574 (validate_offset_bits!1 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 _$39!45)))) ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226290))) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226290))) lt!227693)))

(assert (=> b!146574 (= lt!227696 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6888 lt!226290) (buf!3448 (_2!6888 _$39!45)) lt!227693))))

(assert (=> b!146574 (= lt!227693 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!146574 (= lt!227695 (reader!0 (_2!6888 lt!226290) (_2!6888 _$39!45)))))

(declare-fun b!146575 () Bool)

(declare-fun res!122615 () Bool)

(assert (=> b!146575 (=> (not res!122615) (not e!97722))))

(assert (=> b!146575 (= res!122615 (isPrefixOf!0 (_2!6888 lt!226290) (_2!6888 _$39!45)))))

(declare-fun b!146576 () Bool)

(assert (=> b!146576 (= e!97719 (arrayRangesEq!319 arr!237 (_2!6885 lt!227694) #b00000000000000000000000000000000 to!404))))

(assert (= d!47173 b!146572))

(assert (= (and d!47173 res!122614) b!146573))

(assert (= (and b!146573 res!122612) b!146575))

(assert (= (and b!146575 res!122615) b!146574))

(assert (= (and b!146574 res!122613) b!146576))

(declare-fun m!226207 () Bool)

(assert (=> b!146576 m!226207))

(declare-fun m!226209 () Bool)

(assert (=> d!47173 m!226209))

(declare-fun m!226211 () Bool)

(assert (=> b!146574 m!226211))

(declare-fun m!226213 () Bool)

(assert (=> b!146574 m!226213))

(declare-fun m!226215 () Bool)

(assert (=> b!146574 m!226215))

(declare-fun m!226217 () Bool)

(assert (=> b!146574 m!226217))

(declare-fun m!226219 () Bool)

(assert (=> b!146573 m!226219))

(assert (=> b!146573 m!224703))

(declare-fun m!226221 () Bool)

(assert (=> b!146572 m!226221))

(declare-fun m!226223 () Bool)

(assert (=> b!146575 m!226223))

(assert (=> d!46785 d!47173))

(declare-fun d!47175 () Bool)

(declare-fun res!122617 () Bool)

(declare-fun e!97724 () Bool)

(assert (=> d!47175 (=> (not res!122617) (not e!97724))))

(assert (=> d!47175 (= res!122617 (= (size!3003 (buf!3448 (_1!6886 lt!226620))) (size!3003 (buf!3448 (_2!6888 lt!226290)))))))

(assert (=> d!47175 (= (isPrefixOf!0 (_1!6886 lt!226620) (_2!6888 lt!226290)) e!97724)))

(declare-fun b!146577 () Bool)

(declare-fun res!122618 () Bool)

(assert (=> b!146577 (=> (not res!122618) (not e!97724))))

(assert (=> b!146577 (= res!122618 (bvsle (bitIndex!0 (size!3003 (buf!3448 (_1!6886 lt!226620))) (currentByte!6344 (_1!6886 lt!226620)) (currentBit!6339 (_1!6886 lt!226620))) (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226290))) (currentByte!6344 (_2!6888 lt!226290)) (currentBit!6339 (_2!6888 lt!226290)))))))

(declare-fun b!146578 () Bool)

(declare-fun e!97723 () Bool)

(assert (=> b!146578 (= e!97724 e!97723)))

(declare-fun res!122616 () Bool)

(assert (=> b!146578 (=> res!122616 e!97723)))

(assert (=> b!146578 (= res!122616 (= (size!3003 (buf!3448 (_1!6886 lt!226620))) #b00000000000000000000000000000000))))

(declare-fun b!146579 () Bool)

(assert (=> b!146579 (= e!97723 (arrayBitRangesEq!0 (buf!3448 (_1!6886 lt!226620)) (buf!3448 (_2!6888 lt!226290)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3003 (buf!3448 (_1!6886 lt!226620))) (currentByte!6344 (_1!6886 lt!226620)) (currentBit!6339 (_1!6886 lt!226620)))))))

(assert (= (and d!47175 res!122617) b!146577))

(assert (= (and b!146577 res!122618) b!146578))

(assert (= (and b!146578 (not res!122616)) b!146579))

(assert (=> b!146577 m!226057))

(assert (=> b!146577 m!224703))

(assert (=> b!146579 m!226057))

(assert (=> b!146579 m!226057))

(declare-fun m!226225 () Bool)

(assert (=> b!146579 m!226225))

(assert (=> b!146071 d!47175))

(declare-fun d!47177 () Bool)

(declare-fun res!122619 () Bool)

(declare-fun e!97725 () Bool)

(assert (=> d!47177 (=> res!122619 e!97725)))

(assert (=> d!47177 (= res!122619 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!47177 (= (arrayRangesEq!319 arr!237 (_2!6885 lt!226299) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!97725)))

(declare-fun b!146580 () Bool)

(declare-fun e!97726 () Bool)

(assert (=> b!146580 (= e!97725 e!97726)))

(declare-fun res!122620 () Bool)

(assert (=> b!146580 (=> (not res!122620) (not e!97726))))

(assert (=> b!146580 (= res!122620 (= (select (arr!3742 arr!237) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3742 (_2!6885 lt!226299)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!146581 () Bool)

(assert (=> b!146581 (= e!97726 (arrayRangesEq!319 arr!237 (_2!6885 lt!226299) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!47177 (not res!122619)) b!146580))

(assert (= (and b!146580 res!122620) b!146581))

(declare-fun m!226227 () Bool)

(assert (=> b!146580 m!226227))

(declare-fun m!226229 () Bool)

(assert (=> b!146580 m!226229))

(declare-fun m!226231 () Bool)

(assert (=> b!146581 m!226231))

(assert (=> b!146056 d!47177))

(declare-fun d!47179 () Bool)

(assert (=> d!47179 (isPrefixOf!0 lt!226766 lt!226766)))

(declare-fun lt!227697 () Unit!9088)

(assert (=> d!47179 (= lt!227697 (choose!11 lt!226766))))

(assert (=> d!47179 (= (lemmaIsPrefixRefl!0 lt!226766) lt!227697)))

(declare-fun bs!11552 () Bool)

(assert (= bs!11552 d!47179))

(assert (=> bs!11552 m!225157))

(declare-fun m!226233 () Bool)

(assert (=> bs!11552 m!226233))

(assert (=> d!46810 d!47179))

(assert (=> d!46810 d!47121))

(declare-fun d!47181 () Bool)

(declare-fun res!122622 () Bool)

(declare-fun e!97728 () Bool)

(assert (=> d!47181 (=> (not res!122622) (not e!97728))))

(assert (=> d!47181 (= res!122622 (= (size!3003 (buf!3448 (_1!6886 lt!226763))) (size!3003 (buf!3448 (_2!6886 lt!226763)))))))

(assert (=> d!47181 (= (isPrefixOf!0 (_1!6886 lt!226763) (_2!6886 lt!226763)) e!97728)))

(declare-fun b!146582 () Bool)

(declare-fun res!122623 () Bool)

(assert (=> b!146582 (=> (not res!122623) (not e!97728))))

(assert (=> b!146582 (= res!122623 (bvsle (bitIndex!0 (size!3003 (buf!3448 (_1!6886 lt!226763))) (currentByte!6344 (_1!6886 lt!226763)) (currentBit!6339 (_1!6886 lt!226763))) (bitIndex!0 (size!3003 (buf!3448 (_2!6886 lt!226763))) (currentByte!6344 (_2!6886 lt!226763)) (currentBit!6339 (_2!6886 lt!226763)))))))

(declare-fun b!146583 () Bool)

(declare-fun e!97727 () Bool)

(assert (=> b!146583 (= e!97728 e!97727)))

(declare-fun res!122621 () Bool)

(assert (=> b!146583 (=> res!122621 e!97727)))

(assert (=> b!146583 (= res!122621 (= (size!3003 (buf!3448 (_1!6886 lt!226763))) #b00000000000000000000000000000000))))

(declare-fun b!146584 () Bool)

(assert (=> b!146584 (= e!97727 (arrayBitRangesEq!0 (buf!3448 (_1!6886 lt!226763)) (buf!3448 (_2!6886 lt!226763)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3003 (buf!3448 (_1!6886 lt!226763))) (currentByte!6344 (_1!6886 lt!226763)) (currentBit!6339 (_1!6886 lt!226763)))))))

(assert (= (and d!47181 res!122622) b!146582))

(assert (= (and b!146582 res!122623) b!146583))

(assert (= (and b!146583 (not res!122621)) b!146584))

(assert (=> b!146582 m!226069))

(assert (=> b!146582 m!225959))

(assert (=> b!146584 m!226069))

(assert (=> b!146584 m!226069))

(declare-fun m!226235 () Bool)

(assert (=> b!146584 m!226235))

(assert (=> d!46810 d!47181))

(assert (=> d!46810 d!46755))

(assert (=> d!46810 d!47127))

(declare-fun d!47183 () Bool)

(declare-fun res!122625 () Bool)

(declare-fun e!97730 () Bool)

(assert (=> d!47183 (=> (not res!122625) (not e!97730))))

(assert (=> d!47183 (= res!122625 (= (size!3003 (buf!3448 lt!226766)) (size!3003 (buf!3448 (_2!6888 lt!226290)))))))

(assert (=> d!47183 (= (isPrefixOf!0 lt!226766 (_2!6888 lt!226290)) e!97730)))

(declare-fun b!146585 () Bool)

(declare-fun res!122626 () Bool)

(assert (=> b!146585 (=> (not res!122626) (not e!97730))))

(assert (=> b!146585 (= res!122626 (bvsle (bitIndex!0 (size!3003 (buf!3448 lt!226766)) (currentByte!6344 lt!226766) (currentBit!6339 lt!226766)) (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226290))) (currentByte!6344 (_2!6888 lt!226290)) (currentBit!6339 (_2!6888 lt!226290)))))))

(declare-fun b!146586 () Bool)

(declare-fun e!97729 () Bool)

(assert (=> b!146586 (= e!97730 e!97729)))

(declare-fun res!122624 () Bool)

(assert (=> b!146586 (=> res!122624 e!97729)))

(assert (=> b!146586 (= res!122624 (= (size!3003 (buf!3448 lt!226766)) #b00000000000000000000000000000000))))

(declare-fun b!146587 () Bool)

(assert (=> b!146587 (= e!97729 (arrayBitRangesEq!0 (buf!3448 lt!226766) (buf!3448 (_2!6888 lt!226290)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3003 (buf!3448 lt!226766)) (currentByte!6344 lt!226766) (currentBit!6339 lt!226766))))))

(assert (= (and d!47183 res!122625) b!146585))

(assert (= (and b!146585 res!122626) b!146586))

(assert (= (and b!146586 (not res!122624)) b!146587))

(declare-fun m!226237 () Bool)

(assert (=> b!146585 m!226237))

(assert (=> b!146585 m!224703))

(assert (=> b!146587 m!226237))

(assert (=> b!146587 m!226237))

(declare-fun m!226239 () Bool)

(assert (=> b!146587 m!226239))

(assert (=> d!46810 d!47183))

(declare-fun d!47185 () Bool)

(declare-fun res!122628 () Bool)

(declare-fun e!97732 () Bool)

(assert (=> d!47185 (=> (not res!122628) (not e!97732))))

(assert (=> d!47185 (= res!122628 (= (size!3003 (buf!3448 lt!226766)) (size!3003 (buf!3448 lt!226766))))))

(assert (=> d!47185 (= (isPrefixOf!0 lt!226766 lt!226766) e!97732)))

(declare-fun b!146588 () Bool)

(declare-fun res!122629 () Bool)

(assert (=> b!146588 (=> (not res!122629) (not e!97732))))

(assert (=> b!146588 (= res!122629 (bvsle (bitIndex!0 (size!3003 (buf!3448 lt!226766)) (currentByte!6344 lt!226766) (currentBit!6339 lt!226766)) (bitIndex!0 (size!3003 (buf!3448 lt!226766)) (currentByte!6344 lt!226766) (currentBit!6339 lt!226766))))))

(declare-fun b!146589 () Bool)

(declare-fun e!97731 () Bool)

(assert (=> b!146589 (= e!97732 e!97731)))

(declare-fun res!122627 () Bool)

(assert (=> b!146589 (=> res!122627 e!97731)))

(assert (=> b!146589 (= res!122627 (= (size!3003 (buf!3448 lt!226766)) #b00000000000000000000000000000000))))

(declare-fun b!146590 () Bool)

(assert (=> b!146590 (= e!97731 (arrayBitRangesEq!0 (buf!3448 lt!226766) (buf!3448 lt!226766) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3003 (buf!3448 lt!226766)) (currentByte!6344 lt!226766) (currentBit!6339 lt!226766))))))

(assert (= (and d!47185 res!122628) b!146588))

(assert (= (and b!146588 res!122629) b!146589))

(assert (= (and b!146589 (not res!122627)) b!146590))

(assert (=> b!146588 m!226237))

(assert (=> b!146588 m!226237))

(assert (=> b!146590 m!226237))

(assert (=> b!146590 m!226237))

(declare-fun m!226241 () Bool)

(assert (=> b!146590 m!226241))

(assert (=> d!46810 d!47185))

(declare-fun d!47187 () Bool)

(declare-fun res!122631 () Bool)

(declare-fun e!97734 () Bool)

(assert (=> d!47187 (=> (not res!122631) (not e!97734))))

(assert (=> d!47187 (= res!122631 (= (size!3003 (buf!3448 thiss!1634)) (size!3003 (buf!3448 thiss!1634))))))

(assert (=> d!47187 (= (isPrefixOf!0 thiss!1634 thiss!1634) e!97734)))

(declare-fun b!146591 () Bool)

(declare-fun res!122632 () Bool)

(assert (=> b!146591 (=> (not res!122632) (not e!97734))))

(assert (=> b!146591 (= res!122632 (bvsle (bitIndex!0 (size!3003 (buf!3448 thiss!1634)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634)) (bitIndex!0 (size!3003 (buf!3448 thiss!1634)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634))))))

(declare-fun b!146592 () Bool)

(declare-fun e!97733 () Bool)

(assert (=> b!146592 (= e!97734 e!97733)))

(declare-fun res!122630 () Bool)

(assert (=> b!146592 (=> res!122630 e!97733)))

(assert (=> b!146592 (= res!122630 (= (size!3003 (buf!3448 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!146593 () Bool)

(assert (=> b!146593 (= e!97733 (arrayBitRangesEq!0 (buf!3448 thiss!1634) (buf!3448 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3003 (buf!3448 thiss!1634)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634))))))

(assert (= (and d!47187 res!122631) b!146591))

(assert (= (and b!146591 res!122632) b!146592))

(assert (= (and b!146592 (not res!122630)) b!146593))

(assert (=> b!146591 m!224711))

(assert (=> b!146591 m!224711))

(assert (=> b!146593 m!224711))

(assert (=> b!146593 m!224711))

(declare-fun m!226243 () Bool)

(assert (=> b!146593 m!226243))

(assert (=> d!46810 d!47187))

(declare-fun d!47189 () Bool)

(assert (=> d!47189 (isPrefixOf!0 lt!226766 (_2!6888 lt!226290))))

(declare-fun lt!227698 () Unit!9088)

(assert (=> d!47189 (= lt!227698 (choose!30 lt!226766 (_2!6888 lt!226290) (_2!6888 lt!226290)))))

(assert (=> d!47189 (isPrefixOf!0 lt!226766 (_2!6888 lt!226290))))

(assert (=> d!47189 (= (lemmaIsPrefixTransitive!0 lt!226766 (_2!6888 lt!226290) (_2!6888 lt!226290)) lt!227698)))

(declare-fun bs!11553 () Bool)

(assert (= bs!11553 d!47189))

(assert (=> bs!11553 m!225159))

(declare-fun m!226245 () Bool)

(assert (=> bs!11553 m!226245))

(assert (=> bs!11553 m!225159))

(assert (=> d!46810 d!47189))

(declare-fun d!47191 () Bool)

(assert (=> d!47191 (isPrefixOf!0 lt!226766 (_2!6888 lt!226290))))

(declare-fun lt!227699 () Unit!9088)

(assert (=> d!47191 (= lt!227699 (choose!30 lt!226766 thiss!1634 (_2!6888 lt!226290)))))

(assert (=> d!47191 (isPrefixOf!0 lt!226766 thiss!1634)))

(assert (=> d!47191 (= (lemmaIsPrefixTransitive!0 lt!226766 thiss!1634 (_2!6888 lt!226290)) lt!227699)))

(declare-fun bs!11554 () Bool)

(assert (= bs!11554 d!47191))

(assert (=> bs!11554 m!225159))

(declare-fun m!226247 () Bool)

(assert (=> bs!11554 m!226247))

(declare-fun m!226249 () Bool)

(assert (=> bs!11554 m!226249))

(assert (=> d!46810 d!47191))

(declare-fun d!47193 () Bool)

(assert (=> d!47193 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!227700 () Unit!9088)

(assert (=> d!47193 (= lt!227700 (choose!11 thiss!1634))))

(assert (=> d!47193 (= (lemmaIsPrefixRefl!0 thiss!1634) lt!227700)))

(declare-fun bs!11555 () Bool)

(assert (= bs!11555 d!47193))

(assert (=> bs!11555 m!225053))

(declare-fun m!226251 () Bool)

(assert (=> bs!11555 m!226251))

(assert (=> d!46810 d!47193))

(declare-fun lt!227730 () (_ BitVec 32))

(declare-fun lt!227721 () tuple2!13082)

(declare-fun call!1937 () Bool)

(declare-fun c!7941 () Bool)

(declare-fun lt!227722 () (_ BitVec 32))

(declare-fun bm!1933 () Bool)

(declare-fun lt!227704 () array!6633)

(declare-fun lt!227720 () array!6633)

(assert (=> bm!1933 (= call!1937 (arrayRangesEq!319 (ite c!7941 lt!226292 lt!227720) (ite c!7941 (array!6634 (store (arr!3742 lt!226292) (bvadd #b00000000000000000000000000000001 from!447) (_1!6892 lt!227721)) (size!3003 lt!226292)) lt!227704) (ite c!7941 #b00000000000000000000000000000000 lt!227722) (ite c!7941 (bvadd #b00000000000000000000000000000001 from!447) lt!227730)))))

(declare-fun b!146594 () Bool)

(declare-fun lt!227729 () tuple3!566)

(declare-fun e!97737 () Bool)

(assert (=> b!146594 (= e!97737 (= (select (arr!3742 (_3!350 lt!227729)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6887 (readBytePure!0 (_1!6886 lt!226297)))))))

(assert (=> b!146594 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!3003 (_3!350 lt!227729))))))

(declare-fun bm!1934 () Bool)

(declare-fun call!1938 () (_ BitVec 64))

(assert (=> bm!1934 (= call!1938 (bitIndex!0 (size!3003 (buf!3448 (_1!6886 lt!226297))) (currentByte!6344 (_1!6886 lt!226297)) (currentBit!6339 (_1!6886 lt!226297))))))

(declare-fun lt!227706 () tuple3!566)

(declare-fun call!1936 () Bool)

(declare-fun bm!1935 () Bool)

(assert (=> bm!1935 (= call!1936 (arrayRangesEq!319 lt!226292 (ite c!7941 (_3!350 lt!227706) lt!226292) #b00000000000000000000000000000000 (ite c!7941 (bvadd #b00000000000000000000000000000001 from!447) (size!3003 lt!226292))))))

(declare-fun b!146595 () Bool)

(declare-fun e!97735 () tuple3!566)

(declare-fun lt!227734 () Unit!9088)

(assert (=> b!146595 (= e!97735 (tuple3!567 lt!227734 (_2!6891 lt!227706) (_3!350 lt!227706)))))

(assert (=> b!146595 (= lt!227721 (readByte!0 (_1!6886 lt!226297)))))

(declare-fun lt!227716 () array!6633)

(assert (=> b!146595 (= lt!227716 (array!6634 (store (arr!3742 lt!226292) (bvadd #b00000000000000000000000000000001 from!447) (_1!6892 lt!227721)) (size!3003 lt!226292)))))

(declare-fun lt!227713 () (_ BitVec 64))

(assert (=> b!146595 (= lt!227713 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!227724 () (_ BitVec 32))

(assert (=> b!146595 (= lt!227724 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!227708 () Unit!9088)

(assert (=> b!146595 (= lt!227708 (validateOffsetBytesFromBitIndexLemma!0 (_1!6886 lt!226297) (_2!6892 lt!227721) lt!227713 lt!227724))))

(assert (=> b!146595 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6892 lt!227721)))) ((_ sign_extend 32) (currentByte!6344 (_2!6892 lt!227721))) ((_ sign_extend 32) (currentBit!6339 (_2!6892 lt!227721))) (bvsub lt!227724 ((_ extract 31 0) (bvsdiv (bvadd lt!227713 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!227727 () Unit!9088)

(assert (=> b!146595 (= lt!227727 lt!227708)))

(assert (=> b!146595 (= lt!227706 (readByteArrayLoop!0 (_2!6892 lt!227721) lt!227716 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!146595 (= (bitIndex!0 (size!3003 (buf!3448 (_2!6892 lt!227721))) (currentByte!6344 (_2!6892 lt!227721)) (currentBit!6339 (_2!6892 lt!227721))) (bvadd call!1938 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!227702 () Unit!9088)

(declare-fun Unit!9171 () Unit!9088)

(assert (=> b!146595 (= lt!227702 Unit!9171)))

(assert (=> b!146595 (= (bvadd (bitIndex!0 (size!3003 (buf!3448 (_2!6892 lt!227721))) (currentByte!6344 (_2!6892 lt!227721)) (currentBit!6339 (_2!6892 lt!227721))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3003 (buf!3448 (_2!6891 lt!227706))) (currentByte!6344 (_2!6891 lt!227706)) (currentBit!6339 (_2!6891 lt!227706))))))

(declare-fun lt!227711 () Unit!9088)

(declare-fun Unit!9172 () Unit!9088)

(assert (=> b!146595 (= lt!227711 Unit!9172)))

(assert (=> b!146595 (= (bvadd call!1938 (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3003 (buf!3448 (_2!6891 lt!227706))) (currentByte!6344 (_2!6891 lt!227706)) (currentBit!6339 (_2!6891 lt!227706))))))

(declare-fun lt!227718 () Unit!9088)

(declare-fun Unit!9173 () Unit!9088)

(assert (=> b!146595 (= lt!227718 Unit!9173)))

(assert (=> b!146595 (and (= (buf!3448 (_1!6886 lt!226297)) (buf!3448 (_2!6891 lt!227706))) (= (size!3003 lt!226292) (size!3003 (_3!350 lt!227706))))))

(declare-fun lt!227725 () Unit!9088)

(declare-fun Unit!9174 () Unit!9088)

(assert (=> b!146595 (= lt!227725 Unit!9174)))

(declare-fun lt!227726 () Unit!9088)

(assert (=> b!146595 (= lt!227726 (arrayUpdatedAtPrefixLemma!11 lt!226292 (bvadd #b00000000000000000000000000000001 from!447) (_1!6892 lt!227721)))))

(assert (=> b!146595 call!1937))

(declare-fun lt!227735 () Unit!9088)

(assert (=> b!146595 (= lt!227735 lt!227726)))

(declare-fun lt!227714 () (_ BitVec 32))

(assert (=> b!146595 (= lt!227714 #b00000000000000000000000000000000)))

(declare-fun lt!227728 () Unit!9088)

(assert (=> b!146595 (= lt!227728 (arrayRangesEqTransitive!51 lt!226292 lt!227716 (_3!350 lt!227706) lt!227714 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!146595 (arrayRangesEq!319 lt!226292 (_3!350 lt!227706) lt!227714 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!227731 () Unit!9088)

(assert (=> b!146595 (= lt!227731 lt!227728)))

(assert (=> b!146595 call!1936))

(declare-fun lt!227705 () Unit!9088)

(declare-fun Unit!9175 () Unit!9088)

(assert (=> b!146595 (= lt!227705 Unit!9175)))

(declare-fun lt!227723 () Unit!9088)

(assert (=> b!146595 (= lt!227723 (arrayRangesEqImpliesEq!11 lt!227716 (_3!350 lt!227706) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!146595 (= (select (store (arr!3742 lt!226292) (bvadd #b00000000000000000000000000000001 from!447) (_1!6892 lt!227721)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3742 (_3!350 lt!227706)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!227732 () Unit!9088)

(assert (=> b!146595 (= lt!227732 lt!227723)))

(declare-fun lt!227712 () Bool)

(assert (=> b!146595 (= lt!227712 (= (select (arr!3742 (_3!350 lt!227706)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6892 lt!227721)))))

(declare-fun Unit!9176 () Unit!9088)

(assert (=> b!146595 (= lt!227734 Unit!9176)))

(assert (=> b!146595 lt!227712))

(declare-fun b!146596 () Bool)

(declare-fun e!97736 () Bool)

(assert (=> b!146596 (= e!97736 (arrayRangesEq!319 lt!226292 (_3!350 lt!227729) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun b!146597 () Bool)

(declare-fun lt!227703 () Unit!9088)

(assert (=> b!146597 (= e!97735 (tuple3!567 lt!227703 (_1!6886 lt!226297) lt!226292))))

(assert (=> b!146597 (= call!1938 call!1938)))

(declare-fun lt!227733 () Unit!9088)

(declare-fun Unit!9177 () Unit!9088)

(assert (=> b!146597 (= lt!227733 Unit!9177)))

(declare-fun lt!227701 () Unit!9088)

(assert (=> b!146597 (= lt!227701 (arrayRangesEqReflexiveLemma!11 lt!226292))))

(assert (=> b!146597 call!1936))

(declare-fun lt!227709 () Unit!9088)

(assert (=> b!146597 (= lt!227709 lt!227701)))

(assert (=> b!146597 (= lt!227720 lt!226292)))

(assert (=> b!146597 (= lt!227704 lt!226292)))

(declare-fun lt!227715 () (_ BitVec 32))

(assert (=> b!146597 (= lt!227715 #b00000000000000000000000000000000)))

(declare-fun lt!227710 () (_ BitVec 32))

(assert (=> b!146597 (= lt!227710 (size!3003 lt!226292))))

(assert (=> b!146597 (= lt!227722 #b00000000000000000000000000000000)))

(assert (=> b!146597 (= lt!227730 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!146597 (= lt!227703 (arrayRangesEqSlicedLemma!11 lt!227720 lt!227704 lt!227715 lt!227710 lt!227722 lt!227730))))

(assert (=> b!146597 call!1937))

(declare-fun b!146598 () Bool)

(declare-fun res!122633 () Bool)

(assert (=> b!146598 (=> (not res!122633) (not e!97736))))

(assert (=> b!146598 (= res!122633 (and (= (buf!3448 (_1!6886 lt!226297)) (buf!3448 (_2!6891 lt!227729))) (= (size!3003 lt!226292) (size!3003 (_3!350 lt!227729)))))))

(declare-fun d!47195 () Bool)

(assert (=> d!47195 e!97737))

(declare-fun res!122634 () Bool)

(assert (=> d!47195 (=> res!122634 e!97737)))

(assert (=> d!47195 (= res!122634 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!227717 () Bool)

(assert (=> d!47195 (= lt!227717 e!97736)))

(declare-fun res!122635 () Bool)

(assert (=> d!47195 (=> (not res!122635) (not e!97736))))

(declare-fun lt!227719 () (_ BitVec 64))

(declare-fun lt!227736 () (_ BitVec 64))

(assert (=> d!47195 (= res!122635 (= (bvadd lt!227736 lt!227719) (bitIndex!0 (size!3003 (buf!3448 (_2!6891 lt!227729))) (currentByte!6344 (_2!6891 lt!227729)) (currentBit!6339 (_2!6891 lt!227729)))))))

(assert (=> d!47195 (or (not (= (bvand lt!227736 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!227719 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!227736 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!227736 lt!227719) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!227707 () (_ BitVec 64))

(assert (=> d!47195 (= lt!227719 (bvmul lt!227707 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!47195 (or (= lt!227707 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!227707 #b0000000000000000000000000000000000000000000000000000000000001000) lt!227707)))))

(assert (=> d!47195 (= lt!227707 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!47195 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!47195 (= lt!227736 (bitIndex!0 (size!3003 (buf!3448 (_1!6886 lt!226297))) (currentByte!6344 (_1!6886 lt!226297)) (currentBit!6339 (_1!6886 lt!226297))))))

(assert (=> d!47195 (= lt!227729 e!97735)))

(assert (=> d!47195 (= c!7941 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!47195 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3003 lt!226292)))))

(assert (=> d!47195 (= (readByteArrayLoop!0 (_1!6886 lt!226297) lt!226292 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!227729)))

(assert (= (and d!47195 c!7941) b!146595))

(assert (= (and d!47195 (not c!7941)) b!146597))

(assert (= (or b!146595 b!146597) bm!1933))

(assert (= (or b!146595 b!146597) bm!1935))

(assert (= (or b!146595 b!146597) bm!1934))

(assert (= (and d!47195 res!122635) b!146598))

(assert (= (and b!146598 res!122633) b!146596))

(assert (= (and d!47195 (not res!122634)) b!146594))

(declare-fun m!226253 () Bool)

(assert (=> bm!1934 m!226253))

(declare-fun m!226255 () Bool)

(assert (=> bm!1935 m!226255))

(assert (=> b!146597 m!226077))

(declare-fun m!226257 () Bool)

(assert (=> b!146597 m!226257))

(declare-fun m!226259 () Bool)

(assert (=> b!146594 m!226259))

(declare-fun m!226261 () Bool)

(assert (=> b!146594 m!226261))

(declare-fun m!226263 () Bool)

(assert (=> b!146596 m!226263))

(declare-fun m!226265 () Bool)

(assert (=> bm!1933 m!226265))

(declare-fun m!226267 () Bool)

(assert (=> bm!1933 m!226267))

(declare-fun m!226269 () Bool)

(assert (=> b!146595 m!226269))

(assert (=> b!146595 m!226265))

(declare-fun m!226271 () Bool)

(assert (=> b!146595 m!226271))

(declare-fun m!226273 () Bool)

(assert (=> b!146595 m!226273))

(declare-fun m!226275 () Bool)

(assert (=> b!146595 m!226275))

(declare-fun m!226277 () Bool)

(assert (=> b!146595 m!226277))

(declare-fun m!226279 () Bool)

(assert (=> b!146595 m!226279))

(declare-fun m!226281 () Bool)

(assert (=> b!146595 m!226281))

(declare-fun m!226283 () Bool)

(assert (=> b!146595 m!226283))

(declare-fun m!226285 () Bool)

(assert (=> b!146595 m!226285))

(declare-fun m!226287 () Bool)

(assert (=> b!146595 m!226287))

(declare-fun m!226289 () Bool)

(assert (=> b!146595 m!226289))

(declare-fun m!226291 () Bool)

(assert (=> b!146595 m!226291))

(declare-fun m!226293 () Bool)

(assert (=> d!47195 m!226293))

(assert (=> d!47195 m!226253))

(assert (=> d!46787 d!47195))

(declare-fun d!47197 () Bool)

(assert (=> d!47197 (= (remainingBits!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226295)))) ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226295))) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226295)))) (bvsub (bvmul ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226295)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226295))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226295))))))))

(assert (=> d!46727 d!47197))

(declare-fun d!47199 () Bool)

(assert (=> d!47199 (= (invariant!0 (currentBit!6339 (_2!6888 lt!226295)) (currentByte!6344 (_2!6888 lt!226295)) (size!3003 (buf!3448 (_2!6888 lt!226295)))) (and (bvsge (currentBit!6339 (_2!6888 lt!226295)) #b00000000000000000000000000000000) (bvslt (currentBit!6339 (_2!6888 lt!226295)) #b00000000000000000000000000001000) (bvsge (currentByte!6344 (_2!6888 lt!226295)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6344 (_2!6888 lt!226295)) (size!3003 (buf!3448 (_2!6888 lt!226295)))) (and (= (currentBit!6339 (_2!6888 lt!226295)) #b00000000000000000000000000000000) (= (currentByte!6344 (_2!6888 lt!226295)) (size!3003 (buf!3448 (_2!6888 lt!226295))))))))))

(assert (=> d!46727 d!47199))

(declare-fun d!47201 () Bool)

(assert (=> d!47201 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226290)))) ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226290))) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226290))) (bvsub (bvsub to!404 from!447) lt!226743)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) lt!226743)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226290)))) ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226290))) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226290)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11556 () Bool)

(assert (= bs!11556 d!47201))

(assert (=> bs!11556 m!224979))

(assert (=> b!146120 d!47201))

(declare-fun d!47203 () Bool)

(assert (=> d!47203 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226290)))) ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226290))) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226290))) lt!226725) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226290)))) ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226290))) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226290)))) lt!226725))))

(declare-fun bs!11557 () Bool)

(assert (= bs!11557 d!47203))

(assert (=> bs!11557 m!224979))

(assert (=> b!146112 d!47203))

(assert (=> d!46729 d!47093))

(declare-fun d!47205 () Bool)

(assert (=> d!47205 (= (invariant!0 (currentBit!6339 (_2!6888 lt!226290)) (currentByte!6344 (_2!6888 lt!226290)) (size!3003 (buf!3448 (_2!6888 lt!226290)))) (and (bvsge (currentBit!6339 (_2!6888 lt!226290)) #b00000000000000000000000000000000) (bvslt (currentBit!6339 (_2!6888 lt!226290)) #b00000000000000000000000000001000) (bvsge (currentByte!6344 (_2!6888 lt!226290)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6344 (_2!6888 lt!226290)) (size!3003 (buf!3448 (_2!6888 lt!226290)))) (and (= (currentBit!6339 (_2!6888 lt!226290)) #b00000000000000000000000000000000) (= (currentByte!6344 (_2!6888 lt!226290)) (size!3003 (buf!3448 (_2!6888 lt!226290))))))))))

(assert (=> d!46729 d!47205))

(assert (=> b!146123 d!46739))

(declare-fun d!47207 () Bool)

(assert (=> d!47207 (arrayBitRangesEq!0 (buf!3448 (_2!6888 lt!226290)) (buf!3448 thiss!1634) lt!226759 lt!226767)))

(declare-fun lt!227739 () Unit!9088)

(declare-fun choose!8 (array!6633 array!6633 (_ BitVec 64) (_ BitVec 64)) Unit!9088)

(assert (=> d!47207 (= lt!227739 (choose!8 (buf!3448 thiss!1634) (buf!3448 (_2!6888 lt!226290)) lt!226759 lt!226767))))

(assert (=> d!47207 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!226759) (bvsle lt!226759 lt!226767))))

(assert (=> d!47207 (= (arrayBitRangesEqSymmetric!0 (buf!3448 thiss!1634) (buf!3448 (_2!6888 lt!226290)) lt!226759 lt!226767) lt!227739)))

(declare-fun bs!11558 () Bool)

(assert (= bs!11558 d!47207))

(assert (=> bs!11558 m!225153))

(declare-fun m!226295 () Bool)

(assert (=> bs!11558 m!226295))

(assert (=> b!146123 d!47207))

(declare-fun b!146599 () Bool)

(declare-fun res!122640 () Bool)

(declare-fun lt!227742 () (_ BitVec 32))

(assert (=> b!146599 (= res!122640 (= lt!227742 #b00000000000000000000000000000000))))

(declare-fun e!97743 () Bool)

(assert (=> b!146599 (=> res!122640 e!97743)))

(declare-fun e!97741 () Bool)

(assert (=> b!146599 (= e!97741 e!97743)))

(declare-fun b!146600 () Bool)

(declare-fun call!1939 () Bool)

(assert (=> b!146600 (= e!97743 call!1939)))

(declare-fun b!146601 () Bool)

(declare-fun e!97740 () Bool)

(declare-fun e!97742 () Bool)

(assert (=> b!146601 (= e!97740 e!97742)))

(declare-fun res!122636 () Bool)

(assert (=> b!146601 (=> (not res!122636) (not e!97742))))

(declare-fun e!97738 () Bool)

(assert (=> b!146601 (= res!122636 e!97738)))

(declare-fun res!122639 () Bool)

(assert (=> b!146601 (=> res!122639 e!97738)))

(declare-fun lt!227741 () tuple4!136)

(assert (=> b!146601 (= res!122639 (bvsge (_1!6898 lt!227741) (_2!6898 lt!227741)))))

(assert (=> b!146601 (= lt!227742 ((_ extract 31 0) (bvsrem lt!226767 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!227740 () (_ BitVec 32))

(assert (=> b!146601 (= lt!227740 ((_ extract 31 0) (bvsrem lt!226759 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146601 (= lt!227741 (arrayBitIndices!0 lt!226759 lt!226767))))

(declare-fun d!47209 () Bool)

(declare-fun res!122637 () Bool)

(assert (=> d!47209 (=> res!122637 e!97740)))

(assert (=> d!47209 (= res!122637 (bvsge lt!226759 lt!226767))))

(assert (=> d!47209 (= (arrayBitRangesEq!0 (buf!3448 (_2!6888 lt!226290)) (buf!3448 thiss!1634) lt!226759 lt!226767) e!97740)))

(declare-fun b!146602 () Bool)

(declare-fun e!97739 () Bool)

(assert (=> b!146602 (= e!97742 e!97739)))

(declare-fun c!7942 () Bool)

(assert (=> b!146602 (= c!7942 (= (_3!353 lt!227741) (_4!68 lt!227741)))))

(declare-fun b!146603 () Bool)

(assert (=> b!146603 (= e!97738 (arrayRangesEq!319 (buf!3448 (_2!6888 lt!226290)) (buf!3448 thiss!1634) (_1!6898 lt!227741) (_2!6898 lt!227741)))))

(declare-fun bm!1936 () Bool)

(assert (=> bm!1936 (= call!1939 (byteRangesEq!0 (ite c!7942 (select (arr!3742 (buf!3448 (_2!6888 lt!226290))) (_3!353 lt!227741)) (select (arr!3742 (buf!3448 (_2!6888 lt!226290))) (_4!68 lt!227741))) (ite c!7942 (select (arr!3742 (buf!3448 thiss!1634)) (_3!353 lt!227741)) (select (arr!3742 (buf!3448 thiss!1634)) (_4!68 lt!227741))) (ite c!7942 lt!227740 #b00000000000000000000000000000000) lt!227742))))

(declare-fun b!146604 () Bool)

(assert (=> b!146604 (= e!97739 e!97741)))

(declare-fun res!122638 () Bool)

(assert (=> b!146604 (= res!122638 (byteRangesEq!0 (select (arr!3742 (buf!3448 (_2!6888 lt!226290))) (_3!353 lt!227741)) (select (arr!3742 (buf!3448 thiss!1634)) (_3!353 lt!227741)) lt!227740 #b00000000000000000000000000001000))))

(assert (=> b!146604 (=> (not res!122638) (not e!97741))))

(declare-fun b!146605 () Bool)

(assert (=> b!146605 (= e!97739 call!1939)))

(assert (= (and d!47209 (not res!122637)) b!146601))

(assert (= (and b!146601 (not res!122639)) b!146603))

(assert (= (and b!146601 res!122636) b!146602))

(assert (= (and b!146602 c!7942) b!146605))

(assert (= (and b!146602 (not c!7942)) b!146604))

(assert (= (and b!146604 res!122638) b!146599))

(assert (= (and b!146599 (not res!122640)) b!146600))

(assert (= (or b!146605 b!146600) bm!1936))

(declare-fun m!226297 () Bool)

(assert (=> b!146601 m!226297))

(declare-fun m!226299 () Bool)

(assert (=> b!146603 m!226299))

(declare-fun m!226301 () Bool)

(assert (=> bm!1936 m!226301))

(declare-fun m!226303 () Bool)

(assert (=> bm!1936 m!226303))

(declare-fun m!226305 () Bool)

(assert (=> bm!1936 m!226305))

(declare-fun m!226307 () Bool)

(assert (=> bm!1936 m!226307))

(declare-fun m!226309 () Bool)

(assert (=> bm!1936 m!226309))

(assert (=> b!146604 m!226307))

(assert (=> b!146604 m!226301))

(assert (=> b!146604 m!226307))

(assert (=> b!146604 m!226301))

(declare-fun m!226311 () Bool)

(assert (=> b!146604 m!226311))

(assert (=> b!146123 d!47209))

(assert (=> d!46783 d!46759))

(declare-fun d!47211 () Bool)

(assert (=> d!47211 (isPrefixOf!0 thiss!1634 (_2!6888 lt!226295))))

(assert (=> d!47211 true))

(declare-fun _$15!231 () Unit!9088)

(assert (=> d!47211 (= (choose!30 thiss!1634 (_2!6888 lt!226290) (_2!6888 lt!226295)) _$15!231)))

(declare-fun bs!11559 () Bool)

(assert (= bs!11559 d!47211))

(assert (=> bs!11559 m!224747))

(assert (=> d!46783 d!47211))

(assert (=> d!46783 d!46755))

(declare-fun d!47213 () Bool)

(declare-fun res!122641 () Bool)

(declare-fun e!97744 () Bool)

(assert (=> d!47213 (=> res!122641 e!97744)))

(assert (=> d!47213 (= res!122641 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!47213 (= (arrayRangesEq!319 arr!237 (_2!6885 lt!226730) #b00000000000000000000000000000000 to!404) e!97744)))

(declare-fun b!146606 () Bool)

(declare-fun e!97745 () Bool)

(assert (=> b!146606 (= e!97744 e!97745)))

(declare-fun res!122642 () Bool)

(assert (=> b!146606 (=> (not res!122642) (not e!97745))))

(assert (=> b!146606 (= res!122642 (= (select (arr!3742 arr!237) #b00000000000000000000000000000000) (select (arr!3742 (_2!6885 lt!226730)) #b00000000000000000000000000000000)))))

(declare-fun b!146607 () Bool)

(assert (=> b!146607 (= e!97745 (arrayRangesEq!319 arr!237 (_2!6885 lt!226730) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!47213 (not res!122641)) b!146606))

(assert (= (and b!146606 res!122642) b!146607))

(assert (=> b!146606 m!224985))

(declare-fun m!226313 () Bool)

(assert (=> b!146606 m!226313))

(declare-fun m!226315 () Bool)

(assert (=> b!146607 m!226315))

(assert (=> b!146114 d!47213))

(declare-fun d!47215 () Bool)

(declare-fun e!97746 () Bool)

(assert (=> d!47215 e!97746))

(declare-fun res!122643 () Bool)

(assert (=> d!47215 (=> (not res!122643) (not e!97746))))

(declare-fun lt!227744 () (_ BitVec 64))

(declare-fun lt!227743 () BitStream!5264)

(assert (=> d!47215 (= res!122643 (= (bvadd lt!227744 (bvsub lt!226761 lt!226764)) (bitIndex!0 (size!3003 (buf!3448 lt!227743)) (currentByte!6344 lt!227743) (currentBit!6339 lt!227743))))))

(assert (=> d!47215 (or (not (= (bvand lt!227744 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226761 lt!226764) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!227744 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!227744 (bvsub lt!226761 lt!226764)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47215 (= lt!227744 (bitIndex!0 (size!3003 (buf!3448 (_2!6886 lt!226763))) (currentByte!6344 (_2!6886 lt!226763)) (currentBit!6339 (_2!6886 lt!226763))))))

(assert (=> d!47215 (= lt!227743 (_2!6888 (moveBitIndex!0 (_2!6886 lt!226763) (bvsub lt!226761 lt!226764))))))

(assert (=> d!47215 (moveBitIndexPrecond!0 (_2!6886 lt!226763) (bvsub lt!226761 lt!226764))))

(assert (=> d!47215 (= (withMovedBitIndex!0 (_2!6886 lt!226763) (bvsub lt!226761 lt!226764)) lt!227743)))

(declare-fun b!146608 () Bool)

(assert (=> b!146608 (= e!97746 (= (size!3003 (buf!3448 (_2!6886 lt!226763))) (size!3003 (buf!3448 lt!227743))))))

(assert (= (and d!47215 res!122643) b!146608))

(declare-fun m!226317 () Bool)

(assert (=> d!47215 m!226317))

(assert (=> d!47215 m!225959))

(declare-fun m!226319 () Bool)

(assert (=> d!47215 m!226319))

(declare-fun m!226321 () Bool)

(assert (=> d!47215 m!226321))

(assert (=> b!146126 d!47215))

(assert (=> b!146126 d!46729))

(assert (=> b!146126 d!46739))

(declare-fun b!146609 () Bool)

(declare-fun res!122648 () Bool)

(declare-fun lt!227747 () (_ BitVec 32))

(assert (=> b!146609 (= res!122648 (= lt!227747 #b00000000000000000000000000000000))))

(declare-fun e!97752 () Bool)

(assert (=> b!146609 (=> res!122648 e!97752)))

(declare-fun e!97750 () Bool)

(assert (=> b!146609 (= e!97750 e!97752)))

(declare-fun b!146610 () Bool)

(declare-fun call!1940 () Bool)

(assert (=> b!146610 (= e!97752 call!1940)))

(declare-fun b!146611 () Bool)

(declare-fun e!97749 () Bool)

(declare-fun e!97751 () Bool)

(assert (=> b!146611 (= e!97749 e!97751)))

(declare-fun res!122644 () Bool)

(assert (=> b!146611 (=> (not res!122644) (not e!97751))))

(declare-fun e!97747 () Bool)

(assert (=> b!146611 (= res!122644 e!97747)))

(declare-fun res!122647 () Bool)

(assert (=> b!146611 (=> res!122647 e!97747)))

(declare-fun lt!227746 () tuple4!136)

(assert (=> b!146611 (= res!122647 (bvsge (_1!6898 lt!227746) (_2!6898 lt!227746)))))

(assert (=> b!146611 (= lt!227747 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3003 (buf!3448 thiss!1634)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!227745 () (_ BitVec 32))

(assert (=> b!146611 (= lt!227745 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146611 (= lt!227746 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3003 (buf!3448 thiss!1634)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634))))))

(declare-fun d!47217 () Bool)

(declare-fun res!122645 () Bool)

(assert (=> d!47217 (=> res!122645 e!97749)))

(assert (=> d!47217 (= res!122645 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3003 (buf!3448 thiss!1634)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634))))))

(assert (=> d!47217 (= (arrayBitRangesEq!0 (buf!3448 thiss!1634) (buf!3448 (_2!6888 lt!226290)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3003 (buf!3448 thiss!1634)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634))) e!97749)))

(declare-fun b!146612 () Bool)

(declare-fun e!97748 () Bool)

(assert (=> b!146612 (= e!97751 e!97748)))

(declare-fun c!7943 () Bool)

(assert (=> b!146612 (= c!7943 (= (_3!353 lt!227746) (_4!68 lt!227746)))))

(declare-fun b!146613 () Bool)

(assert (=> b!146613 (= e!97747 (arrayRangesEq!319 (buf!3448 thiss!1634) (buf!3448 (_2!6888 lt!226290)) (_1!6898 lt!227746) (_2!6898 lt!227746)))))

(declare-fun bm!1937 () Bool)

(assert (=> bm!1937 (= call!1940 (byteRangesEq!0 (ite c!7943 (select (arr!3742 (buf!3448 thiss!1634)) (_3!353 lt!227746)) (select (arr!3742 (buf!3448 thiss!1634)) (_4!68 lt!227746))) (ite c!7943 (select (arr!3742 (buf!3448 (_2!6888 lt!226290))) (_3!353 lt!227746)) (select (arr!3742 (buf!3448 (_2!6888 lt!226290))) (_4!68 lt!227746))) (ite c!7943 lt!227745 #b00000000000000000000000000000000) lt!227747))))

(declare-fun b!146614 () Bool)

(assert (=> b!146614 (= e!97748 e!97750)))

(declare-fun res!122646 () Bool)

(assert (=> b!146614 (= res!122646 (byteRangesEq!0 (select (arr!3742 (buf!3448 thiss!1634)) (_3!353 lt!227746)) (select (arr!3742 (buf!3448 (_2!6888 lt!226290))) (_3!353 lt!227746)) lt!227745 #b00000000000000000000000000001000))))

(assert (=> b!146614 (=> (not res!122646) (not e!97750))))

(declare-fun b!146615 () Bool)

(assert (=> b!146615 (= e!97748 call!1940)))

(assert (= (and d!47217 (not res!122645)) b!146611))

(assert (= (and b!146611 (not res!122647)) b!146613))

(assert (= (and b!146611 res!122644) b!146612))

(assert (= (and b!146612 c!7943) b!146615))

(assert (= (and b!146612 (not c!7943)) b!146614))

(assert (= (and b!146614 res!122646) b!146609))

(assert (= (and b!146609 (not res!122648)) b!146610))

(assert (= (or b!146615 b!146610) bm!1937))

(assert (=> b!146611 m!224711))

(declare-fun m!226323 () Bool)

(assert (=> b!146611 m!226323))

(declare-fun m!226325 () Bool)

(assert (=> b!146613 m!226325))

(declare-fun m!226327 () Bool)

(assert (=> bm!1937 m!226327))

(declare-fun m!226329 () Bool)

(assert (=> bm!1937 m!226329))

(declare-fun m!226331 () Bool)

(assert (=> bm!1937 m!226331))

(declare-fun m!226333 () Bool)

(assert (=> bm!1937 m!226333))

(declare-fun m!226335 () Bool)

(assert (=> bm!1937 m!226335))

(assert (=> b!146614 m!226333))

(assert (=> b!146614 m!226327))

(assert (=> b!146614 m!226333))

(assert (=> b!146614 m!226327))

(declare-fun m!226337 () Bool)

(assert (=> b!146614 m!226337))

(assert (=> b!146076 d!47217))

(assert (=> b!146076 d!46739))

(assert (=> b!146077 d!46739))

(assert (=> b!146077 d!46727))

(declare-fun d!47219 () Bool)

(declare-fun res!122650 () Bool)

(declare-fun e!97754 () Bool)

(assert (=> d!47219 (=> (not res!122650) (not e!97754))))

(assert (=> d!47219 (= res!122650 (= (size!3003 (buf!3448 lt!226658)) (size!3003 (buf!3448 lt!226658))))))

(assert (=> d!47219 (= (isPrefixOf!0 lt!226658 lt!226658) e!97754)))

(declare-fun b!146616 () Bool)

(declare-fun res!122651 () Bool)

(assert (=> b!146616 (=> (not res!122651) (not e!97754))))

(assert (=> b!146616 (= res!122651 (bvsle (bitIndex!0 (size!3003 (buf!3448 lt!226658)) (currentByte!6344 lt!226658) (currentBit!6339 lt!226658)) (bitIndex!0 (size!3003 (buf!3448 lt!226658)) (currentByte!6344 lt!226658) (currentBit!6339 lt!226658))))))

(declare-fun b!146617 () Bool)

(declare-fun e!97753 () Bool)

(assert (=> b!146617 (= e!97754 e!97753)))

(declare-fun res!122649 () Bool)

(assert (=> b!146617 (=> res!122649 e!97753)))

(assert (=> b!146617 (= res!122649 (= (size!3003 (buf!3448 lt!226658)) #b00000000000000000000000000000000))))

(declare-fun b!146618 () Bool)

(assert (=> b!146618 (= e!97753 (arrayBitRangesEq!0 (buf!3448 lt!226658) (buf!3448 lt!226658) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3003 (buf!3448 lt!226658)) (currentByte!6344 lt!226658) (currentBit!6339 lt!226658))))))

(assert (= (and d!47219 res!122650) b!146616))

(assert (= (and b!146616 res!122651) b!146617))

(assert (= (and b!146617 (not res!122649)) b!146618))

(declare-fun m!226339 () Bool)

(assert (=> b!146616 m!226339))

(assert (=> b!146616 m!226339))

(assert (=> b!146618 m!226339))

(assert (=> b!146618 m!226339))

(declare-fun m!226341 () Bool)

(assert (=> b!146618 m!226341))

(assert (=> d!46763 d!47219))

(assert (=> d!46763 d!46759))

(assert (=> d!46763 d!47129))

(assert (=> d!46763 d!47137))

(assert (=> d!46763 d!47187))

(declare-fun d!47221 () Bool)

(assert (=> d!47221 (isPrefixOf!0 lt!226658 lt!226658)))

(declare-fun lt!227748 () Unit!9088)

(assert (=> d!47221 (= lt!227748 (choose!11 lt!226658))))

(assert (=> d!47221 (= (lemmaIsPrefixRefl!0 lt!226658) lt!227748)))

(declare-fun bs!11560 () Bool)

(assert (= bs!11560 d!47221))

(assert (=> bs!11560 m!225051))

(declare-fun m!226343 () Bool)

(assert (=> bs!11560 m!226343))

(assert (=> d!46763 d!47221))

(declare-fun d!47223 () Bool)

(declare-fun res!122653 () Bool)

(declare-fun e!97756 () Bool)

(assert (=> d!47223 (=> (not res!122653) (not e!97756))))

(assert (=> d!47223 (= res!122653 (= (size!3003 (buf!3448 (_1!6886 lt!226655))) (size!3003 (buf!3448 (_2!6886 lt!226655)))))))

(assert (=> d!47223 (= (isPrefixOf!0 (_1!6886 lt!226655) (_2!6886 lt!226655)) e!97756)))

(declare-fun b!146619 () Bool)

(declare-fun res!122654 () Bool)

(assert (=> b!146619 (=> (not res!122654) (not e!97756))))

(assert (=> b!146619 (= res!122654 (bvsle (bitIndex!0 (size!3003 (buf!3448 (_1!6886 lt!226655))) (currentByte!6344 (_1!6886 lt!226655)) (currentBit!6339 (_1!6886 lt!226655))) (bitIndex!0 (size!3003 (buf!3448 (_2!6886 lt!226655))) (currentByte!6344 (_2!6886 lt!226655)) (currentBit!6339 (_2!6886 lt!226655)))))))

(declare-fun b!146620 () Bool)

(declare-fun e!97755 () Bool)

(assert (=> b!146620 (= e!97756 e!97755)))

(declare-fun res!122652 () Bool)

(assert (=> b!146620 (=> res!122652 e!97755)))

(assert (=> b!146620 (= res!122652 (= (size!3003 (buf!3448 (_1!6886 lt!226655))) #b00000000000000000000000000000000))))

(declare-fun b!146621 () Bool)

(assert (=> b!146621 (= e!97755 (arrayBitRangesEq!0 (buf!3448 (_1!6886 lt!226655)) (buf!3448 (_2!6886 lt!226655)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3003 (buf!3448 (_1!6886 lt!226655))) (currentByte!6344 (_1!6886 lt!226655)) (currentBit!6339 (_1!6886 lt!226655)))))))

(assert (= (and d!47223 res!122653) b!146619))

(assert (= (and b!146619 res!122654) b!146620))

(assert (= (and b!146620 (not res!122652)) b!146621))

(declare-fun m!226345 () Bool)

(assert (=> b!146619 m!226345))

(assert (=> b!146619 m!226145))

(assert (=> b!146621 m!226345))

(assert (=> b!146621 m!226345))

(declare-fun m!226347 () Bool)

(assert (=> b!146621 m!226347))

(assert (=> d!46763 d!47223))

(assert (=> d!46763 d!47193))

(declare-fun d!47225 () Bool)

(assert (=> d!47225 (isPrefixOf!0 lt!226658 (_2!6888 lt!226295))))

(declare-fun lt!227749 () Unit!9088)

(assert (=> d!47225 (= lt!227749 (choose!30 lt!226658 (_2!6888 lt!226295) (_2!6888 lt!226295)))))

(assert (=> d!47225 (isPrefixOf!0 lt!226658 (_2!6888 lt!226295))))

(assert (=> d!47225 (= (lemmaIsPrefixTransitive!0 lt!226658 (_2!6888 lt!226295) (_2!6888 lt!226295)) lt!227749)))

(declare-fun bs!11561 () Bool)

(assert (= bs!11561 d!47225))

(assert (=> bs!11561 m!225055))

(declare-fun m!226349 () Bool)

(assert (=> bs!11561 m!226349))

(assert (=> bs!11561 m!225055))

(assert (=> d!46763 d!47225))

(declare-fun d!47227 () Bool)

(declare-fun res!122656 () Bool)

(declare-fun e!97758 () Bool)

(assert (=> d!47227 (=> (not res!122656) (not e!97758))))

(assert (=> d!47227 (= res!122656 (= (size!3003 (buf!3448 lt!226658)) (size!3003 (buf!3448 (_2!6888 lt!226295)))))))

(assert (=> d!47227 (= (isPrefixOf!0 lt!226658 (_2!6888 lt!226295)) e!97758)))

(declare-fun b!146622 () Bool)

(declare-fun res!122657 () Bool)

(assert (=> b!146622 (=> (not res!122657) (not e!97758))))

(assert (=> b!146622 (= res!122657 (bvsle (bitIndex!0 (size!3003 (buf!3448 lt!226658)) (currentByte!6344 lt!226658) (currentBit!6339 lt!226658)) (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226295))) (currentByte!6344 (_2!6888 lt!226295)) (currentBit!6339 (_2!6888 lt!226295)))))))

(declare-fun b!146623 () Bool)

(declare-fun e!97757 () Bool)

(assert (=> b!146623 (= e!97758 e!97757)))

(declare-fun res!122655 () Bool)

(assert (=> b!146623 (=> res!122655 e!97757)))

(assert (=> b!146623 (= res!122655 (= (size!3003 (buf!3448 lt!226658)) #b00000000000000000000000000000000))))

(declare-fun b!146624 () Bool)

(assert (=> b!146624 (= e!97757 (arrayBitRangesEq!0 (buf!3448 lt!226658) (buf!3448 (_2!6888 lt!226295)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3003 (buf!3448 lt!226658)) (currentByte!6344 lt!226658) (currentBit!6339 lt!226658))))))

(assert (= (and d!47227 res!122656) b!146622))

(assert (= (and b!146622 res!122657) b!146623))

(assert (= (and b!146623 (not res!122655)) b!146624))

(assert (=> b!146622 m!226339))

(assert (=> b!146622 m!224701))

(assert (=> b!146624 m!226339))

(assert (=> b!146624 m!226339))

(declare-fun m!226351 () Bool)

(assert (=> b!146624 m!226351))

(assert (=> d!46763 d!47227))

(declare-fun d!47229 () Bool)

(assert (=> d!47229 (isPrefixOf!0 lt!226658 (_2!6888 lt!226295))))

(declare-fun lt!227750 () Unit!9088)

(assert (=> d!47229 (= lt!227750 (choose!30 lt!226658 thiss!1634 (_2!6888 lt!226295)))))

(assert (=> d!47229 (isPrefixOf!0 lt!226658 thiss!1634)))

(assert (=> d!47229 (= (lemmaIsPrefixTransitive!0 lt!226658 thiss!1634 (_2!6888 lt!226295)) lt!227750)))

(declare-fun bs!11562 () Bool)

(assert (= bs!11562 d!47229))

(assert (=> bs!11562 m!225055))

(declare-fun m!226353 () Bool)

(assert (=> bs!11562 m!226353))

(declare-fun m!226355 () Bool)

(assert (=> bs!11562 m!226355))

(assert (=> d!46763 d!47229))

(declare-fun d!47231 () Bool)

(declare-fun res!122658 () Bool)

(declare-fun e!97759 () Bool)

(assert (=> d!47231 (=> res!122658 e!97759)))

(assert (=> d!47231 (= res!122658 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!47231 (= (arrayRangesEq!319 (_2!6885 lt!226286) (_2!6885 lt!226283) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!97759)))

(declare-fun b!146625 () Bool)

(declare-fun e!97760 () Bool)

(assert (=> b!146625 (= e!97759 e!97760)))

(declare-fun res!122659 () Bool)

(assert (=> b!146625 (=> (not res!122659) (not e!97760))))

(assert (=> b!146625 (= res!122659 (= (select (arr!3742 (_2!6885 lt!226286)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3742 (_2!6885 lt!226283)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!146626 () Bool)

(assert (=> b!146626 (= e!97760 (arrayRangesEq!319 (_2!6885 lt!226286) (_2!6885 lt!226283) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!47231 (not res!122658)) b!146625))

(assert (= (and b!146625 res!122659) b!146626))

(assert (=> b!146625 m!226173))

(declare-fun m!226357 () Bool)

(assert (=> b!146625 m!226357))

(declare-fun m!226359 () Bool)

(assert (=> b!146626 m!226359))

(assert (=> b!146122 d!47231))

(declare-fun d!47233 () Bool)

(assert (=> d!47233 (= (remainingBits!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_1!6887 lt!226276)))) ((_ sign_extend 32) (currentByte!6344 (_1!6887 lt!226276))) ((_ sign_extend 32) (currentBit!6339 (_1!6887 lt!226276)))) (bvsub (bvmul ((_ sign_extend 32) (size!3003 (buf!3448 (_1!6887 lt!226276)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6344 (_1!6887 lt!226276))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6339 (_1!6887 lt!226276))))))))

(assert (=> d!46779 d!47233))

(declare-fun d!47235 () Bool)

(assert (=> d!47235 (= (invariant!0 (currentBit!6339 (_1!6887 lt!226276)) (currentByte!6344 (_1!6887 lt!226276)) (size!3003 (buf!3448 (_1!6887 lt!226276)))) (and (bvsge (currentBit!6339 (_1!6887 lt!226276)) #b00000000000000000000000000000000) (bvslt (currentBit!6339 (_1!6887 lt!226276)) #b00000000000000000000000000001000) (bvsge (currentByte!6344 (_1!6887 lt!226276)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6344 (_1!6887 lt!226276)) (size!3003 (buf!3448 (_1!6887 lt!226276)))) (and (= (currentBit!6339 (_1!6887 lt!226276)) #b00000000000000000000000000000000) (= (currentByte!6344 (_1!6887 lt!226276)) (size!3003 (buf!3448 (_1!6887 lt!226276))))))))))

(assert (=> d!46779 d!47235))

(declare-fun lt!227771 () tuple2!13082)

(declare-fun c!7944 () Bool)

(declare-fun lt!227770 () array!6633)

(declare-fun lt!227754 () array!6633)

(declare-fun lt!227780 () (_ BitVec 32))

(declare-fun call!1942 () Bool)

(declare-fun bm!1938 () Bool)

(declare-fun lt!227772 () (_ BitVec 32))

(assert (=> bm!1938 (= call!1942 (arrayRangesEq!319 (ite c!7944 arr!237 lt!227770) (ite c!7944 (array!6634 (store (arr!3742 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6892 lt!227771)) (size!3003 arr!237)) lt!227754) (ite c!7944 #b00000000000000000000000000000000 lt!227772) (ite c!7944 (bvadd #b00000000000000000000000000000001 from!447) lt!227780)))))

(declare-fun b!146627 () Bool)

(declare-fun e!97763 () Bool)

(declare-fun lt!227779 () tuple3!566)

(assert (=> b!146627 (= e!97763 (= (select (arr!3742 (_3!350 lt!227779)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6887 (readBytePure!0 (_1!6886 lt!226280)))))))

(assert (=> b!146627 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!3003 (_3!350 lt!227779))))))

(declare-fun bm!1939 () Bool)

(declare-fun call!1943 () (_ BitVec 64))

(assert (=> bm!1939 (= call!1943 (bitIndex!0 (size!3003 (buf!3448 (_1!6886 lt!226280))) (currentByte!6344 (_1!6886 lt!226280)) (currentBit!6339 (_1!6886 lt!226280))))))

(declare-fun call!1941 () Bool)

(declare-fun bm!1940 () Bool)

(declare-fun lt!227756 () tuple3!566)

(assert (=> bm!1940 (= call!1941 (arrayRangesEq!319 arr!237 (ite c!7944 (_3!350 lt!227756) arr!237) #b00000000000000000000000000000000 (ite c!7944 (bvadd #b00000000000000000000000000000001 from!447) (size!3003 arr!237))))))

(declare-fun b!146628 () Bool)

(declare-fun e!97761 () tuple3!566)

(declare-fun lt!227784 () Unit!9088)

(assert (=> b!146628 (= e!97761 (tuple3!567 lt!227784 (_2!6891 lt!227756) (_3!350 lt!227756)))))

(assert (=> b!146628 (= lt!227771 (readByte!0 (_1!6886 lt!226280)))))

(declare-fun lt!227766 () array!6633)

(assert (=> b!146628 (= lt!227766 (array!6634 (store (arr!3742 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6892 lt!227771)) (size!3003 arr!237)))))

(declare-fun lt!227763 () (_ BitVec 64))

(assert (=> b!146628 (= lt!227763 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!227774 () (_ BitVec 32))

(assert (=> b!146628 (= lt!227774 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!227758 () Unit!9088)

(assert (=> b!146628 (= lt!227758 (validateOffsetBytesFromBitIndexLemma!0 (_1!6886 lt!226280) (_2!6892 lt!227771) lt!227763 lt!227774))))

(assert (=> b!146628 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6892 lt!227771)))) ((_ sign_extend 32) (currentByte!6344 (_2!6892 lt!227771))) ((_ sign_extend 32) (currentBit!6339 (_2!6892 lt!227771))) (bvsub lt!227774 ((_ extract 31 0) (bvsdiv (bvadd lt!227763 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!227777 () Unit!9088)

(assert (=> b!146628 (= lt!227777 lt!227758)))

(assert (=> b!146628 (= lt!227756 (readByteArrayLoop!0 (_2!6892 lt!227771) lt!227766 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!146628 (= (bitIndex!0 (size!3003 (buf!3448 (_2!6892 lt!227771))) (currentByte!6344 (_2!6892 lt!227771)) (currentBit!6339 (_2!6892 lt!227771))) (bvadd call!1943 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!227752 () Unit!9088)

(declare-fun Unit!9178 () Unit!9088)

(assert (=> b!146628 (= lt!227752 Unit!9178)))

(assert (=> b!146628 (= (bvadd (bitIndex!0 (size!3003 (buf!3448 (_2!6892 lt!227771))) (currentByte!6344 (_2!6892 lt!227771)) (currentBit!6339 (_2!6892 lt!227771))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3003 (buf!3448 (_2!6891 lt!227756))) (currentByte!6344 (_2!6891 lt!227756)) (currentBit!6339 (_2!6891 lt!227756))))))

(declare-fun lt!227761 () Unit!9088)

(declare-fun Unit!9179 () Unit!9088)

(assert (=> b!146628 (= lt!227761 Unit!9179)))

(assert (=> b!146628 (= (bvadd call!1943 (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3003 (buf!3448 (_2!6891 lt!227756))) (currentByte!6344 (_2!6891 lt!227756)) (currentBit!6339 (_2!6891 lt!227756))))))

(declare-fun lt!227768 () Unit!9088)

(declare-fun Unit!9180 () Unit!9088)

(assert (=> b!146628 (= lt!227768 Unit!9180)))

(assert (=> b!146628 (and (= (buf!3448 (_1!6886 lt!226280)) (buf!3448 (_2!6891 lt!227756))) (= (size!3003 arr!237) (size!3003 (_3!350 lt!227756))))))

(declare-fun lt!227775 () Unit!9088)

(declare-fun Unit!9181 () Unit!9088)

(assert (=> b!146628 (= lt!227775 Unit!9181)))

(declare-fun lt!227776 () Unit!9088)

(assert (=> b!146628 (= lt!227776 (arrayUpdatedAtPrefixLemma!11 arr!237 (bvadd #b00000000000000000000000000000001 from!447) (_1!6892 lt!227771)))))

(assert (=> b!146628 call!1942))

(declare-fun lt!227785 () Unit!9088)

(assert (=> b!146628 (= lt!227785 lt!227776)))

(declare-fun lt!227764 () (_ BitVec 32))

(assert (=> b!146628 (= lt!227764 #b00000000000000000000000000000000)))

(declare-fun lt!227778 () Unit!9088)

(assert (=> b!146628 (= lt!227778 (arrayRangesEqTransitive!51 arr!237 lt!227766 (_3!350 lt!227756) lt!227764 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!146628 (arrayRangesEq!319 arr!237 (_3!350 lt!227756) lt!227764 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!227781 () Unit!9088)

(assert (=> b!146628 (= lt!227781 lt!227778)))

(assert (=> b!146628 call!1941))

(declare-fun lt!227755 () Unit!9088)

(declare-fun Unit!9182 () Unit!9088)

(assert (=> b!146628 (= lt!227755 Unit!9182)))

(declare-fun lt!227773 () Unit!9088)

(assert (=> b!146628 (= lt!227773 (arrayRangesEqImpliesEq!11 lt!227766 (_3!350 lt!227756) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!146628 (= (select (store (arr!3742 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6892 lt!227771)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3742 (_3!350 lt!227756)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!227782 () Unit!9088)

(assert (=> b!146628 (= lt!227782 lt!227773)))

(declare-fun lt!227762 () Bool)

(assert (=> b!146628 (= lt!227762 (= (select (arr!3742 (_3!350 lt!227756)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6892 lt!227771)))))

(declare-fun Unit!9183 () Unit!9088)

(assert (=> b!146628 (= lt!227784 Unit!9183)))

(assert (=> b!146628 lt!227762))

(declare-fun b!146629 () Bool)

(declare-fun e!97762 () Bool)

(assert (=> b!146629 (= e!97762 (arrayRangesEq!319 arr!237 (_3!350 lt!227779) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun b!146630 () Bool)

(declare-fun lt!227753 () Unit!9088)

(assert (=> b!146630 (= e!97761 (tuple3!567 lt!227753 (_1!6886 lt!226280) arr!237))))

(assert (=> b!146630 (= call!1943 call!1943)))

(declare-fun lt!227783 () Unit!9088)

(declare-fun Unit!9184 () Unit!9088)

(assert (=> b!146630 (= lt!227783 Unit!9184)))

(declare-fun lt!227751 () Unit!9088)

(assert (=> b!146630 (= lt!227751 (arrayRangesEqReflexiveLemma!11 arr!237))))

(assert (=> b!146630 call!1941))

(declare-fun lt!227759 () Unit!9088)

(assert (=> b!146630 (= lt!227759 lt!227751)))

(assert (=> b!146630 (= lt!227770 arr!237)))

(assert (=> b!146630 (= lt!227754 arr!237)))

(declare-fun lt!227765 () (_ BitVec 32))

(assert (=> b!146630 (= lt!227765 #b00000000000000000000000000000000)))

(declare-fun lt!227760 () (_ BitVec 32))

(assert (=> b!146630 (= lt!227760 (size!3003 arr!237))))

(assert (=> b!146630 (= lt!227772 #b00000000000000000000000000000000)))

(assert (=> b!146630 (= lt!227780 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!146630 (= lt!227753 (arrayRangesEqSlicedLemma!11 lt!227770 lt!227754 lt!227765 lt!227760 lt!227772 lt!227780))))

(assert (=> b!146630 call!1942))

(declare-fun b!146631 () Bool)

(declare-fun res!122660 () Bool)

(assert (=> b!146631 (=> (not res!122660) (not e!97762))))

(assert (=> b!146631 (= res!122660 (and (= (buf!3448 (_1!6886 lt!226280)) (buf!3448 (_2!6891 lt!227779))) (= (size!3003 arr!237) (size!3003 (_3!350 lt!227779)))))))

(declare-fun d!47237 () Bool)

(assert (=> d!47237 e!97763))

(declare-fun res!122661 () Bool)

(assert (=> d!47237 (=> res!122661 e!97763)))

(assert (=> d!47237 (= res!122661 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!227767 () Bool)

(assert (=> d!47237 (= lt!227767 e!97762)))

(declare-fun res!122662 () Bool)

(assert (=> d!47237 (=> (not res!122662) (not e!97762))))

(declare-fun lt!227786 () (_ BitVec 64))

(declare-fun lt!227769 () (_ BitVec 64))

(assert (=> d!47237 (= res!122662 (= (bvadd lt!227786 lt!227769) (bitIndex!0 (size!3003 (buf!3448 (_2!6891 lt!227779))) (currentByte!6344 (_2!6891 lt!227779)) (currentBit!6339 (_2!6891 lt!227779)))))))

(assert (=> d!47237 (or (not (= (bvand lt!227786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!227769 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!227786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!227786 lt!227769) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!227757 () (_ BitVec 64))

(assert (=> d!47237 (= lt!227769 (bvmul lt!227757 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!47237 (or (= lt!227757 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!227757 #b0000000000000000000000000000000000000000000000000000000000001000) lt!227757)))))

(assert (=> d!47237 (= lt!227757 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!47237 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!47237 (= lt!227786 (bitIndex!0 (size!3003 (buf!3448 (_1!6886 lt!226280))) (currentByte!6344 (_1!6886 lt!226280)) (currentBit!6339 (_1!6886 lt!226280))))))

(assert (=> d!47237 (= lt!227779 e!97761)))

(assert (=> d!47237 (= c!7944 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!47237 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3003 arr!237)))))

(assert (=> d!47237 (= (readByteArrayLoop!0 (_1!6886 lt!226280) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!227779)))

(assert (= (and d!47237 c!7944) b!146628))

(assert (= (and d!47237 (not c!7944)) b!146630))

(assert (= (or b!146628 b!146630) bm!1938))

(assert (= (or b!146628 b!146630) bm!1940))

(assert (= (or b!146628 b!146630) bm!1939))

(assert (= (and d!47237 res!122662) b!146631))

(assert (= (and b!146631 res!122660) b!146629))

(assert (= (and d!47237 (not res!122661)) b!146627))

(declare-fun m!226361 () Bool)

(assert (=> bm!1939 m!226361))

(declare-fun m!226363 () Bool)

(assert (=> bm!1940 m!226363))

(assert (=> b!146630 m!225997))

(declare-fun m!226365 () Bool)

(assert (=> b!146630 m!226365))

(declare-fun m!226367 () Bool)

(assert (=> b!146627 m!226367))

(declare-fun m!226369 () Bool)

(assert (=> b!146627 m!226369))

(declare-fun m!226371 () Bool)

(assert (=> b!146629 m!226371))

(declare-fun m!226373 () Bool)

(assert (=> bm!1938 m!226373))

(declare-fun m!226375 () Bool)

(assert (=> bm!1938 m!226375))

(declare-fun m!226377 () Bool)

(assert (=> b!146628 m!226377))

(assert (=> b!146628 m!226373))

(declare-fun m!226379 () Bool)

(assert (=> b!146628 m!226379))

(declare-fun m!226381 () Bool)

(assert (=> b!146628 m!226381))

(declare-fun m!226383 () Bool)

(assert (=> b!146628 m!226383))

(declare-fun m!226385 () Bool)

(assert (=> b!146628 m!226385))

(declare-fun m!226387 () Bool)

(assert (=> b!146628 m!226387))

(declare-fun m!226389 () Bool)

(assert (=> b!146628 m!226389))

(declare-fun m!226391 () Bool)

(assert (=> b!146628 m!226391))

(declare-fun m!226393 () Bool)

(assert (=> b!146628 m!226393))

(declare-fun m!226395 () Bool)

(assert (=> b!146628 m!226395))

(declare-fun m!226397 () Bool)

(assert (=> b!146628 m!226397))

(declare-fun m!226399 () Bool)

(assert (=> b!146628 m!226399))

(declare-fun m!226401 () Bool)

(assert (=> d!47237 m!226401))

(assert (=> d!47237 m!226361))

(assert (=> d!46741 d!47237))

(assert (=> d!46771 d!46791))

(declare-fun d!47239 () Bool)

(assert (=> d!47239 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226295)))) ((_ sign_extend 32) (currentByte!6344 thiss!1634)) ((_ sign_extend 32) (currentBit!6339 thiss!1634)) (bvsub to!404 from!447))))

(assert (=> d!47239 true))

(declare-fun _$5!67 () Unit!9088)

(assert (=> d!47239 (= (choose!26 thiss!1634 (buf!3448 (_2!6888 lt!226295)) (bvsub to!404 from!447) (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634))) _$5!67)))

(declare-fun bs!11563 () Bool)

(assert (= bs!11563 d!47239))

(assert (=> bs!11563 m!224763))

(assert (=> d!46771 d!47239))

(declare-fun b!146632 () Bool)

(declare-fun res!122667 () Bool)

(declare-fun lt!227789 () (_ BitVec 32))

(assert (=> b!146632 (= res!122667 (= lt!227789 #b00000000000000000000000000000000))))

(declare-fun e!97769 () Bool)

(assert (=> b!146632 (=> res!122667 e!97769)))

(declare-fun e!97767 () Bool)

(assert (=> b!146632 (= e!97767 e!97769)))

(declare-fun b!146633 () Bool)

(declare-fun call!1944 () Bool)

(assert (=> b!146633 (= e!97769 call!1944)))

(declare-fun b!146634 () Bool)

(declare-fun e!97766 () Bool)

(declare-fun e!97768 () Bool)

(assert (=> b!146634 (= e!97766 e!97768)))

(declare-fun res!122663 () Bool)

(assert (=> b!146634 (=> (not res!122663) (not e!97768))))

(declare-fun e!97764 () Bool)

(assert (=> b!146634 (= res!122663 e!97764)))

(declare-fun res!122666 () Bool)

(assert (=> b!146634 (=> res!122666 e!97764)))

(declare-fun lt!227788 () tuple4!136)

(assert (=> b!146634 (= res!122666 (bvsge (_1!6898 lt!227788) (_2!6898 lt!227788)))))

(assert (=> b!146634 (= lt!227789 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3003 (buf!3448 thiss!1634)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!227787 () (_ BitVec 32))

(assert (=> b!146634 (= lt!227787 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146634 (= lt!227788 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3003 (buf!3448 thiss!1634)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634))))))

(declare-fun d!47241 () Bool)

(declare-fun res!122664 () Bool)

(assert (=> d!47241 (=> res!122664 e!97766)))

(assert (=> d!47241 (= res!122664 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3003 (buf!3448 thiss!1634)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634))))))

(assert (=> d!47241 (= (arrayBitRangesEq!0 (buf!3448 thiss!1634) (buf!3448 (_2!6888 lt!226295)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3003 (buf!3448 thiss!1634)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634))) e!97766)))

(declare-fun b!146635 () Bool)

(declare-fun e!97765 () Bool)

(assert (=> b!146635 (= e!97768 e!97765)))

(declare-fun c!7945 () Bool)

(assert (=> b!146635 (= c!7945 (= (_3!353 lt!227788) (_4!68 lt!227788)))))

(declare-fun b!146636 () Bool)

(assert (=> b!146636 (= e!97764 (arrayRangesEq!319 (buf!3448 thiss!1634) (buf!3448 (_2!6888 lt!226295)) (_1!6898 lt!227788) (_2!6898 lt!227788)))))

(declare-fun bm!1941 () Bool)

(assert (=> bm!1941 (= call!1944 (byteRangesEq!0 (ite c!7945 (select (arr!3742 (buf!3448 thiss!1634)) (_3!353 lt!227788)) (select (arr!3742 (buf!3448 thiss!1634)) (_4!68 lt!227788))) (ite c!7945 (select (arr!3742 (buf!3448 (_2!6888 lt!226295))) (_3!353 lt!227788)) (select (arr!3742 (buf!3448 (_2!6888 lt!226295))) (_4!68 lt!227788))) (ite c!7945 lt!227787 #b00000000000000000000000000000000) lt!227789))))

(declare-fun b!146637 () Bool)

(assert (=> b!146637 (= e!97765 e!97767)))

(declare-fun res!122665 () Bool)

(assert (=> b!146637 (= res!122665 (byteRangesEq!0 (select (arr!3742 (buf!3448 thiss!1634)) (_3!353 lt!227788)) (select (arr!3742 (buf!3448 (_2!6888 lt!226295))) (_3!353 lt!227788)) lt!227787 #b00000000000000000000000000001000))))

(assert (=> b!146637 (=> (not res!122665) (not e!97767))))

(declare-fun b!146638 () Bool)

(assert (=> b!146638 (= e!97765 call!1944)))

(assert (= (and d!47241 (not res!122664)) b!146634))

(assert (= (and b!146634 (not res!122666)) b!146636))

(assert (= (and b!146634 res!122663) b!146635))

(assert (= (and b!146635 c!7945) b!146638))

(assert (= (and b!146635 (not c!7945)) b!146637))

(assert (= (and b!146637 res!122665) b!146632))

(assert (= (and b!146632 (not res!122667)) b!146633))

(assert (= (or b!146638 b!146633) bm!1941))

(assert (=> b!146634 m!224711))

(assert (=> b!146634 m!226323))

(declare-fun m!226403 () Bool)

(assert (=> b!146636 m!226403))

(declare-fun m!226405 () Bool)

(assert (=> bm!1941 m!226405))

(declare-fun m!226407 () Bool)

(assert (=> bm!1941 m!226407))

(declare-fun m!226409 () Bool)

(assert (=> bm!1941 m!226409))

(declare-fun m!226411 () Bool)

(assert (=> bm!1941 m!226411))

(declare-fun m!226413 () Bool)

(assert (=> bm!1941 m!226413))

(assert (=> b!146637 m!226411))

(assert (=> b!146637 m!226405))

(assert (=> b!146637 m!226411))

(assert (=> b!146637 m!226405))

(declare-fun m!226415 () Bool)

(assert (=> b!146637 m!226415))

(assert (=> b!146079 d!47241))

(assert (=> b!146079 d!46739))

(declare-fun d!47243 () Bool)

(declare-fun e!97770 () Bool)

(assert (=> d!47243 e!97770))

(declare-fun res!122668 () Bool)

(assert (=> d!47243 (=> (not res!122668) (not e!97770))))

(declare-fun lt!227792 () (_ BitVec 64))

(declare-fun lt!227791 () (_ BitVec 64))

(declare-fun lt!227793 () (_ BitVec 64))

(assert (=> d!47243 (= res!122668 (= lt!227792 (bvsub lt!227793 lt!227791)))))

(assert (=> d!47243 (or (= (bvand lt!227793 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!227791 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!227793 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!227793 lt!227791) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47243 (= lt!227791 (remainingBits!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_1!6887 lt!226646)))) ((_ sign_extend 32) (currentByte!6344 (_1!6887 lt!226646))) ((_ sign_extend 32) (currentBit!6339 (_1!6887 lt!226646)))))))

(declare-fun lt!227794 () (_ BitVec 64))

(declare-fun lt!227795 () (_ BitVec 64))

(assert (=> d!47243 (= lt!227793 (bvmul lt!227794 lt!227795))))

(assert (=> d!47243 (or (= lt!227794 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!227795 (bvsdiv (bvmul lt!227794 lt!227795) lt!227794)))))

(assert (=> d!47243 (= lt!227795 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47243 (= lt!227794 ((_ sign_extend 32) (size!3003 (buf!3448 (_1!6887 lt!226646)))))))

(assert (=> d!47243 (= lt!227792 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6344 (_1!6887 lt!226646))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6339 (_1!6887 lt!226646)))))))

(assert (=> d!47243 (invariant!0 (currentBit!6339 (_1!6887 lt!226646)) (currentByte!6344 (_1!6887 lt!226646)) (size!3003 (buf!3448 (_1!6887 lt!226646))))))

(assert (=> d!47243 (= (bitIndex!0 (size!3003 (buf!3448 (_1!6887 lt!226646))) (currentByte!6344 (_1!6887 lt!226646)) (currentBit!6339 (_1!6887 lt!226646))) lt!227792)))

(declare-fun b!146639 () Bool)

(declare-fun res!122669 () Bool)

(assert (=> b!146639 (=> (not res!122669) (not e!97770))))

(assert (=> b!146639 (= res!122669 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!227792))))

(declare-fun b!146640 () Bool)

(declare-fun lt!227790 () (_ BitVec 64))

(assert (=> b!146640 (= e!97770 (bvsle lt!227792 (bvmul lt!227790 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146640 (or (= lt!227790 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!227790 #b0000000000000000000000000000000000000000000000000000000000001000) lt!227790)))))

(assert (=> b!146640 (= lt!227790 ((_ sign_extend 32) (size!3003 (buf!3448 (_1!6887 lt!226646)))))))

(assert (= (and d!47243 res!122668) b!146639))

(assert (= (and b!146639 res!122669) b!146640))

(declare-fun m!226417 () Bool)

(assert (=> d!47243 m!226417))

(declare-fun m!226419 () Bool)

(assert (=> d!47243 m!226419))

(assert (=> d!46761 d!47243))

(declare-fun d!47245 () Bool)

(declare-fun e!97771 () Bool)

(assert (=> d!47245 e!97771))

(declare-fun res!122670 () Bool)

(assert (=> d!47245 (=> (not res!122670) (not e!97771))))

(declare-fun lt!227797 () (_ BitVec 64))

(declare-fun lt!227799 () (_ BitVec 64))

(declare-fun lt!227798 () (_ BitVec 64))

(assert (=> d!47245 (= res!122670 (= lt!227798 (bvsub lt!227799 lt!227797)))))

(assert (=> d!47245 (or (= (bvand lt!227799 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!227797 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!227799 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!227799 lt!227797) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47245 (= lt!227797 (remainingBits!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_1!6887 lt!226647)))) ((_ sign_extend 32) (currentByte!6344 (_1!6887 lt!226647))) ((_ sign_extend 32) (currentBit!6339 (_1!6887 lt!226647)))))))

(declare-fun lt!227800 () (_ BitVec 64))

(declare-fun lt!227801 () (_ BitVec 64))

(assert (=> d!47245 (= lt!227799 (bvmul lt!227800 lt!227801))))

(assert (=> d!47245 (or (= lt!227800 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!227801 (bvsdiv (bvmul lt!227800 lt!227801) lt!227800)))))

(assert (=> d!47245 (= lt!227801 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47245 (= lt!227800 ((_ sign_extend 32) (size!3003 (buf!3448 (_1!6887 lt!226647)))))))

(assert (=> d!47245 (= lt!227798 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6344 (_1!6887 lt!226647))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6339 (_1!6887 lt!226647)))))))

(assert (=> d!47245 (invariant!0 (currentBit!6339 (_1!6887 lt!226647)) (currentByte!6344 (_1!6887 lt!226647)) (size!3003 (buf!3448 (_1!6887 lt!226647))))))

(assert (=> d!47245 (= (bitIndex!0 (size!3003 (buf!3448 (_1!6887 lt!226647))) (currentByte!6344 (_1!6887 lt!226647)) (currentBit!6339 (_1!6887 lt!226647))) lt!227798)))

(declare-fun b!146641 () Bool)

(declare-fun res!122671 () Bool)

(assert (=> b!146641 (=> (not res!122671) (not e!97771))))

(assert (=> b!146641 (= res!122671 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!227798))))

(declare-fun b!146642 () Bool)

(declare-fun lt!227796 () (_ BitVec 64))

(assert (=> b!146642 (= e!97771 (bvsle lt!227798 (bvmul lt!227796 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146642 (or (= lt!227796 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!227796 #b0000000000000000000000000000000000000000000000000000000000001000) lt!227796)))))

(assert (=> b!146642 (= lt!227796 ((_ sign_extend 32) (size!3003 (buf!3448 (_1!6887 lt!226647)))))))

(assert (= (and d!47245 res!122670) b!146641))

(assert (= (and b!146641 res!122671) b!146642))

(declare-fun m!226421 () Bool)

(assert (=> d!47245 m!226421))

(declare-fun m!226423 () Bool)

(assert (=> d!47245 m!226423))

(assert (=> d!46761 d!47245))

(declare-fun d!47247 () Bool)

(declare-fun lt!227802 () tuple2!13082)

(assert (=> d!47247 (= lt!227802 (readByte!0 lt!226649))))

(assert (=> d!47247 (= (readBytePure!0 lt!226649) (tuple2!13077 (_2!6892 lt!227802) (_1!6892 lt!227802)))))

(declare-fun bs!11564 () Bool)

(assert (= bs!11564 d!47247))

(declare-fun m!226425 () Bool)

(assert (=> bs!11564 m!226425))

(assert (=> d!46761 d!47247))

(assert (=> d!46761 d!46800))

(declare-fun d!47249 () Bool)

(declare-fun e!97774 () Bool)

(assert (=> d!47249 e!97774))

(declare-fun res!122674 () Bool)

(assert (=> d!47249 (=> (not res!122674) (not e!97774))))

(declare-fun lt!227807 () tuple2!13076)

(declare-fun lt!227808 () tuple2!13076)

(assert (=> d!47249 (= res!122674 (= (bitIndex!0 (size!3003 (buf!3448 (_1!6887 lt!227807))) (currentByte!6344 (_1!6887 lt!227807)) (currentBit!6339 (_1!6887 lt!227807))) (bitIndex!0 (size!3003 (buf!3448 (_1!6887 lt!227808))) (currentByte!6344 (_1!6887 lt!227808)) (currentBit!6339 (_1!6887 lt!227808)))))))

(assert (=> d!47249 (= lt!227808 (readBytePure!0 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 lt!226287) (currentBit!6339 lt!226287))))))

(assert (=> d!47249 (= lt!227807 (readBytePure!0 lt!226287))))

(assert (=> d!47249 true))

(declare-fun _$8!84 () Unit!9088)

(assert (=> d!47249 (= (choose!14 lt!226287 (_2!6888 lt!226295) lt!226649 lt!226646 (tuple2!13077 (_1!6887 lt!226646) (_2!6887 lt!226646)) (_1!6887 lt!226646) (_2!6887 lt!226646) lt!226647 (tuple2!13077 (_1!6887 lt!226647) (_2!6887 lt!226647)) (_1!6887 lt!226647) (_2!6887 lt!226647)) _$8!84)))

(declare-fun b!146645 () Bool)

(assert (=> b!146645 (= e!97774 (= (_2!6887 lt!227807) (_2!6887 lt!227808)))))

(assert (= (and d!47249 res!122674) b!146645))

(declare-fun m!226427 () Bool)

(assert (=> d!47249 m!226427))

(declare-fun m!226429 () Bool)

(assert (=> d!47249 m!226429))

(declare-fun m!226431 () Bool)

(assert (=> d!47249 m!226431))

(assert (=> d!47249 m!224729))

(assert (=> d!46761 d!47249))

(declare-fun d!47251 () Bool)

(declare-fun res!122676 () Bool)

(declare-fun e!97776 () Bool)

(assert (=> d!47251 (=> (not res!122676) (not e!97776))))

(assert (=> d!47251 (= res!122676 (= (size!3003 (buf!3448 thiss!1634)) (size!3003 (buf!3448 (_2!6888 lt!226696)))))))

(assert (=> d!47251 (= (isPrefixOf!0 thiss!1634 (_2!6888 lt!226696)) e!97776)))

(declare-fun b!146646 () Bool)

(declare-fun res!122677 () Bool)

(assert (=> b!146646 (=> (not res!122677) (not e!97776))))

(assert (=> b!146646 (= res!122677 (bvsle (bitIndex!0 (size!3003 (buf!3448 thiss!1634)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634)) (bitIndex!0 (size!3003 (buf!3448 (_2!6888 lt!226696))) (currentByte!6344 (_2!6888 lt!226696)) (currentBit!6339 (_2!6888 lt!226696)))))))

(declare-fun b!146647 () Bool)

(declare-fun e!97775 () Bool)

(assert (=> b!146647 (= e!97776 e!97775)))

(declare-fun res!122675 () Bool)

(assert (=> b!146647 (=> res!122675 e!97775)))

(assert (=> b!146647 (= res!122675 (= (size!3003 (buf!3448 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!146648 () Bool)

(assert (=> b!146648 (= e!97775 (arrayBitRangesEq!0 (buf!3448 thiss!1634) (buf!3448 (_2!6888 lt!226696)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3003 (buf!3448 thiss!1634)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634))))))

(assert (= (and d!47251 res!122676) b!146646))

(assert (= (and b!146646 res!122677) b!146647))

(assert (= (and b!146647 (not res!122675)) b!146648))

(assert (=> b!146646 m!224711))

(assert (=> b!146646 m!225087))

(assert (=> b!146648 m!224711))

(assert (=> b!146648 m!224711))

(declare-fun m!226433 () Bool)

(assert (=> b!146648 m!226433))

(assert (=> b!146097 d!47251))

(assert (=> b!146083 d!46739))

(declare-fun d!47253 () Bool)

(assert (=> d!47253 (arrayBitRangesEq!0 (buf!3448 (_2!6888 lt!226295)) (buf!3448 thiss!1634) lt!226651 lt!226659)))

(declare-fun lt!227809 () Unit!9088)

(assert (=> d!47253 (= lt!227809 (choose!8 (buf!3448 thiss!1634) (buf!3448 (_2!6888 lt!226295)) lt!226651 lt!226659))))

(assert (=> d!47253 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!226651) (bvsle lt!226651 lt!226659))))

(assert (=> d!47253 (= (arrayBitRangesEqSymmetric!0 (buf!3448 thiss!1634) (buf!3448 (_2!6888 lt!226295)) lt!226651 lt!226659) lt!227809)))

(declare-fun bs!11565 () Bool)

(assert (= bs!11565 d!47253))

(assert (=> bs!11565 m!225045))

(declare-fun m!226435 () Bool)

(assert (=> bs!11565 m!226435))

(assert (=> b!146083 d!47253))

(declare-fun b!146649 () Bool)

(declare-fun res!122682 () Bool)

(declare-fun lt!227812 () (_ BitVec 32))

(assert (=> b!146649 (= res!122682 (= lt!227812 #b00000000000000000000000000000000))))

(declare-fun e!97782 () Bool)

(assert (=> b!146649 (=> res!122682 e!97782)))

(declare-fun e!97780 () Bool)

(assert (=> b!146649 (= e!97780 e!97782)))

(declare-fun b!146650 () Bool)

(declare-fun call!1945 () Bool)

(assert (=> b!146650 (= e!97782 call!1945)))

(declare-fun b!146651 () Bool)

(declare-fun e!97779 () Bool)

(declare-fun e!97781 () Bool)

(assert (=> b!146651 (= e!97779 e!97781)))

(declare-fun res!122678 () Bool)

(assert (=> b!146651 (=> (not res!122678) (not e!97781))))

(declare-fun e!97777 () Bool)

(assert (=> b!146651 (= res!122678 e!97777)))

(declare-fun res!122681 () Bool)

(assert (=> b!146651 (=> res!122681 e!97777)))

(declare-fun lt!227811 () tuple4!136)

(assert (=> b!146651 (= res!122681 (bvsge (_1!6898 lt!227811) (_2!6898 lt!227811)))))

(assert (=> b!146651 (= lt!227812 ((_ extract 31 0) (bvsrem lt!226659 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!227810 () (_ BitVec 32))

(assert (=> b!146651 (= lt!227810 ((_ extract 31 0) (bvsrem lt!226651 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146651 (= lt!227811 (arrayBitIndices!0 lt!226651 lt!226659))))

(declare-fun d!47255 () Bool)

(declare-fun res!122679 () Bool)

(assert (=> d!47255 (=> res!122679 e!97779)))

(assert (=> d!47255 (= res!122679 (bvsge lt!226651 lt!226659))))

(assert (=> d!47255 (= (arrayBitRangesEq!0 (buf!3448 (_2!6888 lt!226295)) (buf!3448 thiss!1634) lt!226651 lt!226659) e!97779)))

(declare-fun b!146652 () Bool)

(declare-fun e!97778 () Bool)

(assert (=> b!146652 (= e!97781 e!97778)))

(declare-fun c!7946 () Bool)

(assert (=> b!146652 (= c!7946 (= (_3!353 lt!227811) (_4!68 lt!227811)))))

(declare-fun b!146653 () Bool)

(assert (=> b!146653 (= e!97777 (arrayRangesEq!319 (buf!3448 (_2!6888 lt!226295)) (buf!3448 thiss!1634) (_1!6898 lt!227811) (_2!6898 lt!227811)))))

(declare-fun bm!1942 () Bool)

(assert (=> bm!1942 (= call!1945 (byteRangesEq!0 (ite c!7946 (select (arr!3742 (buf!3448 (_2!6888 lt!226295))) (_3!353 lt!227811)) (select (arr!3742 (buf!3448 (_2!6888 lt!226295))) (_4!68 lt!227811))) (ite c!7946 (select (arr!3742 (buf!3448 thiss!1634)) (_3!353 lt!227811)) (select (arr!3742 (buf!3448 thiss!1634)) (_4!68 lt!227811))) (ite c!7946 lt!227810 #b00000000000000000000000000000000) lt!227812))))

(declare-fun b!146654 () Bool)

(assert (=> b!146654 (= e!97778 e!97780)))

(declare-fun res!122680 () Bool)

(assert (=> b!146654 (= res!122680 (byteRangesEq!0 (select (arr!3742 (buf!3448 (_2!6888 lt!226295))) (_3!353 lt!227811)) (select (arr!3742 (buf!3448 thiss!1634)) (_3!353 lt!227811)) lt!227810 #b00000000000000000000000000001000))))

(assert (=> b!146654 (=> (not res!122680) (not e!97780))))

(declare-fun b!146655 () Bool)

(assert (=> b!146655 (= e!97778 call!1945)))

(assert (= (and d!47255 (not res!122679)) b!146651))

(assert (= (and b!146651 (not res!122681)) b!146653))

(assert (= (and b!146651 res!122678) b!146652))

(assert (= (and b!146652 c!7946) b!146655))

(assert (= (and b!146652 (not c!7946)) b!146654))

(assert (= (and b!146654 res!122680) b!146649))

(assert (= (and b!146649 (not res!122682)) b!146650))

(assert (= (or b!146655 b!146650) bm!1942))

(declare-fun m!226437 () Bool)

(assert (=> b!146651 m!226437))

(declare-fun m!226439 () Bool)

(assert (=> b!146653 m!226439))

(declare-fun m!226441 () Bool)

(assert (=> bm!1942 m!226441))

(declare-fun m!226443 () Bool)

(assert (=> bm!1942 m!226443))

(declare-fun m!226445 () Bool)

(assert (=> bm!1942 m!226445))

(declare-fun m!226447 () Bool)

(assert (=> bm!1942 m!226447))

(declare-fun m!226449 () Bool)

(assert (=> bm!1942 m!226449))

(assert (=> b!146654 m!226447))

(assert (=> b!146654 m!226441))

(assert (=> b!146654 m!226447))

(assert (=> b!146654 m!226441))

(declare-fun m!226451 () Bool)

(assert (=> b!146654 m!226451))

(assert (=> b!146083 d!47255))

(declare-fun lt!227817 () (_ BitVec 8))

(declare-fun lt!227815 () (_ BitVec 8))

(declare-fun d!47257 () Bool)

(assert (=> d!47257 (= lt!227817 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3742 (buf!3448 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634)))) (currentByte!6344 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634))))) ((_ sign_extend 24) lt!227815))))))

(assert (=> d!47257 (= lt!227815 ((_ extract 7 0) (currentBit!6339 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634)))))))

(declare-fun e!97783 () Bool)

(assert (=> d!47257 e!97783))

(declare-fun res!122683 () Bool)

(assert (=> d!47257 (=> (not res!122683) (not e!97783))))

(assert (=> d!47257 (= res!122683 (validate_offset_bits!1 ((_ sign_extend 32) (size!3003 (buf!3448 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634))))) ((_ sign_extend 32) (currentByte!6344 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634)))) ((_ sign_extend 32) (currentBit!6339 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9185 () Unit!9088)

(declare-fun Unit!9186 () Unit!9088)

(assert (=> d!47257 (= (readByte!0 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634))) (tuple2!13083 (_2!6897 (ite (bvsgt ((_ sign_extend 24) lt!227815) #b00000000000000000000000000000000) (tuple2!13089 Unit!9185 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!227817) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3742 (buf!3448 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634)))) (bvadd (currentByte!6344 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!227815)))))))) (tuple2!13089 Unit!9186 lt!227817))) (BitStream!5265 (buf!3448 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634))) (bvadd (currentByte!6344 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634))) #b00000000000000000000000000000001) (currentBit!6339 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634))))))))

(declare-fun b!146656 () Bool)

(declare-fun e!97784 () Bool)

(assert (=> b!146656 (= e!97783 e!97784)))

(declare-fun res!122684 () Bool)

(assert (=> b!146656 (=> (not res!122684) (not e!97784))))

(declare-fun lt!227813 () tuple2!13082)

(assert (=> b!146656 (= res!122684 (= (buf!3448 (_2!6892 lt!227813)) (buf!3448 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634)))))))

(declare-fun lt!227816 () (_ BitVec 8))

(declare-fun lt!227819 () (_ BitVec 8))

(declare-fun Unit!9187 () Unit!9088)

(declare-fun Unit!9188 () Unit!9088)

(assert (=> b!146656 (= lt!227813 (tuple2!13083 (_2!6897 (ite (bvsgt ((_ sign_extend 24) lt!227819) #b00000000000000000000000000000000) (tuple2!13089 Unit!9187 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!227816) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3742 (buf!3448 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634)))) (bvadd (currentByte!6344 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!227819)))))))) (tuple2!13089 Unit!9188 lt!227816))) (BitStream!5265 (buf!3448 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634))) (bvadd (currentByte!6344 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634))) #b00000000000000000000000000000001) (currentBit!6339 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634))))))))

(assert (=> b!146656 (= lt!227816 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3742 (buf!3448 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634)))) (currentByte!6344 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634))))) ((_ sign_extend 24) lt!227819))))))

(assert (=> b!146656 (= lt!227819 ((_ extract 7 0) (currentBit!6339 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634)))))))

(declare-fun lt!227814 () (_ BitVec 64))

(declare-fun b!146657 () Bool)

(declare-fun lt!227818 () (_ BitVec 64))

(assert (=> b!146657 (= e!97784 (= (bitIndex!0 (size!3003 (buf!3448 (_2!6892 lt!227813))) (currentByte!6344 (_2!6892 lt!227813)) (currentBit!6339 (_2!6892 lt!227813))) (bvadd lt!227818 lt!227814)))))

(assert (=> b!146657 (or (not (= (bvand lt!227818 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!227814 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!227818 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!227818 lt!227814) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146657 (= lt!227814 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!146657 (= lt!227818 (bitIndex!0 (size!3003 (buf!3448 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634)))) (currentByte!6344 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634))) (currentBit!6339 (BitStream!5265 (buf!3448 (_2!6888 lt!226295)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634)))))))

(assert (= (and d!47257 res!122683) b!146656))

(assert (= (and b!146656 res!122684) b!146657))

(declare-fun m!226453 () Bool)

(assert (=> d!47257 m!226453))

(declare-fun m!226455 () Bool)

(assert (=> d!47257 m!226455))

(declare-fun m!226457 () Bool)

(assert (=> d!47257 m!226457))

(assert (=> b!146656 m!226457))

(assert (=> b!146656 m!226453))

(declare-fun m!226459 () Bool)

(assert (=> b!146657 m!226459))

(declare-fun m!226461 () Bool)

(assert (=> b!146657 m!226461))

(assert (=> d!46757 d!47257))

(declare-fun d!47259 () Bool)

(assert (=> d!47259 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3003 (buf!3448 (_2!6888 lt!226290)))) ((_ sign_extend 32) (currentByte!6344 (_2!6888 lt!226290))) ((_ sign_extend 32) (currentBit!6339 (_2!6888 lt!226290))) (bvsub (bvsub to!404 from!447) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!47259 true))

(declare-fun _$7!76 () Unit!9088)

(assert (=> d!47259 (= (choose!57 thiss!1634 (_2!6888 lt!226290) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) _$7!76)))

(declare-fun bs!11566 () Bool)

(assert (= bs!11566 d!47259))

(declare-fun m!226463 () Bool)

(assert (=> bs!11566 m!226463))

(assert (=> d!46797 d!47259))

(assert (=> b!146069 d!46729))

(declare-fun d!47261 () Bool)

(assert (=> d!47261 (arrayBitRangesEq!0 (buf!3448 (_2!6888 lt!226295)) (buf!3448 (_2!6888 lt!226290)) lt!226616 lt!226624)))

(declare-fun lt!227820 () Unit!9088)

(assert (=> d!47261 (= lt!227820 (choose!8 (buf!3448 (_2!6888 lt!226290)) (buf!3448 (_2!6888 lt!226295)) lt!226616 lt!226624))))

(assert (=> d!47261 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!226616) (bvsle lt!226616 lt!226624))))

(assert (=> d!47261 (= (arrayBitRangesEqSymmetric!0 (buf!3448 (_2!6888 lt!226290)) (buf!3448 (_2!6888 lt!226295)) lt!226616 lt!226624) lt!227820)))

(declare-fun bs!11567 () Bool)

(assert (= bs!11567 d!47261))

(assert (=> bs!11567 m!225001))

(declare-fun m!226465 () Bool)

(assert (=> bs!11567 m!226465))

(assert (=> b!146069 d!47261))

(declare-fun b!146658 () Bool)

(declare-fun res!122689 () Bool)

(declare-fun lt!227823 () (_ BitVec 32))

(assert (=> b!146658 (= res!122689 (= lt!227823 #b00000000000000000000000000000000))))

(declare-fun e!97790 () Bool)

(assert (=> b!146658 (=> res!122689 e!97790)))

(declare-fun e!97788 () Bool)

(assert (=> b!146658 (= e!97788 e!97790)))

(declare-fun b!146659 () Bool)

(declare-fun call!1946 () Bool)

(assert (=> b!146659 (= e!97790 call!1946)))

(declare-fun b!146660 () Bool)

(declare-fun e!97787 () Bool)

(declare-fun e!97789 () Bool)

(assert (=> b!146660 (= e!97787 e!97789)))

(declare-fun res!122685 () Bool)

(assert (=> b!146660 (=> (not res!122685) (not e!97789))))

(declare-fun e!97785 () Bool)

(assert (=> b!146660 (= res!122685 e!97785)))

(declare-fun res!122688 () Bool)

(assert (=> b!146660 (=> res!122688 e!97785)))

(declare-fun lt!227822 () tuple4!136)

(assert (=> b!146660 (= res!122688 (bvsge (_1!6898 lt!227822) (_2!6898 lt!227822)))))

(assert (=> b!146660 (= lt!227823 ((_ extract 31 0) (bvsrem lt!226624 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!227821 () (_ BitVec 32))

(assert (=> b!146660 (= lt!227821 ((_ extract 31 0) (bvsrem lt!226616 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146660 (= lt!227822 (arrayBitIndices!0 lt!226616 lt!226624))))

(declare-fun d!47263 () Bool)

(declare-fun res!122686 () Bool)

(assert (=> d!47263 (=> res!122686 e!97787)))

(assert (=> d!47263 (= res!122686 (bvsge lt!226616 lt!226624))))

(assert (=> d!47263 (= (arrayBitRangesEq!0 (buf!3448 (_2!6888 lt!226295)) (buf!3448 (_2!6888 lt!226290)) lt!226616 lt!226624) e!97787)))

(declare-fun b!146661 () Bool)

(declare-fun e!97786 () Bool)

(assert (=> b!146661 (= e!97789 e!97786)))

(declare-fun c!7947 () Bool)

(assert (=> b!146661 (= c!7947 (= (_3!353 lt!227822) (_4!68 lt!227822)))))

(declare-fun b!146662 () Bool)

(assert (=> b!146662 (= e!97785 (arrayRangesEq!319 (buf!3448 (_2!6888 lt!226295)) (buf!3448 (_2!6888 lt!226290)) (_1!6898 lt!227822) (_2!6898 lt!227822)))))

(declare-fun bm!1943 () Bool)

(assert (=> bm!1943 (= call!1946 (byteRangesEq!0 (ite c!7947 (select (arr!3742 (buf!3448 (_2!6888 lt!226295))) (_3!353 lt!227822)) (select (arr!3742 (buf!3448 (_2!6888 lt!226295))) (_4!68 lt!227822))) (ite c!7947 (select (arr!3742 (buf!3448 (_2!6888 lt!226290))) (_3!353 lt!227822)) (select (arr!3742 (buf!3448 (_2!6888 lt!226290))) (_4!68 lt!227822))) (ite c!7947 lt!227821 #b00000000000000000000000000000000) lt!227823))))

(declare-fun b!146663 () Bool)

(assert (=> b!146663 (= e!97786 e!97788)))

(declare-fun res!122687 () Bool)

(assert (=> b!146663 (= res!122687 (byteRangesEq!0 (select (arr!3742 (buf!3448 (_2!6888 lt!226295))) (_3!353 lt!227822)) (select (arr!3742 (buf!3448 (_2!6888 lt!226290))) (_3!353 lt!227822)) lt!227821 #b00000000000000000000000000001000))))

(assert (=> b!146663 (=> (not res!122687) (not e!97788))))

(declare-fun b!146664 () Bool)

(assert (=> b!146664 (= e!97786 call!1946)))

(assert (= (and d!47263 (not res!122686)) b!146660))

(assert (= (and b!146660 (not res!122688)) b!146662))

(assert (= (and b!146660 res!122685) b!146661))

(assert (= (and b!146661 c!7947) b!146664))

(assert (= (and b!146661 (not c!7947)) b!146663))

(assert (= (and b!146663 res!122687) b!146658))

(assert (= (and b!146658 (not res!122689)) b!146659))

(assert (= (or b!146664 b!146659) bm!1943))

(declare-fun m!226467 () Bool)

(assert (=> b!146660 m!226467))

(declare-fun m!226469 () Bool)

(assert (=> b!146662 m!226469))

(declare-fun m!226471 () Bool)

(assert (=> bm!1943 m!226471))

(declare-fun m!226473 () Bool)

(assert (=> bm!1943 m!226473))

(declare-fun m!226475 () Bool)

(assert (=> bm!1943 m!226475))

(declare-fun m!226477 () Bool)

(assert (=> bm!1943 m!226477))

(declare-fun m!226479 () Bool)

(assert (=> bm!1943 m!226479))

(assert (=> b!146663 m!226477))

(assert (=> b!146663 m!226471))

(assert (=> b!146663 m!226477))

(assert (=> b!146663 m!226471))

(declare-fun m!226481 () Bool)

(assert (=> b!146663 m!226481))

(assert (=> b!146069 d!47263))

(declare-fun d!47265 () Bool)

(declare-fun lt!227828 () (_ BitVec 8))

(declare-fun lt!227826 () (_ BitVec 8))

(assert (=> d!47265 (= lt!227828 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3742 (buf!3448 (_1!6886 lt!226284))) (currentByte!6344 (_1!6886 lt!226284)))) ((_ sign_extend 24) lt!227826))))))

(assert (=> d!47265 (= lt!227826 ((_ extract 7 0) (currentBit!6339 (_1!6886 lt!226284))))))

(declare-fun e!97791 () Bool)

(assert (=> d!47265 e!97791))

(declare-fun res!122690 () Bool)

(assert (=> d!47265 (=> (not res!122690) (not e!97791))))

(assert (=> d!47265 (= res!122690 (validate_offset_bits!1 ((_ sign_extend 32) (size!3003 (buf!3448 (_1!6886 lt!226284)))) ((_ sign_extend 32) (currentByte!6344 (_1!6886 lt!226284))) ((_ sign_extend 32) (currentBit!6339 (_1!6886 lt!226284))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9189 () Unit!9088)

(declare-fun Unit!9190 () Unit!9088)

(assert (=> d!47265 (= (readByte!0 (_1!6886 lt!226284)) (tuple2!13083 (_2!6897 (ite (bvsgt ((_ sign_extend 24) lt!227826) #b00000000000000000000000000000000) (tuple2!13089 Unit!9189 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!227828) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3742 (buf!3448 (_1!6886 lt!226284))) (bvadd (currentByte!6344 (_1!6886 lt!226284)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!227826)))))))) (tuple2!13089 Unit!9190 lt!227828))) (BitStream!5265 (buf!3448 (_1!6886 lt!226284)) (bvadd (currentByte!6344 (_1!6886 lt!226284)) #b00000000000000000000000000000001) (currentBit!6339 (_1!6886 lt!226284)))))))

(declare-fun b!146665 () Bool)

(declare-fun e!97792 () Bool)

(assert (=> b!146665 (= e!97791 e!97792)))

(declare-fun res!122691 () Bool)

(assert (=> b!146665 (=> (not res!122691) (not e!97792))))

(declare-fun lt!227824 () tuple2!13082)

(assert (=> b!146665 (= res!122691 (= (buf!3448 (_2!6892 lt!227824)) (buf!3448 (_1!6886 lt!226284))))))

(declare-fun lt!227827 () (_ BitVec 8))

(declare-fun lt!227830 () (_ BitVec 8))

(declare-fun Unit!9191 () Unit!9088)

(declare-fun Unit!9192 () Unit!9088)

(assert (=> b!146665 (= lt!227824 (tuple2!13083 (_2!6897 (ite (bvsgt ((_ sign_extend 24) lt!227830) #b00000000000000000000000000000000) (tuple2!13089 Unit!9191 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!227827) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3742 (buf!3448 (_1!6886 lt!226284))) (bvadd (currentByte!6344 (_1!6886 lt!226284)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!227830)))))))) (tuple2!13089 Unit!9192 lt!227827))) (BitStream!5265 (buf!3448 (_1!6886 lt!226284)) (bvadd (currentByte!6344 (_1!6886 lt!226284)) #b00000000000000000000000000000001) (currentBit!6339 (_1!6886 lt!226284)))))))

(assert (=> b!146665 (= lt!227827 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3742 (buf!3448 (_1!6886 lt!226284))) (currentByte!6344 (_1!6886 lt!226284)))) ((_ sign_extend 24) lt!227830))))))

(assert (=> b!146665 (= lt!227830 ((_ extract 7 0) (currentBit!6339 (_1!6886 lt!226284))))))

(declare-fun lt!227825 () (_ BitVec 64))

(declare-fun b!146666 () Bool)

(declare-fun lt!227829 () (_ BitVec 64))

(assert (=> b!146666 (= e!97792 (= (bitIndex!0 (size!3003 (buf!3448 (_2!6892 lt!227824))) (currentByte!6344 (_2!6892 lt!227824)) (currentBit!6339 (_2!6892 lt!227824))) (bvadd lt!227829 lt!227825)))))

(assert (=> b!146666 (or (not (= (bvand lt!227829 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!227825 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!227829 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!227829 lt!227825) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146666 (= lt!227825 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!146666 (= lt!227829 (bitIndex!0 (size!3003 (buf!3448 (_1!6886 lt!226284))) (currentByte!6344 (_1!6886 lt!226284)) (currentBit!6339 (_1!6886 lt!226284))))))

(assert (= (and d!47265 res!122690) b!146665))

(assert (= (and b!146665 res!122691) b!146666))

(declare-fun m!226483 () Bool)

(assert (=> d!47265 m!226483))

(declare-fun m!226485 () Bool)

(assert (=> d!47265 m!226485))

(declare-fun m!226487 () Bool)

(assert (=> d!47265 m!226487))

(assert (=> b!146665 m!226487))

(assert (=> b!146665 m!226483))

(declare-fun m!226489 () Bool)

(assert (=> b!146666 m!226489))

(declare-fun m!226491 () Bool)

(assert (=> b!146666 m!226491))

(assert (=> d!46808 d!47265))

(declare-fun d!47267 () Bool)

(declare-fun res!122693 () Bool)

(declare-fun e!97794 () Bool)

(assert (=> d!47267 (=> (not res!122693) (not e!97794))))

(assert (=> d!47267 (= res!122693 (= (size!3003 (buf!3448 (_1!6886 lt!226655))) (size!3003 (buf!3448 thiss!1634))))))

(assert (=> d!47267 (= (isPrefixOf!0 (_1!6886 lt!226655) thiss!1634) e!97794)))

(declare-fun b!146667 () Bool)

(declare-fun res!122694 () Bool)

(assert (=> b!146667 (=> (not res!122694) (not e!97794))))

(assert (=> b!146667 (= res!122694 (bvsle (bitIndex!0 (size!3003 (buf!3448 (_1!6886 lt!226655))) (currentByte!6344 (_1!6886 lt!226655)) (currentBit!6339 (_1!6886 lt!226655))) (bitIndex!0 (size!3003 (buf!3448 thiss!1634)) (currentByte!6344 thiss!1634) (currentBit!6339 thiss!1634))))))

(declare-fun b!146668 () Bool)

(declare-fun e!97793 () Bool)

(assert (=> b!146668 (= e!97794 e!97793)))

(declare-fun res!122692 () Bool)

(assert (=> b!146668 (=> res!122692 e!97793)))

(assert (=> b!146668 (= res!122692 (= (size!3003 (buf!3448 (_1!6886 lt!226655))) #b00000000000000000000000000000000))))

(declare-fun b!146669 () Bool)

(assert (=> b!146669 (= e!97793 (arrayBitRangesEq!0 (buf!3448 (_1!6886 lt!226655)) (buf!3448 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3003 (buf!3448 (_1!6886 lt!226655))) (currentByte!6344 (_1!6886 lt!226655)) (currentBit!6339 (_1!6886 lt!226655)))))))

(assert (= (and d!47267 res!122693) b!146667))

(assert (= (and b!146667 res!122694) b!146668))

(assert (= (and b!146668 (not res!122692)) b!146669))

(assert (=> b!146667 m!226345))

(assert (=> b!146667 m!224711))

(assert (=> b!146669 m!226345))

(assert (=> b!146669 m!226345))

(declare-fun m!226493 () Bool)

(assert (=> b!146669 m!226493))

(assert (=> b!146085 d!47267))

(push 1)

(assert (not b!146604))

(assert (not bm!1933))

(assert (not b!146626))

(assert (not bm!1934))

(assert (not b!146451))

(assert (not b!146573))

(assert (not b!146613))

(assert (not d!47261))

(assert (not bm!1941))

(assert (not b!146630))

(assert (not b!146555))

(assert (not d!47087))

(assert (not d!47125))

(assert (not d!47173))

(assert (not b!146530))

(assert (not b!146621))

(assert (not b!146622))

(assert (not b!146572))

(assert (not b!146494))

(assert (not b!146531))

(assert (not b!146491))

(assert (not d!47167))

(assert (not b!146601))

(assert (not b!146561))

(assert (not b!146514))

(assert (not b!146500))

(assert (not d!47237))

(assert (not b!146493))

(assert (not b!146558))

(assert (not b!146466))

(assert (not b!146667))

(assert (not b!146529))

(assert (not b!146574))

(assert (not b!146509))

(assert (not b!146646))

(assert (not b!146576))

(assert (not b!146533))

(assert (not b!146603))

(assert (not d!47169))

(assert (not d!47083))

(assert (not b!146511))

(assert (not b!146657))

(assert (not b!146595))

(assert (not b!146467))

(assert (not b!146502))

(assert (not bm!1935))

(assert (not b!146597))

(assert (not b!146596))

(assert (not b!146651))

(assert (not b!146634))

(assert (not d!47247))

(assert (not b!146588))

(assert (not b!146619))

(assert (not d!47099))

(assert (not b!146627))

(assert (not bm!1924))

(assert (not bm!1929))

(assert (not d!47151))

(assert (not b!146481))

(assert (not b!146666))

(assert (not b!146482))

(assert (not bm!1943))

(assert (not b!146463))

(assert (not b!146591))

(assert (not b!146508))

(assert (not b!146636))

(assert (not d!47249))

(assert (not b!146488))

(assert (not b!146662))

(assert (not d!47103))

(assert (not d!47211))

(assert (not b!146507))

(assert (not d!47245))

(assert (not d!47137))

(assert (not b!146648))

(assert (not b!146611))

(assert (not d!47265))

(assert (not b!146584))

(assert (not d!47215))

(assert (not d!47225))

(assert (not d!47191))

(assert (not b!146503))

(assert (not bm!1942))

(assert (not b!146490))

(assert (not b!146469))

(assert (not b!146557))

(assert (not d!47259))

(assert (not d!47207))

(assert (not bm!1926))

(assert (not b!146660))

(assert (not d!47195))

(assert (not d!47153))

(assert (not b!146637))

(assert (not b!146457))

(assert (not d!47119))

(assert (not d!47193))

(assert (not b!146459))

(assert (not d!47201))

(assert (not d!47147))

(assert (not b!146579))

(assert (not b!146618))

(assert (not d!47107))

(assert (not b!146499))

(assert (not b!146669))

(assert (not d!47189))

(assert (not d!47141))

(assert (not b!146487))

(assert (not d!47159))

(assert (not bm!1927))

(assert (not b!146484))

(assert (not bm!1938))

(assert (not b!146577))

(assert (not bm!1936))

(assert (not b!146483))

(assert (not b!146496))

(assert (not d!47115))

(assert (not b!146624))

(assert (not d!47179))

(assert (not d!47121))

(assert (not b!146581))

(assert (not b!146532))

(assert (not d!47243))

(assert (not b!146607))

(assert (not b!146468))

(assert (not d!47085))

(assert (not d!47113))

(assert (not bm!1937))

(assert (not b!146512))

(assert (not b!146497))

(assert (not d!47239))

(assert (not b!146505))

(assert (not b!146516))

(assert (not d!47143))

(assert (not d!47257))

(assert (not b!146538))

(assert (not b!146594))

(assert (not b!146654))

(assert (not b!146616))

(assert (not b!146593))

(assert (not b!146535))

(assert (not d!47145))

(assert (not bm!1932))

(assert (not d!47253))

(assert (not b!146587))

(assert (not d!47133))

(assert (not d!47109))

(assert (not b!146629))

(assert (not b!146653))

(assert (not d!47221))

(assert (not b!146614))

(assert (not b!146513))

(assert (not d!47229))

(assert (not b!146628))

(assert (not b!146582))

(assert (not bm!1940))

(assert (not b!146585))

(assert (not d!47203))

(assert (not bm!1939))

(assert (not b!146663))

(assert (not bm!1928))

(assert (not d!47161))

(assert (not b!146575))

(assert (not bm!1925))

(assert (not b!146506))

(assert (not d!47105))

(assert (not b!146590))

(assert (not d!47155))

(assert (not b!146518))

(assert (not b!146465))

(check-sat)

(pop 1)

(push 1)

(check-sat)

