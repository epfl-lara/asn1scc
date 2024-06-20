; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25930 () Bool)

(assert start!25930)

(declare-fun b!132359 () Bool)

(declare-fun e!87749 () Bool)

(declare-fun e!87747 () Bool)

(assert (=> b!132359 (= e!87749 e!87747)))

(declare-fun res!109885 () Bool)

(assert (=> b!132359 (=> (not res!109885) (not e!87747))))

(declare-datatypes ((array!6100 0))(
  ( (array!6101 (arr!3396 (Array (_ BitVec 32) (_ BitVec 8))) (size!2761 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4786 0))(
  ( (BitStream!4787 (buf!3134 array!6100) (currentByte!5919 (_ BitVec 32)) (currentBit!5914 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8154 0))(
  ( (Unit!8155) )
))
(declare-datatypes ((tuple2!11464 0))(
  ( (tuple2!11465 (_1!6038 Unit!8154) (_2!6038 BitStream!4786)) )
))
(declare-fun lt!204377 () tuple2!11464)

(declare-fun lt!204374 () tuple2!11464)

(declare-fun lt!204379 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!132359 (= res!109885 (= (bitIndex!0 (size!2761 (buf!3134 (_2!6038 lt!204374))) (currentByte!5919 (_2!6038 lt!204374)) (currentBit!5914 (_2!6038 lt!204374))) (bvadd (bitIndex!0 (size!2761 (buf!3134 (_2!6038 lt!204377))) (currentByte!5919 (_2!6038 lt!204377)) (currentBit!5914 (_2!6038 lt!204377))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!204379))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!132359 (= lt!204379 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!132360 () Bool)

(declare-fun res!109886 () Bool)

(declare-fun e!87745 () Bool)

(assert (=> b!132360 (=> (not res!109886) (not e!87745))))

(assert (=> b!132360 (= res!109886 (bvslt from!447 to!404))))

(declare-fun b!132361 () Bool)

(declare-fun res!109889 () Bool)

(assert (=> b!132361 (=> (not res!109889) (not e!87747))))

(declare-fun isPrefixOf!0 (BitStream!4786 BitStream!4786) Bool)

(assert (=> b!132361 (= res!109889 (isPrefixOf!0 (_2!6038 lt!204377) (_2!6038 lt!204374)))))

(declare-fun b!132362 () Bool)

(declare-fun e!87739 () Bool)

(declare-fun thiss!1634 () BitStream!4786)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!132362 (= e!87739 (invariant!0 (currentBit!5914 thiss!1634) (currentByte!5919 thiss!1634) (size!2761 (buf!3134 (_2!6038 lt!204377)))))))

(declare-fun res!109891 () Bool)

(assert (=> start!25930 (=> (not res!109891) (not e!87745))))

(declare-fun arr!237 () array!6100)

(assert (=> start!25930 (= res!109891 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2761 arr!237))))))

(assert (=> start!25930 e!87745))

(assert (=> start!25930 true))

(declare-fun array_inv!2550 (array!6100) Bool)

(assert (=> start!25930 (array_inv!2550 arr!237)))

(declare-fun e!87746 () Bool)

(declare-fun inv!12 (BitStream!4786) Bool)

(assert (=> start!25930 (and (inv!12 thiss!1634) e!87746)))

(declare-fun b!132363 () Bool)

(declare-fun e!87748 () Bool)

(assert (=> b!132363 (= e!87748 true)))

(declare-datatypes ((tuple2!11466 0))(
  ( (tuple2!11467 (_1!6039 BitStream!4786) (_2!6039 array!6100)) )
))
(declare-fun lt!204367 () tuple2!11466)

(declare-fun lt!204378 () array!6100)

(declare-datatypes ((tuple2!11468 0))(
  ( (tuple2!11469 (_1!6040 BitStream!4786) (_2!6040 BitStream!4786)) )
))
(declare-fun lt!204365 () tuple2!11468)

(declare-fun readByteArrayLoopPure!0 (BitStream!4786 array!6100 (_ BitVec 32) (_ BitVec 32)) tuple2!11466)

(declare-fun withMovedByteIndex!0 (BitStream!4786 (_ BitVec 32)) BitStream!4786)

(assert (=> b!132363 (= lt!204367 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6040 lt!204365) #b00000000000000000000000000000001) lt!204378 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun b!132364 () Bool)

(declare-fun res!109894 () Bool)

(assert (=> b!132364 (=> (not res!109894) (not e!87745))))

(assert (=> b!132364 (= res!109894 (invariant!0 (currentBit!5914 thiss!1634) (currentByte!5919 thiss!1634) (size!2761 (buf!3134 thiss!1634))))))

(declare-fun b!132365 () Bool)

(declare-fun e!87744 () Bool)

(declare-datatypes ((tuple2!11470 0))(
  ( (tuple2!11471 (_1!6041 BitStream!4786) (_2!6041 (_ BitVec 8))) )
))
(declare-fun lt!204368 () tuple2!11470)

(declare-fun lt!204363 () tuple2!11470)

(assert (=> b!132365 (= e!87744 (= (_2!6041 lt!204368) (_2!6041 lt!204363)))))

(declare-fun b!132366 () Bool)

(declare-fun e!87740 () Bool)

(assert (=> b!132366 (= e!87747 (not e!87740))))

(declare-fun res!109887 () Bool)

(assert (=> b!132366 (=> res!109887 e!87740)))

(declare-fun lt!204360 () tuple2!11466)

(declare-fun lt!204380 () tuple2!11468)

(assert (=> b!132366 (= res!109887 (or (not (= (size!2761 (_2!6039 lt!204360)) (size!2761 arr!237))) (not (= (_1!6039 lt!204360) (_2!6040 lt!204380)))))))

(assert (=> b!132366 (= lt!204360 (readByteArrayLoopPure!0 (_1!6040 lt!204380) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!132366 (validate_offset_bits!1 ((_ sign_extend 32) (size!2761 (buf!3134 (_2!6038 lt!204374)))) ((_ sign_extend 32) (currentByte!5919 (_2!6038 lt!204377))) ((_ sign_extend 32) (currentBit!5914 (_2!6038 lt!204377))) lt!204379)))

(declare-fun lt!204372 () Unit!8154)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4786 array!6100 (_ BitVec 64)) Unit!8154)

(assert (=> b!132366 (= lt!204372 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6038 lt!204377) (buf!3134 (_2!6038 lt!204374)) lt!204379))))

(declare-fun reader!0 (BitStream!4786 BitStream!4786) tuple2!11468)

(assert (=> b!132366 (= lt!204380 (reader!0 (_2!6038 lt!204377) (_2!6038 lt!204374)))))

(declare-fun b!132367 () Bool)

(declare-fun res!109896 () Bool)

(declare-fun e!87741 () Bool)

(assert (=> b!132367 (=> (not res!109896) (not e!87741))))

(assert (=> b!132367 (= res!109896 (isPrefixOf!0 thiss!1634 (_2!6038 lt!204377)))))

(declare-fun lt!204361 () tuple2!11468)

(declare-fun lt!204359 () tuple2!11470)

(declare-fun b!132368 () Bool)

(assert (=> b!132368 (= e!87741 (and (= (_2!6041 lt!204359) (select (arr!3396 arr!237) from!447)) (= (_1!6041 lt!204359) (_2!6040 lt!204361))))))

(declare-fun readBytePure!0 (BitStream!4786) tuple2!11470)

(assert (=> b!132368 (= lt!204359 (readBytePure!0 (_1!6040 lt!204361)))))

(assert (=> b!132368 (= lt!204361 (reader!0 thiss!1634 (_2!6038 lt!204377)))))

(declare-fun b!132369 () Bool)

(declare-fun arrayRangesEq!164 (array!6100 array!6100 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!132369 (= e!87740 (not (arrayRangesEq!164 arr!237 (_2!6039 lt!204360) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!132370 () Bool)

(declare-fun res!109888 () Bool)

(assert (=> b!132370 (=> (not res!109888) (not e!87741))))

(assert (=> b!132370 (= res!109888 (= (bitIndex!0 (size!2761 (buf!3134 (_2!6038 lt!204377))) (currentByte!5919 (_2!6038 lt!204377)) (currentBit!5914 (_2!6038 lt!204377))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2761 (buf!3134 thiss!1634)) (currentByte!5919 thiss!1634) (currentBit!5914 thiss!1634)))))))

(declare-fun b!132371 () Bool)

(declare-fun res!109893 () Bool)

(assert (=> b!132371 (=> (not res!109893) (not e!87745))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!132371 (= res!109893 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2761 (buf!3134 thiss!1634))) ((_ sign_extend 32) (currentByte!5919 thiss!1634)) ((_ sign_extend 32) (currentBit!5914 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun e!87742 () Bool)

(declare-fun b!132372 () Bool)

(assert (=> b!132372 (= e!87742 (= (_1!6039 (readByteArrayLoopPure!0 (_1!6040 lt!204365) arr!237 from!447 to!404)) (_2!6040 lt!204365)))))

(declare-fun b!132373 () Bool)

(assert (=> b!132373 (= e!87745 (not e!87748))))

(declare-fun res!109890 () Bool)

(assert (=> b!132373 (=> res!109890 e!87748)))

(assert (=> b!132373 (= res!109890 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!2761 (buf!3134 (_1!6040 lt!204365)))) ((_ sign_extend 32) (currentByte!5919 (_1!6040 lt!204365))) ((_ sign_extend 32) (currentBit!5914 (_1!6040 lt!204365))) (bvsub to!404 from!447))))))

(declare-fun lt!204369 () tuple2!11466)

(declare-fun lt!204373 () tuple2!11468)

(assert (=> b!132373 (= lt!204369 (readByteArrayLoopPure!0 (_1!6040 lt!204373) lt!204378 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!204375 () tuple2!11470)

(assert (=> b!132373 (= lt!204378 (array!6101 (store (arr!3396 arr!237) from!447 (_2!6041 lt!204375)) (size!2761 arr!237)))))

(declare-fun lt!204370 () (_ BitVec 32))

(assert (=> b!132373 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2761 (buf!3134 (_2!6038 lt!204374)))) ((_ sign_extend 32) (currentByte!5919 (_2!6038 lt!204377))) ((_ sign_extend 32) (currentBit!5914 (_2!6038 lt!204377))) lt!204370)))

(declare-fun lt!204376 () Unit!8154)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4786 array!6100 (_ BitVec 32)) Unit!8154)

(assert (=> b!132373 (= lt!204376 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6038 lt!204377) (buf!3134 (_2!6038 lt!204374)) lt!204370))))

(assert (=> b!132373 e!87742))

(declare-fun res!109883 () Bool)

(assert (=> b!132373 (=> (not res!109883) (not e!87742))))

(assert (=> b!132373 (= res!109883 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2761 (buf!3134 (_2!6038 lt!204374)))) ((_ sign_extend 32) (currentByte!5919 thiss!1634)) ((_ sign_extend 32) (currentBit!5914 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!204366 () Unit!8154)

(assert (=> b!132373 (= lt!204366 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3134 (_2!6038 lt!204374)) (bvsub to!404 from!447)))))

(assert (=> b!132373 (= (_2!6041 lt!204375) (select (arr!3396 arr!237) from!447))))

(assert (=> b!132373 (= lt!204375 (readBytePure!0 (_1!6040 lt!204365)))))

(assert (=> b!132373 (= lt!204373 (reader!0 (_2!6038 lt!204377) (_2!6038 lt!204374)))))

(assert (=> b!132373 (= lt!204365 (reader!0 thiss!1634 (_2!6038 lt!204374)))))

(assert (=> b!132373 e!87744))

(declare-fun res!109897 () Bool)

(assert (=> b!132373 (=> (not res!109897) (not e!87744))))

(assert (=> b!132373 (= res!109897 (= (bitIndex!0 (size!2761 (buf!3134 (_1!6041 lt!204368))) (currentByte!5919 (_1!6041 lt!204368)) (currentBit!5914 (_1!6041 lt!204368))) (bitIndex!0 (size!2761 (buf!3134 (_1!6041 lt!204363))) (currentByte!5919 (_1!6041 lt!204363)) (currentBit!5914 (_1!6041 lt!204363)))))))

(declare-fun lt!204371 () Unit!8154)

(declare-fun lt!204358 () BitStream!4786)

(declare-fun readBytePrefixLemma!0 (BitStream!4786 BitStream!4786) Unit!8154)

(assert (=> b!132373 (= lt!204371 (readBytePrefixLemma!0 lt!204358 (_2!6038 lt!204374)))))

(assert (=> b!132373 (= lt!204363 (readBytePure!0 (BitStream!4787 (buf!3134 (_2!6038 lt!204374)) (currentByte!5919 thiss!1634) (currentBit!5914 thiss!1634))))))

(assert (=> b!132373 (= lt!204368 (readBytePure!0 lt!204358))))

(assert (=> b!132373 (= lt!204358 (BitStream!4787 (buf!3134 (_2!6038 lt!204377)) (currentByte!5919 thiss!1634) (currentBit!5914 thiss!1634)))))

(assert (=> b!132373 e!87739))

(declare-fun res!109895 () Bool)

(assert (=> b!132373 (=> (not res!109895) (not e!87739))))

(assert (=> b!132373 (= res!109895 (isPrefixOf!0 thiss!1634 (_2!6038 lt!204374)))))

(declare-fun lt!204364 () Unit!8154)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4786 BitStream!4786 BitStream!4786) Unit!8154)

(assert (=> b!132373 (= lt!204364 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6038 lt!204377) (_2!6038 lt!204374)))))

(assert (=> b!132373 e!87749))

(declare-fun res!109892 () Bool)

(assert (=> b!132373 (=> (not res!109892) (not e!87749))))

(assert (=> b!132373 (= res!109892 (= (size!2761 (buf!3134 (_2!6038 lt!204377))) (size!2761 (buf!3134 (_2!6038 lt!204374)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4786 array!6100 (_ BitVec 32) (_ BitVec 32)) tuple2!11464)

(assert (=> b!132373 (= lt!204374 (appendByteArrayLoop!0 (_2!6038 lt!204377) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!132373 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2761 (buf!3134 (_2!6038 lt!204377)))) ((_ sign_extend 32) (currentByte!5919 (_2!6038 lt!204377))) ((_ sign_extend 32) (currentBit!5914 (_2!6038 lt!204377))) lt!204370)))

(assert (=> b!132373 (= lt!204370 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!204362 () Unit!8154)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4786 BitStream!4786 (_ BitVec 64) (_ BitVec 32)) Unit!8154)

(assert (=> b!132373 (= lt!204362 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6038 lt!204377) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!132373 e!87741))

(declare-fun res!109884 () Bool)

(assert (=> b!132373 (=> (not res!109884) (not e!87741))))

(assert (=> b!132373 (= res!109884 (= (size!2761 (buf!3134 thiss!1634)) (size!2761 (buf!3134 (_2!6038 lt!204377)))))))

(declare-fun appendByte!0 (BitStream!4786 (_ BitVec 8)) tuple2!11464)

(assert (=> b!132373 (= lt!204377 (appendByte!0 thiss!1634 (select (arr!3396 arr!237) from!447)))))

(declare-fun b!132374 () Bool)

(assert (=> b!132374 (= e!87746 (array_inv!2550 (buf!3134 thiss!1634)))))

(assert (= (and start!25930 res!109891) b!132371))

(assert (= (and b!132371 res!109893) b!132360))

(assert (= (and b!132360 res!109886) b!132364))

(assert (= (and b!132364 res!109894) b!132373))

(assert (= (and b!132373 res!109884) b!132370))

(assert (= (and b!132370 res!109888) b!132367))

(assert (= (and b!132367 res!109896) b!132368))

(assert (= (and b!132373 res!109892) b!132359))

(assert (= (and b!132359 res!109885) b!132361))

(assert (= (and b!132361 res!109889) b!132366))

(assert (= (and b!132366 (not res!109887)) b!132369))

(assert (= (and b!132373 res!109895) b!132362))

(assert (= (and b!132373 res!109897) b!132365))

(assert (= (and b!132373 res!109883) b!132372))

(assert (= (and b!132373 (not res!109890)) b!132363))

(assert (= start!25930 b!132374))

(declare-fun m!199951 () Bool)

(assert (=> b!132372 m!199951))

(declare-fun m!199953 () Bool)

(assert (=> b!132364 m!199953))

(declare-fun m!199955 () Bool)

(assert (=> b!132368 m!199955))

(declare-fun m!199957 () Bool)

(assert (=> b!132368 m!199957))

(declare-fun m!199959 () Bool)

(assert (=> b!132368 m!199959))

(declare-fun m!199961 () Bool)

(assert (=> b!132374 m!199961))

(declare-fun m!199963 () Bool)

(assert (=> start!25930 m!199963))

(declare-fun m!199965 () Bool)

(assert (=> start!25930 m!199965))

(declare-fun m!199967 () Bool)

(assert (=> b!132363 m!199967))

(assert (=> b!132363 m!199967))

(declare-fun m!199969 () Bool)

(assert (=> b!132363 m!199969))

(declare-fun m!199971 () Bool)

(assert (=> b!132373 m!199971))

(declare-fun m!199973 () Bool)

(assert (=> b!132373 m!199973))

(declare-fun m!199975 () Bool)

(assert (=> b!132373 m!199975))

(declare-fun m!199977 () Bool)

(assert (=> b!132373 m!199977))

(declare-fun m!199979 () Bool)

(assert (=> b!132373 m!199979))

(declare-fun m!199981 () Bool)

(assert (=> b!132373 m!199981))

(declare-fun m!199983 () Bool)

(assert (=> b!132373 m!199983))

(declare-fun m!199985 () Bool)

(assert (=> b!132373 m!199985))

(declare-fun m!199987 () Bool)

(assert (=> b!132373 m!199987))

(declare-fun m!199989 () Bool)

(assert (=> b!132373 m!199989))

(assert (=> b!132373 m!199955))

(declare-fun m!199991 () Bool)

(assert (=> b!132373 m!199991))

(declare-fun m!199993 () Bool)

(assert (=> b!132373 m!199993))

(declare-fun m!199995 () Bool)

(assert (=> b!132373 m!199995))

(declare-fun m!199997 () Bool)

(assert (=> b!132373 m!199997))

(declare-fun m!199999 () Bool)

(assert (=> b!132373 m!199999))

(declare-fun m!200001 () Bool)

(assert (=> b!132373 m!200001))

(declare-fun m!200003 () Bool)

(assert (=> b!132373 m!200003))

(declare-fun m!200005 () Bool)

(assert (=> b!132373 m!200005))

(declare-fun m!200007 () Bool)

(assert (=> b!132373 m!200007))

(declare-fun m!200009 () Bool)

(assert (=> b!132373 m!200009))

(declare-fun m!200011 () Bool)

(assert (=> b!132373 m!200011))

(assert (=> b!132373 m!199955))

(declare-fun m!200013 () Bool)

(assert (=> b!132366 m!200013))

(declare-fun m!200015 () Bool)

(assert (=> b!132366 m!200015))

(declare-fun m!200017 () Bool)

(assert (=> b!132366 m!200017))

(assert (=> b!132366 m!199987))

(declare-fun m!200019 () Bool)

(assert (=> b!132361 m!200019))

(declare-fun m!200021 () Bool)

(assert (=> b!132369 m!200021))

(declare-fun m!200023 () Bool)

(assert (=> b!132371 m!200023))

(declare-fun m!200025 () Bool)

(assert (=> b!132359 m!200025))

(declare-fun m!200027 () Bool)

(assert (=> b!132359 m!200027))

(declare-fun m!200029 () Bool)

(assert (=> b!132362 m!200029))

(assert (=> b!132370 m!200027))

(declare-fun m!200031 () Bool)

(assert (=> b!132370 m!200031))

(declare-fun m!200033 () Bool)

(assert (=> b!132367 m!200033))

(push 1)

(assert (not b!132359))

(assert (not b!132374))

(assert (not b!132367))

(assert (not b!132370))

(assert (not b!132366))

(assert (not b!132368))

(assert (not b!132369))

(assert (not b!132362))

(assert (not start!25930))

(assert (not b!132364))

(assert (not b!132371))

(assert (not b!132373))

(assert (not b!132372))

(assert (not b!132363))

(assert (not b!132361))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

