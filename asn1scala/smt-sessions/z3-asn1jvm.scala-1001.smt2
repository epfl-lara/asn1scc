; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28030 () Bool)

(assert start!28030)

(declare-fun b!145475 () Bool)

(declare-fun e!97003 () Bool)

(declare-fun e!97004 () Bool)

(assert (=> b!145475 (= e!97003 e!97004)))

(declare-fun res!121656 () Bool)

(assert (=> b!145475 (=> (not res!121656) (not e!97004))))

(declare-fun lt!225325 () (_ BitVec 64))

(declare-datatypes ((array!6622 0))(
  ( (array!6623 (arr!3732 (Array (_ BitVec 32) (_ BitVec 8))) (size!2999 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5256 0))(
  ( (BitStream!5257 (buf!3438 array!6622) (currentByte!6328 (_ BitVec 32)) (currentBit!6323 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!9071 0))(
  ( (Unit!9072) )
))
(declare-datatypes ((tuple2!13034 0))(
  ( (tuple2!13035 (_1!6863 Unit!9071) (_2!6863 BitStream!5256)) )
))
(declare-fun lt!225330 () tuple2!13034)

(declare-fun lt!225313 () tuple2!13034)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!145475 (= res!121656 (= (bitIndex!0 (size!2999 (buf!3438 (_2!6863 lt!225330))) (currentByte!6328 (_2!6863 lt!225330)) (currentBit!6323 (_2!6863 lt!225330))) (bvadd (bitIndex!0 (size!2999 (buf!3438 (_2!6863 lt!225313))) (currentByte!6328 (_2!6863 lt!225313)) (currentBit!6323 (_2!6863 lt!225313))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!225325))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!145475 (= lt!225325 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!145476 () Bool)

(declare-fun e!97001 () Bool)

(declare-fun thiss!1634 () BitStream!5256)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!145476 (= e!97001 (invariant!0 (currentBit!6323 thiss!1634) (currentByte!6328 thiss!1634) (size!2999 (buf!3438 (_2!6863 lt!225313)))))))

(declare-fun arr!237 () array!6622)

(declare-fun b!145477 () Bool)

(declare-fun e!97000 () Bool)

(declare-datatypes ((tuple2!13036 0))(
  ( (tuple2!13037 (_1!6864 BitStream!5256) (_2!6864 BitStream!5256)) )
))
(declare-fun lt!225314 () tuple2!13036)

(declare-datatypes ((tuple2!13038 0))(
  ( (tuple2!13039 (_1!6865 BitStream!5256) (_2!6865 array!6622)) )
))
(declare-fun readByteArrayLoopPure!0 (BitStream!5256 array!6622 (_ BitVec 32) (_ BitVec 32)) tuple2!13038)

(assert (=> b!145477 (= e!97000 (= (_1!6865 (readByteArrayLoopPure!0 (_1!6864 lt!225314) arr!237 from!447 to!404)) (_2!6864 lt!225314)))))

(declare-fun b!145478 () Bool)

(declare-fun res!121650 () Bool)

(declare-fun e!96999 () Bool)

(assert (=> b!145478 (=> (not res!121650) (not e!96999))))

(assert (=> b!145478 (= res!121650 (bvslt from!447 to!404))))

(declare-fun res!121658 () Bool)

(assert (=> start!28030 (=> (not res!121658) (not e!96999))))

(assert (=> start!28030 (= res!121658 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2999 arr!237))))))

(assert (=> start!28030 e!96999))

(assert (=> start!28030 true))

(declare-fun array_inv!2788 (array!6622) Bool)

(assert (=> start!28030 (array_inv!2788 arr!237)))

(declare-fun e!96998 () Bool)

(declare-fun inv!12 (BitStream!5256) Bool)

(assert (=> start!28030 (and (inv!12 thiss!1634) e!96998)))

(declare-fun b!145479 () Bool)

(assert (=> b!145479 (= e!96998 (array_inv!2788 (buf!3438 thiss!1634)))))

(declare-fun lt!225329 () tuple2!13036)

(declare-fun b!145480 () Bool)

(declare-fun e!97002 () Bool)

(declare-datatypes ((tuple2!13040 0))(
  ( (tuple2!13041 (_1!6866 BitStream!5256) (_2!6866 (_ BitVec 8))) )
))
(declare-fun lt!225332 () tuple2!13040)

(assert (=> b!145480 (= e!97002 (and (= (_2!6866 lt!225332) (select (arr!3732 arr!237) from!447)) (= (_1!6866 lt!225332) (_2!6864 lt!225329))))))

(declare-fun readBytePure!0 (BitStream!5256) tuple2!13040)

(assert (=> b!145480 (= lt!225332 (readBytePure!0 (_1!6864 lt!225329)))))

(declare-fun reader!0 (BitStream!5256 BitStream!5256) tuple2!13036)

(assert (=> b!145480 (= lt!225329 (reader!0 thiss!1634 (_2!6863 lt!225313)))))

(declare-fun b!145481 () Bool)

(declare-fun e!97005 () Bool)

(declare-fun lt!225328 () tuple2!13040)

(declare-fun lt!225326 () tuple2!13040)

(assert (=> b!145481 (= e!97005 (= (_2!6866 lt!225328) (_2!6866 lt!225326)))))

(declare-fun e!97008 () Bool)

(declare-fun lt!225321 () tuple2!13038)

(declare-fun b!145482 () Bool)

(declare-fun arrayRangesEq!315 (array!6622 array!6622 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!145482 (= e!97008 (not (arrayRangesEq!315 arr!237 (_2!6865 lt!225321) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!145483 () Bool)

(declare-fun res!121647 () Bool)

(assert (=> b!145483 (=> (not res!121647) (not e!97002))))

(declare-fun isPrefixOf!0 (BitStream!5256 BitStream!5256) Bool)

(assert (=> b!145483 (= res!121647 (isPrefixOf!0 thiss!1634 (_2!6863 lt!225313)))))

(declare-fun b!145484 () Bool)

(assert (=> b!145484 (= e!97004 (not e!97008))))

(declare-fun res!121654 () Bool)

(assert (=> b!145484 (=> res!121654 e!97008)))

(declare-fun lt!225320 () tuple2!13036)

(assert (=> b!145484 (= res!121654 (or (not (= (size!2999 (_2!6865 lt!225321)) (size!2999 arr!237))) (not (= (_1!6865 lt!225321) (_2!6864 lt!225320)))))))

(assert (=> b!145484 (= lt!225321 (readByteArrayLoopPure!0 (_1!6864 lt!225320) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!145484 (validate_offset_bits!1 ((_ sign_extend 32) (size!2999 (buf!3438 (_2!6863 lt!225330)))) ((_ sign_extend 32) (currentByte!6328 (_2!6863 lt!225313))) ((_ sign_extend 32) (currentBit!6323 (_2!6863 lt!225313))) lt!225325)))

(declare-fun lt!225322 () Unit!9071)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5256 array!6622 (_ BitVec 64)) Unit!9071)

(assert (=> b!145484 (= lt!225322 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6863 lt!225313) (buf!3438 (_2!6863 lt!225330)) lt!225325))))

(assert (=> b!145484 (= lt!225320 (reader!0 (_2!6863 lt!225313) (_2!6863 lt!225330)))))

(declare-fun b!145485 () Bool)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!145485 (= e!96999 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!2999 (buf!3438 (_1!6864 lt!225314)))) ((_ sign_extend 32) (currentByte!6328 (_1!6864 lt!225314))) ((_ sign_extend 32) (currentBit!6323 (_1!6864 lt!225314))) (bvsub to!404 from!447))))))

(declare-fun lt!225323 () tuple2!13038)

(declare-fun lt!225324 () tuple2!13036)

(declare-fun lt!225319 () tuple2!13040)

(assert (=> b!145485 (= lt!225323 (readByteArrayLoopPure!0 (_1!6864 lt!225324) (array!6623 (store (arr!3732 arr!237) from!447 (_2!6866 lt!225319)) (size!2999 arr!237)) (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!225331 () (_ BitVec 32))

(assert (=> b!145485 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2999 (buf!3438 (_2!6863 lt!225330)))) ((_ sign_extend 32) (currentByte!6328 (_2!6863 lt!225313))) ((_ sign_extend 32) (currentBit!6323 (_2!6863 lt!225313))) lt!225331)))

(declare-fun lt!225318 () Unit!9071)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5256 array!6622 (_ BitVec 32)) Unit!9071)

(assert (=> b!145485 (= lt!225318 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6863 lt!225313) (buf!3438 (_2!6863 lt!225330)) lt!225331))))

(assert (=> b!145485 e!97000))

(declare-fun res!121652 () Bool)

(assert (=> b!145485 (=> (not res!121652) (not e!97000))))

(assert (=> b!145485 (= res!121652 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2999 (buf!3438 (_2!6863 lt!225330)))) ((_ sign_extend 32) (currentByte!6328 thiss!1634)) ((_ sign_extend 32) (currentBit!6323 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!225315 () Unit!9071)

(assert (=> b!145485 (= lt!225315 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3438 (_2!6863 lt!225330)) (bvsub to!404 from!447)))))

(assert (=> b!145485 (= (_2!6866 lt!225319) (select (arr!3732 arr!237) from!447))))

(assert (=> b!145485 (= lt!225319 (readBytePure!0 (_1!6864 lt!225314)))))

(assert (=> b!145485 (= lt!225324 (reader!0 (_2!6863 lt!225313) (_2!6863 lt!225330)))))

(assert (=> b!145485 (= lt!225314 (reader!0 thiss!1634 (_2!6863 lt!225330)))))

(assert (=> b!145485 e!97005))

(declare-fun res!121657 () Bool)

(assert (=> b!145485 (=> (not res!121657) (not e!97005))))

(assert (=> b!145485 (= res!121657 (= (bitIndex!0 (size!2999 (buf!3438 (_1!6866 lt!225328))) (currentByte!6328 (_1!6866 lt!225328)) (currentBit!6323 (_1!6866 lt!225328))) (bitIndex!0 (size!2999 (buf!3438 (_1!6866 lt!225326))) (currentByte!6328 (_1!6866 lt!225326)) (currentBit!6323 (_1!6866 lt!225326)))))))

(declare-fun lt!225316 () Unit!9071)

(declare-fun lt!225333 () BitStream!5256)

(declare-fun readBytePrefixLemma!0 (BitStream!5256 BitStream!5256) Unit!9071)

(assert (=> b!145485 (= lt!225316 (readBytePrefixLemma!0 lt!225333 (_2!6863 lt!225330)))))

(assert (=> b!145485 (= lt!225326 (readBytePure!0 (BitStream!5257 (buf!3438 (_2!6863 lt!225330)) (currentByte!6328 thiss!1634) (currentBit!6323 thiss!1634))))))

(assert (=> b!145485 (= lt!225328 (readBytePure!0 lt!225333))))

(assert (=> b!145485 (= lt!225333 (BitStream!5257 (buf!3438 (_2!6863 lt!225313)) (currentByte!6328 thiss!1634) (currentBit!6323 thiss!1634)))))

(assert (=> b!145485 e!97001))

(declare-fun res!121653 () Bool)

(assert (=> b!145485 (=> (not res!121653) (not e!97001))))

(assert (=> b!145485 (= res!121653 (isPrefixOf!0 thiss!1634 (_2!6863 lt!225330)))))

(declare-fun lt!225317 () Unit!9071)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5256 BitStream!5256 BitStream!5256) Unit!9071)

(assert (=> b!145485 (= lt!225317 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6863 lt!225313) (_2!6863 lt!225330)))))

(assert (=> b!145485 e!97003))

(declare-fun res!121655 () Bool)

(assert (=> b!145485 (=> (not res!121655) (not e!97003))))

(assert (=> b!145485 (= res!121655 (= (size!2999 (buf!3438 (_2!6863 lt!225313))) (size!2999 (buf!3438 (_2!6863 lt!225330)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5256 array!6622 (_ BitVec 32) (_ BitVec 32)) tuple2!13034)

(assert (=> b!145485 (= lt!225330 (appendByteArrayLoop!0 (_2!6863 lt!225313) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!145485 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2999 (buf!3438 (_2!6863 lt!225313)))) ((_ sign_extend 32) (currentByte!6328 (_2!6863 lt!225313))) ((_ sign_extend 32) (currentBit!6323 (_2!6863 lt!225313))) lt!225331)))

(assert (=> b!145485 (= lt!225331 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!225327 () Unit!9071)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5256 BitStream!5256 (_ BitVec 64) (_ BitVec 32)) Unit!9071)

(assert (=> b!145485 (= lt!225327 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6863 lt!225313) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!145485 e!97002))

(declare-fun res!121651 () Bool)

(assert (=> b!145485 (=> (not res!121651) (not e!97002))))

(assert (=> b!145485 (= res!121651 (= (size!2999 (buf!3438 thiss!1634)) (size!2999 (buf!3438 (_2!6863 lt!225313)))))))

(declare-fun appendByte!0 (BitStream!5256 (_ BitVec 8)) tuple2!13034)

(assert (=> b!145485 (= lt!225313 (appendByte!0 thiss!1634 (select (arr!3732 arr!237) from!447)))))

(declare-fun b!145486 () Bool)

(declare-fun res!121649 () Bool)

(assert (=> b!145486 (=> (not res!121649) (not e!97002))))

(assert (=> b!145486 (= res!121649 (= (bitIndex!0 (size!2999 (buf!3438 (_2!6863 lt!225313))) (currentByte!6328 (_2!6863 lt!225313)) (currentBit!6323 (_2!6863 lt!225313))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2999 (buf!3438 thiss!1634)) (currentByte!6328 thiss!1634) (currentBit!6323 thiss!1634)))))))

(declare-fun b!145487 () Bool)

(declare-fun res!121659 () Bool)

(assert (=> b!145487 (=> (not res!121659) (not e!96999))))

(assert (=> b!145487 (= res!121659 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2999 (buf!3438 thiss!1634))) ((_ sign_extend 32) (currentByte!6328 thiss!1634)) ((_ sign_extend 32) (currentBit!6323 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!145488 () Bool)

(declare-fun res!121648 () Bool)

(assert (=> b!145488 (=> (not res!121648) (not e!96999))))

(assert (=> b!145488 (= res!121648 (invariant!0 (currentBit!6323 thiss!1634) (currentByte!6328 thiss!1634) (size!2999 (buf!3438 thiss!1634))))))

(declare-fun b!145489 () Bool)

(declare-fun res!121660 () Bool)

(assert (=> b!145489 (=> (not res!121660) (not e!97004))))

(assert (=> b!145489 (= res!121660 (isPrefixOf!0 (_2!6863 lt!225313) (_2!6863 lt!225330)))))

(assert (= (and start!28030 res!121658) b!145487))

(assert (= (and b!145487 res!121659) b!145478))

(assert (= (and b!145478 res!121650) b!145488))

(assert (= (and b!145488 res!121648) b!145485))

(assert (= (and b!145485 res!121651) b!145486))

(assert (= (and b!145486 res!121649) b!145483))

(assert (= (and b!145483 res!121647) b!145480))

(assert (= (and b!145485 res!121655) b!145475))

(assert (= (and b!145475 res!121656) b!145489))

(assert (= (and b!145489 res!121660) b!145484))

(assert (= (and b!145484 (not res!121654)) b!145482))

(assert (= (and b!145485 res!121653) b!145476))

(assert (= (and b!145485 res!121657) b!145481))

(assert (= (and b!145485 res!121652) b!145477))

(assert (= start!28030 b!145479))

(declare-fun m!223819 () Bool)

(assert (=> b!145484 m!223819))

(declare-fun m!223821 () Bool)

(assert (=> b!145484 m!223821))

(declare-fun m!223823 () Bool)

(assert (=> b!145484 m!223823))

(declare-fun m!223825 () Bool)

(assert (=> b!145484 m!223825))

(declare-fun m!223827 () Bool)

(assert (=> start!28030 m!223827))

(declare-fun m!223829 () Bool)

(assert (=> start!28030 m!223829))

(declare-fun m!223831 () Bool)

(assert (=> b!145483 m!223831))

(declare-fun m!223833 () Bool)

(assert (=> b!145486 m!223833))

(declare-fun m!223835 () Bool)

(assert (=> b!145486 m!223835))

(declare-fun m!223837 () Bool)

(assert (=> b!145477 m!223837))

(declare-fun m!223839 () Bool)

(assert (=> b!145475 m!223839))

(assert (=> b!145475 m!223833))

(declare-fun m!223841 () Bool)

(assert (=> b!145488 m!223841))

(declare-fun m!223843 () Bool)

(assert (=> b!145489 m!223843))

(declare-fun m!223845 () Bool)

(assert (=> b!145482 m!223845))

(declare-fun m!223847 () Bool)

(assert (=> b!145485 m!223847))

(declare-fun m!223849 () Bool)

(assert (=> b!145485 m!223849))

(declare-fun m!223851 () Bool)

(assert (=> b!145485 m!223851))

(declare-fun m!223853 () Bool)

(assert (=> b!145485 m!223853))

(declare-fun m!223855 () Bool)

(assert (=> b!145485 m!223855))

(declare-fun m!223857 () Bool)

(assert (=> b!145485 m!223857))

(declare-fun m!223859 () Bool)

(assert (=> b!145485 m!223859))

(declare-fun m!223861 () Bool)

(assert (=> b!145485 m!223861))

(declare-fun m!223863 () Bool)

(assert (=> b!145485 m!223863))

(declare-fun m!223865 () Bool)

(assert (=> b!145485 m!223865))

(declare-fun m!223867 () Bool)

(assert (=> b!145485 m!223867))

(declare-fun m!223869 () Bool)

(assert (=> b!145485 m!223869))

(declare-fun m!223871 () Bool)

(assert (=> b!145485 m!223871))

(declare-fun m!223873 () Bool)

(assert (=> b!145485 m!223873))

(declare-fun m!223875 () Bool)

(assert (=> b!145485 m!223875))

(assert (=> b!145485 m!223825))

(declare-fun m!223877 () Bool)

(assert (=> b!145485 m!223877))

(declare-fun m!223879 () Bool)

(assert (=> b!145485 m!223879))

(declare-fun m!223881 () Bool)

(assert (=> b!145485 m!223881))

(declare-fun m!223883 () Bool)

(assert (=> b!145485 m!223883))

(assert (=> b!145485 m!223857))

(declare-fun m!223885 () Bool)

(assert (=> b!145485 m!223885))

(declare-fun m!223887 () Bool)

(assert (=> b!145485 m!223887))

(declare-fun m!223889 () Bool)

(assert (=> b!145476 m!223889))

(assert (=> b!145480 m!223857))

(declare-fun m!223891 () Bool)

(assert (=> b!145480 m!223891))

(declare-fun m!223893 () Bool)

(assert (=> b!145480 m!223893))

(declare-fun m!223895 () Bool)

(assert (=> b!145487 m!223895))

(declare-fun m!223897 () Bool)

(assert (=> b!145479 m!223897))

(check-sat (not b!145479) (not b!145488) (not b!145486) (not b!145476) (not start!28030) (not b!145475) (not b!145489) (not b!145485) (not b!145480) (not b!145484) (not b!145477) (not b!145483) (not b!145487) (not b!145482))
(check-sat)
(get-model)

(declare-fun d!46563 () Bool)

(declare-fun e!97146 () Bool)

(assert (=> d!46563 e!97146))

(declare-fun res!121867 () Bool)

(assert (=> d!46563 (=> (not res!121867) (not e!97146))))

(declare-fun lt!225862 () (_ BitVec 64))

(declare-fun lt!225864 () (_ BitVec 64))

(declare-fun lt!225865 () (_ BitVec 64))

(assert (=> d!46563 (= res!121867 (= lt!225864 (bvsub lt!225865 lt!225862)))))

(assert (=> d!46563 (or (= (bvand lt!225865 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!225862 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!225865 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!225865 lt!225862) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!46563 (= lt!225862 (remainingBits!0 ((_ sign_extend 32) (size!2999 (buf!3438 (_2!6863 lt!225313)))) ((_ sign_extend 32) (currentByte!6328 (_2!6863 lt!225313))) ((_ sign_extend 32) (currentBit!6323 (_2!6863 lt!225313)))))))

(declare-fun lt!225863 () (_ BitVec 64))

(declare-fun lt!225861 () (_ BitVec 64))

(assert (=> d!46563 (= lt!225865 (bvmul lt!225863 lt!225861))))

(assert (=> d!46563 (or (= lt!225863 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!225861 (bvsdiv (bvmul lt!225863 lt!225861) lt!225863)))))

(assert (=> d!46563 (= lt!225861 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46563 (= lt!225863 ((_ sign_extend 32) (size!2999 (buf!3438 (_2!6863 lt!225313)))))))

(assert (=> d!46563 (= lt!225864 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6328 (_2!6863 lt!225313))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6323 (_2!6863 lt!225313)))))))

(assert (=> d!46563 (invariant!0 (currentBit!6323 (_2!6863 lt!225313)) (currentByte!6328 (_2!6863 lt!225313)) (size!2999 (buf!3438 (_2!6863 lt!225313))))))

(assert (=> d!46563 (= (bitIndex!0 (size!2999 (buf!3438 (_2!6863 lt!225313))) (currentByte!6328 (_2!6863 lt!225313)) (currentBit!6323 (_2!6863 lt!225313))) lt!225864)))

(declare-fun b!145719 () Bool)

(declare-fun res!121868 () Bool)

(assert (=> b!145719 (=> (not res!121868) (not e!97146))))

(assert (=> b!145719 (= res!121868 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!225864))))

(declare-fun b!145720 () Bool)

(declare-fun lt!225866 () (_ BitVec 64))

(assert (=> b!145720 (= e!97146 (bvsle lt!225864 (bvmul lt!225866 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!145720 (or (= lt!225866 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!225866 #b0000000000000000000000000000000000000000000000000000000000001000) lt!225866)))))

(assert (=> b!145720 (= lt!225866 ((_ sign_extend 32) (size!2999 (buf!3438 (_2!6863 lt!225313)))))))

(assert (= (and d!46563 res!121867) b!145719))

(assert (= (and b!145719 res!121868) b!145720))

(declare-fun m!224335 () Bool)

(assert (=> d!46563 m!224335))

(declare-fun m!224337 () Bool)

(assert (=> d!46563 m!224337))

(assert (=> b!145486 d!46563))

(declare-fun d!46565 () Bool)

(declare-fun e!97147 () Bool)

(assert (=> d!46565 e!97147))

(declare-fun res!121869 () Bool)

(assert (=> d!46565 (=> (not res!121869) (not e!97147))))

(declare-fun lt!225871 () (_ BitVec 64))

(declare-fun lt!225868 () (_ BitVec 64))

(declare-fun lt!225870 () (_ BitVec 64))

(assert (=> d!46565 (= res!121869 (= lt!225870 (bvsub lt!225871 lt!225868)))))

(assert (=> d!46565 (or (= (bvand lt!225871 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!225868 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!225871 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!225871 lt!225868) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46565 (= lt!225868 (remainingBits!0 ((_ sign_extend 32) (size!2999 (buf!3438 thiss!1634))) ((_ sign_extend 32) (currentByte!6328 thiss!1634)) ((_ sign_extend 32) (currentBit!6323 thiss!1634))))))

(declare-fun lt!225869 () (_ BitVec 64))

(declare-fun lt!225867 () (_ BitVec 64))

(assert (=> d!46565 (= lt!225871 (bvmul lt!225869 lt!225867))))

(assert (=> d!46565 (or (= lt!225869 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!225867 (bvsdiv (bvmul lt!225869 lt!225867) lt!225869)))))

(assert (=> d!46565 (= lt!225867 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46565 (= lt!225869 ((_ sign_extend 32) (size!2999 (buf!3438 thiss!1634))))))

(assert (=> d!46565 (= lt!225870 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6328 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6323 thiss!1634))))))

(assert (=> d!46565 (invariant!0 (currentBit!6323 thiss!1634) (currentByte!6328 thiss!1634) (size!2999 (buf!3438 thiss!1634)))))

(assert (=> d!46565 (= (bitIndex!0 (size!2999 (buf!3438 thiss!1634)) (currentByte!6328 thiss!1634) (currentBit!6323 thiss!1634)) lt!225870)))

(declare-fun b!145721 () Bool)

(declare-fun res!121870 () Bool)

(assert (=> b!145721 (=> (not res!121870) (not e!97147))))

(assert (=> b!145721 (= res!121870 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!225870))))

(declare-fun b!145722 () Bool)

(declare-fun lt!225872 () (_ BitVec 64))

(assert (=> b!145722 (= e!97147 (bvsle lt!225870 (bvmul lt!225872 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!145722 (or (= lt!225872 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!225872 #b0000000000000000000000000000000000000000000000000000000000001000) lt!225872)))))

(assert (=> b!145722 (= lt!225872 ((_ sign_extend 32) (size!2999 (buf!3438 thiss!1634))))))

(assert (= (and d!46565 res!121869) b!145721))

(assert (= (and b!145721 res!121870) b!145722))

(declare-fun m!224339 () Bool)

(assert (=> d!46565 m!224339))

(assert (=> d!46565 m!223841))

(assert (=> b!145486 d!46565))

(declare-fun d!46567 () Bool)

(assert (=> d!46567 (= (array_inv!2788 arr!237) (bvsge (size!2999 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!28030 d!46567))

(declare-fun d!46569 () Bool)

(assert (=> d!46569 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6323 thiss!1634) (currentByte!6328 thiss!1634) (size!2999 (buf!3438 thiss!1634))))))

(declare-fun bs!11420 () Bool)

(assert (= bs!11420 d!46569))

(assert (=> bs!11420 m!223841))

(assert (=> start!28030 d!46569))

(declare-fun d!46571 () Bool)

(assert (=> d!46571 (= (invariant!0 (currentBit!6323 thiss!1634) (currentByte!6328 thiss!1634) (size!2999 (buf!3438 (_2!6863 lt!225313)))) (and (bvsge (currentBit!6323 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6323 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6328 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6328 thiss!1634) (size!2999 (buf!3438 (_2!6863 lt!225313)))) (and (= (currentBit!6323 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6328 thiss!1634) (size!2999 (buf!3438 (_2!6863 lt!225313))))))))))

(assert (=> b!145476 d!46571))

(declare-fun d!46573 () Bool)

(assert (=> d!46573 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2999 (buf!3438 thiss!1634))) ((_ sign_extend 32) (currentByte!6328 thiss!1634)) ((_ sign_extend 32) (currentBit!6323 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2999 (buf!3438 thiss!1634))) ((_ sign_extend 32) (currentByte!6328 thiss!1634)) ((_ sign_extend 32) (currentBit!6323 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11421 () Bool)

(assert (= bs!11421 d!46573))

(assert (=> bs!11421 m!224339))

(assert (=> b!145487 d!46573))

(declare-fun d!46575 () Bool)

(declare-datatypes ((tuple2!13054 0))(
  ( (tuple2!13055 (_1!6875 (_ BitVec 8)) (_2!6875 BitStream!5256)) )
))
(declare-fun lt!225875 () tuple2!13054)

(declare-fun readByte!0 (BitStream!5256) tuple2!13054)

(assert (=> d!46575 (= lt!225875 (readByte!0 (BitStream!5257 (buf!3438 (_2!6863 lt!225330)) (currentByte!6328 thiss!1634) (currentBit!6323 thiss!1634))))))

(assert (=> d!46575 (= (readBytePure!0 (BitStream!5257 (buf!3438 (_2!6863 lt!225330)) (currentByte!6328 thiss!1634) (currentBit!6323 thiss!1634))) (tuple2!13041 (_2!6875 lt!225875) (_1!6875 lt!225875)))))

(declare-fun bs!11422 () Bool)

(assert (= bs!11422 d!46575))

(declare-fun m!224341 () Bool)

(assert (=> bs!11422 m!224341))

(assert (=> b!145485 d!46575))

(declare-fun d!46577 () Bool)

(declare-fun e!97150 () Bool)

(assert (=> d!46577 e!97150))

(declare-fun res!121873 () Bool)

(assert (=> d!46577 (=> (not res!121873) (not e!97150))))

(assert (=> d!46577 (= res!121873 (and (or (let ((rhs!3223 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3223 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3223) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!46578 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!46578 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!46578 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3222 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3222 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3222) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!225882 () Unit!9071)

(declare-fun choose!57 (BitStream!5256 BitStream!5256 (_ BitVec 64) (_ BitVec 32)) Unit!9071)

(assert (=> d!46577 (= lt!225882 (choose!57 thiss!1634 (_2!6863 lt!225313) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!46577 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6863 lt!225313) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!225882)))

(declare-fun b!145725 () Bool)

(declare-fun lt!225884 () (_ BitVec 32))

(assert (=> b!145725 (= e!97150 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2999 (buf!3438 (_2!6863 lt!225313)))) ((_ sign_extend 32) (currentByte!6328 (_2!6863 lt!225313))) ((_ sign_extend 32) (currentBit!6323 (_2!6863 lt!225313))) (bvsub (bvsub to!404 from!447) lt!225884)))))

(assert (=> b!145725 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!225884 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!225884) #b10000000000000000000000000000000)))))

(declare-fun lt!225883 () (_ BitVec 64))

(assert (=> b!145725 (= lt!225884 ((_ extract 31 0) lt!225883))))

(assert (=> b!145725 (and (bvslt lt!225883 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!225883 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!145725 (= lt!225883 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!46577 res!121873) b!145725))

(declare-fun m!224343 () Bool)

(assert (=> d!46577 m!224343))

(declare-fun m!224345 () Bool)

(assert (=> b!145725 m!224345))

(assert (=> b!145485 d!46577))

(declare-fun d!46580 () Bool)

(assert (=> d!46580 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2999 (buf!3438 (_1!6864 lt!225314)))) ((_ sign_extend 32) (currentByte!6328 (_1!6864 lt!225314))) ((_ sign_extend 32) (currentBit!6323 (_1!6864 lt!225314))) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2999 (buf!3438 (_1!6864 lt!225314)))) ((_ sign_extend 32) (currentByte!6328 (_1!6864 lt!225314))) ((_ sign_extend 32) (currentBit!6323 (_1!6864 lt!225314)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11423 () Bool)

(assert (= bs!11423 d!46580))

(declare-fun m!224347 () Bool)

(assert (=> bs!11423 m!224347))

(assert (=> b!145485 d!46580))

(declare-fun d!46582 () Bool)

(assert (=> d!46582 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2999 (buf!3438 (_2!6863 lt!225330)))) ((_ sign_extend 32) (currentByte!6328 (_2!6863 lt!225313))) ((_ sign_extend 32) (currentBit!6323 (_2!6863 lt!225313))) lt!225331)))

(declare-fun lt!225887 () Unit!9071)

(declare-fun choose!26 (BitStream!5256 array!6622 (_ BitVec 32) BitStream!5256) Unit!9071)

(assert (=> d!46582 (= lt!225887 (choose!26 (_2!6863 lt!225313) (buf!3438 (_2!6863 lt!225330)) lt!225331 (BitStream!5257 (buf!3438 (_2!6863 lt!225330)) (currentByte!6328 (_2!6863 lt!225313)) (currentBit!6323 (_2!6863 lt!225313)))))))

(assert (=> d!46582 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6863 lt!225313) (buf!3438 (_2!6863 lt!225330)) lt!225331) lt!225887)))

(declare-fun bs!11424 () Bool)

(assert (= bs!11424 d!46582))

(assert (=> bs!11424 m!223853))

(declare-fun m!224349 () Bool)

(assert (=> bs!11424 m!224349))

(assert (=> b!145485 d!46582))

(declare-fun b!145736 () Bool)

(declare-fun res!121881 () Bool)

(declare-fun e!97156 () Bool)

(assert (=> b!145736 (=> (not res!121881) (not e!97156))))

(declare-fun lt!225944 () tuple2!13036)

(assert (=> b!145736 (= res!121881 (isPrefixOf!0 (_1!6864 lt!225944) (_2!6863 lt!225313)))))

(declare-fun b!145737 () Bool)

(declare-fun res!121882 () Bool)

(assert (=> b!145737 (=> (not res!121882) (not e!97156))))

(assert (=> b!145737 (= res!121882 (isPrefixOf!0 (_2!6864 lt!225944) (_2!6863 lt!225330)))))

(declare-fun b!145738 () Bool)

(declare-fun e!97155 () Unit!9071)

(declare-fun Unit!9081 () Unit!9071)

(assert (=> b!145738 (= e!97155 Unit!9081)))

(declare-fun b!145740 () Bool)

(declare-fun lt!225943 () Unit!9071)

(assert (=> b!145740 (= e!97155 lt!225943)))

(declare-fun lt!225941 () (_ BitVec 64))

(assert (=> b!145740 (= lt!225941 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!225935 () (_ BitVec 64))

(assert (=> b!145740 (= lt!225935 (bitIndex!0 (size!2999 (buf!3438 (_2!6863 lt!225313))) (currentByte!6328 (_2!6863 lt!225313)) (currentBit!6323 (_2!6863 lt!225313))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6622 array!6622 (_ BitVec 64) (_ BitVec 64)) Unit!9071)

(assert (=> b!145740 (= lt!225943 (arrayBitRangesEqSymmetric!0 (buf!3438 (_2!6863 lt!225313)) (buf!3438 (_2!6863 lt!225330)) lt!225941 lt!225935))))

(declare-fun arrayBitRangesEq!0 (array!6622 array!6622 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!145740 (arrayBitRangesEq!0 (buf!3438 (_2!6863 lt!225330)) (buf!3438 (_2!6863 lt!225313)) lt!225941 lt!225935)))

(declare-fun d!46584 () Bool)

(assert (=> d!46584 e!97156))

(declare-fun res!121880 () Bool)

(assert (=> d!46584 (=> (not res!121880) (not e!97156))))

(assert (=> d!46584 (= res!121880 (isPrefixOf!0 (_1!6864 lt!225944) (_2!6864 lt!225944)))))

(declare-fun lt!225929 () BitStream!5256)

(assert (=> d!46584 (= lt!225944 (tuple2!13037 lt!225929 (_2!6863 lt!225330)))))

(declare-fun lt!225931 () Unit!9071)

(declare-fun lt!225945 () Unit!9071)

(assert (=> d!46584 (= lt!225931 lt!225945)))

(assert (=> d!46584 (isPrefixOf!0 lt!225929 (_2!6863 lt!225330))))

(assert (=> d!46584 (= lt!225945 (lemmaIsPrefixTransitive!0 lt!225929 (_2!6863 lt!225330) (_2!6863 lt!225330)))))

(declare-fun lt!225947 () Unit!9071)

(declare-fun lt!225940 () Unit!9071)

(assert (=> d!46584 (= lt!225947 lt!225940)))

(assert (=> d!46584 (isPrefixOf!0 lt!225929 (_2!6863 lt!225330))))

(assert (=> d!46584 (= lt!225940 (lemmaIsPrefixTransitive!0 lt!225929 (_2!6863 lt!225313) (_2!6863 lt!225330)))))

(declare-fun lt!225928 () Unit!9071)

(assert (=> d!46584 (= lt!225928 e!97155)))

(declare-fun c!7898 () Bool)

(assert (=> d!46584 (= c!7898 (not (= (size!2999 (buf!3438 (_2!6863 lt!225313))) #b00000000000000000000000000000000)))))

(declare-fun lt!225938 () Unit!9071)

(declare-fun lt!225937 () Unit!9071)

(assert (=> d!46584 (= lt!225938 lt!225937)))

(assert (=> d!46584 (isPrefixOf!0 (_2!6863 lt!225330) (_2!6863 lt!225330))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5256) Unit!9071)

(assert (=> d!46584 (= lt!225937 (lemmaIsPrefixRefl!0 (_2!6863 lt!225330)))))

(declare-fun lt!225939 () Unit!9071)

(declare-fun lt!225936 () Unit!9071)

(assert (=> d!46584 (= lt!225939 lt!225936)))

(assert (=> d!46584 (= lt!225936 (lemmaIsPrefixRefl!0 (_2!6863 lt!225330)))))

(declare-fun lt!225934 () Unit!9071)

(declare-fun lt!225942 () Unit!9071)

(assert (=> d!46584 (= lt!225934 lt!225942)))

(assert (=> d!46584 (isPrefixOf!0 lt!225929 lt!225929)))

(assert (=> d!46584 (= lt!225942 (lemmaIsPrefixRefl!0 lt!225929))))

(declare-fun lt!225930 () Unit!9071)

(declare-fun lt!225933 () Unit!9071)

(assert (=> d!46584 (= lt!225930 lt!225933)))

(assert (=> d!46584 (isPrefixOf!0 (_2!6863 lt!225313) (_2!6863 lt!225313))))

(assert (=> d!46584 (= lt!225933 (lemmaIsPrefixRefl!0 (_2!6863 lt!225313)))))

(assert (=> d!46584 (= lt!225929 (BitStream!5257 (buf!3438 (_2!6863 lt!225330)) (currentByte!6328 (_2!6863 lt!225313)) (currentBit!6323 (_2!6863 lt!225313))))))

(assert (=> d!46584 (isPrefixOf!0 (_2!6863 lt!225313) (_2!6863 lt!225330))))

(assert (=> d!46584 (= (reader!0 (_2!6863 lt!225313) (_2!6863 lt!225330)) lt!225944)))

(declare-fun b!145739 () Bool)

(declare-fun lt!225932 () (_ BitVec 64))

(declare-fun lt!225946 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!5256 (_ BitVec 64)) BitStream!5256)

(assert (=> b!145739 (= e!97156 (= (_1!6864 lt!225944) (withMovedBitIndex!0 (_2!6864 lt!225944) (bvsub lt!225946 lt!225932))))))

(assert (=> b!145739 (or (= (bvand lt!225946 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!225932 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!225946 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!225946 lt!225932) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!145739 (= lt!225932 (bitIndex!0 (size!2999 (buf!3438 (_2!6863 lt!225330))) (currentByte!6328 (_2!6863 lt!225330)) (currentBit!6323 (_2!6863 lt!225330))))))

(assert (=> b!145739 (= lt!225946 (bitIndex!0 (size!2999 (buf!3438 (_2!6863 lt!225313))) (currentByte!6328 (_2!6863 lt!225313)) (currentBit!6323 (_2!6863 lt!225313))))))

(assert (= (and d!46584 c!7898) b!145740))

(assert (= (and d!46584 (not c!7898)) b!145738))

(assert (= (and d!46584 res!121880) b!145736))

(assert (= (and b!145736 res!121881) b!145737))

(assert (= (and b!145737 res!121882) b!145739))

(declare-fun m!224351 () Bool)

(assert (=> b!145739 m!224351))

(assert (=> b!145739 m!223839))

(assert (=> b!145739 m!223833))

(declare-fun m!224353 () Bool)

(assert (=> b!145736 m!224353))

(declare-fun m!224355 () Bool)

(assert (=> b!145737 m!224355))

(assert (=> b!145740 m!223833))

(declare-fun m!224357 () Bool)

(assert (=> b!145740 m!224357))

(declare-fun m!224359 () Bool)

(assert (=> b!145740 m!224359))

(declare-fun m!224361 () Bool)

(assert (=> d!46584 m!224361))

(declare-fun m!224363 () Bool)

(assert (=> d!46584 m!224363))

(declare-fun m!224365 () Bool)

(assert (=> d!46584 m!224365))

(declare-fun m!224367 () Bool)

(assert (=> d!46584 m!224367))

(declare-fun m!224369 () Bool)

(assert (=> d!46584 m!224369))

(declare-fun m!224371 () Bool)

(assert (=> d!46584 m!224371))

(declare-fun m!224373 () Bool)

(assert (=> d!46584 m!224373))

(declare-fun m!224375 () Bool)

(assert (=> d!46584 m!224375))

(declare-fun m!224377 () Bool)

(assert (=> d!46584 m!224377))

(assert (=> d!46584 m!223843))

(declare-fun m!224379 () Bool)

(assert (=> d!46584 m!224379))

(assert (=> b!145485 d!46584))

(declare-fun d!46586 () Bool)

(declare-fun e!97157 () Bool)

(assert (=> d!46586 e!97157))

(declare-fun res!121883 () Bool)

(assert (=> d!46586 (=> (not res!121883) (not e!97157))))

(declare-fun lt!225952 () (_ BitVec 64))

(declare-fun lt!225949 () (_ BitVec 64))

(declare-fun lt!225951 () (_ BitVec 64))

(assert (=> d!46586 (= res!121883 (= lt!225951 (bvsub lt!225952 lt!225949)))))

(assert (=> d!46586 (or (= (bvand lt!225952 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!225949 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!225952 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!225952 lt!225949) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46586 (= lt!225949 (remainingBits!0 ((_ sign_extend 32) (size!2999 (buf!3438 (_1!6866 lt!225328)))) ((_ sign_extend 32) (currentByte!6328 (_1!6866 lt!225328))) ((_ sign_extend 32) (currentBit!6323 (_1!6866 lt!225328)))))))

(declare-fun lt!225950 () (_ BitVec 64))

(declare-fun lt!225948 () (_ BitVec 64))

(assert (=> d!46586 (= lt!225952 (bvmul lt!225950 lt!225948))))

(assert (=> d!46586 (or (= lt!225950 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!225948 (bvsdiv (bvmul lt!225950 lt!225948) lt!225950)))))

(assert (=> d!46586 (= lt!225948 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46586 (= lt!225950 ((_ sign_extend 32) (size!2999 (buf!3438 (_1!6866 lt!225328)))))))

(assert (=> d!46586 (= lt!225951 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6328 (_1!6866 lt!225328))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6323 (_1!6866 lt!225328)))))))

(assert (=> d!46586 (invariant!0 (currentBit!6323 (_1!6866 lt!225328)) (currentByte!6328 (_1!6866 lt!225328)) (size!2999 (buf!3438 (_1!6866 lt!225328))))))

(assert (=> d!46586 (= (bitIndex!0 (size!2999 (buf!3438 (_1!6866 lt!225328))) (currentByte!6328 (_1!6866 lt!225328)) (currentBit!6323 (_1!6866 lt!225328))) lt!225951)))

(declare-fun b!145741 () Bool)

(declare-fun res!121884 () Bool)

(assert (=> b!145741 (=> (not res!121884) (not e!97157))))

(assert (=> b!145741 (= res!121884 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!225951))))

(declare-fun b!145742 () Bool)

(declare-fun lt!225953 () (_ BitVec 64))

(assert (=> b!145742 (= e!97157 (bvsle lt!225951 (bvmul lt!225953 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!145742 (or (= lt!225953 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!225953 #b0000000000000000000000000000000000000000000000000000000000001000) lt!225953)))))

(assert (=> b!145742 (= lt!225953 ((_ sign_extend 32) (size!2999 (buf!3438 (_1!6866 lt!225328)))))))

(assert (= (and d!46586 res!121883) b!145741))

(assert (= (and b!145741 res!121884) b!145742))

(declare-fun m!224381 () Bool)

(assert (=> d!46586 m!224381))

(declare-fun m!224383 () Bool)

(assert (=> d!46586 m!224383))

(assert (=> b!145485 d!46586))

(declare-fun d!46588 () Bool)

(declare-fun e!97160 () Bool)

(assert (=> d!46588 e!97160))

(declare-fun res!121887 () Bool)

(assert (=> d!46588 (=> (not res!121887) (not e!97160))))

(declare-fun lt!225965 () tuple2!13040)

(declare-fun lt!225964 () tuple2!13040)

(assert (=> d!46588 (= res!121887 (= (bitIndex!0 (size!2999 (buf!3438 (_1!6866 lt!225965))) (currentByte!6328 (_1!6866 lt!225965)) (currentBit!6323 (_1!6866 lt!225965))) (bitIndex!0 (size!2999 (buf!3438 (_1!6866 lt!225964))) (currentByte!6328 (_1!6866 lt!225964)) (currentBit!6323 (_1!6866 lt!225964)))))))

(declare-fun lt!225963 () Unit!9071)

(declare-fun lt!225962 () BitStream!5256)

(declare-fun choose!14 (BitStream!5256 BitStream!5256 BitStream!5256 tuple2!13040 tuple2!13040 BitStream!5256 (_ BitVec 8) tuple2!13040 tuple2!13040 BitStream!5256 (_ BitVec 8)) Unit!9071)

(assert (=> d!46588 (= lt!225963 (choose!14 lt!225333 (_2!6863 lt!225330) lt!225962 lt!225965 (tuple2!13041 (_1!6866 lt!225965) (_2!6866 lt!225965)) (_1!6866 lt!225965) (_2!6866 lt!225965) lt!225964 (tuple2!13041 (_1!6866 lt!225964) (_2!6866 lt!225964)) (_1!6866 lt!225964) (_2!6866 lt!225964)))))

(assert (=> d!46588 (= lt!225964 (readBytePure!0 lt!225962))))

(assert (=> d!46588 (= lt!225965 (readBytePure!0 lt!225333))))

(assert (=> d!46588 (= lt!225962 (BitStream!5257 (buf!3438 (_2!6863 lt!225330)) (currentByte!6328 lt!225333) (currentBit!6323 lt!225333)))))

(assert (=> d!46588 (= (readBytePrefixLemma!0 lt!225333 (_2!6863 lt!225330)) lt!225963)))

(declare-fun b!145745 () Bool)

(assert (=> b!145745 (= e!97160 (= (_2!6866 lt!225965) (_2!6866 lt!225964)))))

(assert (= (and d!46588 res!121887) b!145745))

(declare-fun m!224385 () Bool)

(assert (=> d!46588 m!224385))

(declare-fun m!224387 () Bool)

(assert (=> d!46588 m!224387))

(declare-fun m!224389 () Bool)

(assert (=> d!46588 m!224389))

(assert (=> d!46588 m!223887))

(declare-fun m!224391 () Bool)

(assert (=> d!46588 m!224391))

(assert (=> b!145485 d!46588))

(declare-fun d!46590 () Bool)

(assert (=> d!46590 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2999 (buf!3438 (_2!6863 lt!225330)))) ((_ sign_extend 32) (currentByte!6328 thiss!1634)) ((_ sign_extend 32) (currentBit!6323 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!225966 () Unit!9071)

(assert (=> d!46590 (= lt!225966 (choose!26 thiss!1634 (buf!3438 (_2!6863 lt!225330)) (bvsub to!404 from!447) (BitStream!5257 (buf!3438 (_2!6863 lt!225330)) (currentByte!6328 thiss!1634) (currentBit!6323 thiss!1634))))))

(assert (=> d!46590 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3438 (_2!6863 lt!225330)) (bvsub to!404 from!447)) lt!225966)))

(declare-fun bs!11425 () Bool)

(assert (= bs!11425 d!46590))

(assert (=> bs!11425 m!223877))

(declare-fun m!224393 () Bool)

(assert (=> bs!11425 m!224393))

(assert (=> b!145485 d!46590))

(declare-fun d!46592 () Bool)

(declare-fun lt!225967 () tuple2!13054)

(assert (=> d!46592 (= lt!225967 (readByte!0 (_1!6864 lt!225314)))))

(assert (=> d!46592 (= (readBytePure!0 (_1!6864 lt!225314)) (tuple2!13041 (_2!6875 lt!225967) (_1!6875 lt!225967)))))

(declare-fun bs!11426 () Bool)

(assert (= bs!11426 d!46592))

(declare-fun m!224395 () Bool)

(assert (=> bs!11426 m!224395))

(assert (=> b!145485 d!46592))

(declare-fun d!46594 () Bool)

(declare-fun e!97163 () Bool)

(assert (=> d!46594 e!97163))

(declare-fun res!121896 () Bool)

(assert (=> d!46594 (=> (not res!121896) (not e!97163))))

(declare-fun lt!225980 () tuple2!13034)

(assert (=> d!46594 (= res!121896 (= (size!2999 (buf!3438 thiss!1634)) (size!2999 (buf!3438 (_2!6863 lt!225980)))))))

(declare-fun choose!6 (BitStream!5256 (_ BitVec 8)) tuple2!13034)

(assert (=> d!46594 (= lt!225980 (choose!6 thiss!1634 (select (arr!3732 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!46594 (validate_offset_byte!0 ((_ sign_extend 32) (size!2999 (buf!3438 thiss!1634))) ((_ sign_extend 32) (currentByte!6328 thiss!1634)) ((_ sign_extend 32) (currentBit!6323 thiss!1634)))))

(assert (=> d!46594 (= (appendByte!0 thiss!1634 (select (arr!3732 arr!237) from!447)) lt!225980)))

(declare-fun b!145752 () Bool)

(declare-fun res!121895 () Bool)

(assert (=> b!145752 (=> (not res!121895) (not e!97163))))

(declare-fun lt!225979 () (_ BitVec 64))

(declare-fun lt!225978 () (_ BitVec 64))

(assert (=> b!145752 (= res!121895 (= (bitIndex!0 (size!2999 (buf!3438 (_2!6863 lt!225980))) (currentByte!6328 (_2!6863 lt!225980)) (currentBit!6323 (_2!6863 lt!225980))) (bvadd lt!225979 lt!225978)))))

(assert (=> b!145752 (or (not (= (bvand lt!225979 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!225978 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!225979 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!225979 lt!225978) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!145752 (= lt!225978 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!145752 (= lt!225979 (bitIndex!0 (size!2999 (buf!3438 thiss!1634)) (currentByte!6328 thiss!1634) (currentBit!6323 thiss!1634)))))

(declare-fun b!145753 () Bool)

(declare-fun res!121894 () Bool)

(assert (=> b!145753 (=> (not res!121894) (not e!97163))))

(assert (=> b!145753 (= res!121894 (isPrefixOf!0 thiss!1634 (_2!6863 lt!225980)))))

(declare-fun b!145754 () Bool)

(declare-fun lt!225981 () tuple2!13036)

(declare-fun lt!225982 () tuple2!13040)

(assert (=> b!145754 (= e!97163 (and (= (_2!6866 lt!225982) (select (arr!3732 arr!237) from!447)) (= (_1!6866 lt!225982) (_2!6864 lt!225981))))))

(assert (=> b!145754 (= lt!225982 (readBytePure!0 (_1!6864 lt!225981)))))

(assert (=> b!145754 (= lt!225981 (reader!0 thiss!1634 (_2!6863 lt!225980)))))

(assert (= (and d!46594 res!121896) b!145752))

(assert (= (and b!145752 res!121895) b!145753))

(assert (= (and b!145753 res!121894) b!145754))

(assert (=> d!46594 m!223857))

(declare-fun m!224397 () Bool)

(assert (=> d!46594 m!224397))

(declare-fun m!224399 () Bool)

(assert (=> d!46594 m!224399))

(declare-fun m!224401 () Bool)

(assert (=> b!145752 m!224401))

(assert (=> b!145752 m!223835))

(declare-fun m!224403 () Bool)

(assert (=> b!145753 m!224403))

(declare-fun m!224405 () Bool)

(assert (=> b!145754 m!224405))

(declare-fun m!224407 () Bool)

(assert (=> b!145754 m!224407))

(assert (=> b!145485 d!46594))

(declare-fun d!46596 () Bool)

(declare-datatypes ((tuple3!562 0))(
  ( (tuple3!563 (_1!6876 Unit!9071) (_2!6876 BitStream!5256) (_3!348 array!6622)) )
))
(declare-fun lt!225985 () tuple3!562)

(declare-fun readByteArrayLoop!0 (BitStream!5256 array!6622 (_ BitVec 32) (_ BitVec 32)) tuple3!562)

(assert (=> d!46596 (= lt!225985 (readByteArrayLoop!0 (_1!6864 lt!225324) (array!6623 (store (arr!3732 arr!237) from!447 (_2!6866 lt!225319)) (size!2999 arr!237)) (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!46596 (= (readByteArrayLoopPure!0 (_1!6864 lt!225324) (array!6623 (store (arr!3732 arr!237) from!447 (_2!6866 lt!225319)) (size!2999 arr!237)) (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13039 (_2!6876 lt!225985) (_3!348 lt!225985)))))

(declare-fun bs!11427 () Bool)

(assert (= bs!11427 d!46596))

(declare-fun m!224409 () Bool)

(assert (=> bs!11427 m!224409))

(assert (=> b!145485 d!46596))

(declare-fun d!46598 () Bool)

(assert (=> d!46598 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2999 (buf!3438 (_2!6863 lt!225330)))) ((_ sign_extend 32) (currentByte!6328 thiss!1634)) ((_ sign_extend 32) (currentBit!6323 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2999 (buf!3438 (_2!6863 lt!225330)))) ((_ sign_extend 32) (currentByte!6328 thiss!1634)) ((_ sign_extend 32) (currentBit!6323 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11428 () Bool)

(assert (= bs!11428 d!46598))

(declare-fun m!224411 () Bool)

(assert (=> bs!11428 m!224411))

(assert (=> b!145485 d!46598))

(declare-fun d!46600 () Bool)

(declare-fun lt!225986 () tuple2!13054)

(assert (=> d!46600 (= lt!225986 (readByte!0 lt!225333))))

(assert (=> d!46600 (= (readBytePure!0 lt!225333) (tuple2!13041 (_2!6875 lt!225986) (_1!6875 lt!225986)))))

(declare-fun bs!11429 () Bool)

(assert (= bs!11429 d!46600))

(declare-fun m!224413 () Bool)

(assert (=> bs!11429 m!224413))

(assert (=> b!145485 d!46600))

(declare-fun d!46602 () Bool)

(assert (=> d!46602 (isPrefixOf!0 thiss!1634 (_2!6863 lt!225330))))

(declare-fun lt!225989 () Unit!9071)

(declare-fun choose!30 (BitStream!5256 BitStream!5256 BitStream!5256) Unit!9071)

(assert (=> d!46602 (= lt!225989 (choose!30 thiss!1634 (_2!6863 lt!225313) (_2!6863 lt!225330)))))

(assert (=> d!46602 (isPrefixOf!0 thiss!1634 (_2!6863 lt!225313))))

(assert (=> d!46602 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6863 lt!225313) (_2!6863 lt!225330)) lt!225989)))

(declare-fun bs!11430 () Bool)

(assert (= bs!11430 d!46602))

(assert (=> bs!11430 m!223861))

(declare-fun m!224415 () Bool)

(assert (=> bs!11430 m!224415))

(assert (=> bs!11430 m!223831))

(assert (=> b!145485 d!46602))

(declare-fun d!46604 () Bool)

(declare-fun res!121904 () Bool)

(declare-fun e!97169 () Bool)

(assert (=> d!46604 (=> (not res!121904) (not e!97169))))

(assert (=> d!46604 (= res!121904 (= (size!2999 (buf!3438 thiss!1634)) (size!2999 (buf!3438 (_2!6863 lt!225330)))))))

(assert (=> d!46604 (= (isPrefixOf!0 thiss!1634 (_2!6863 lt!225330)) e!97169)))

(declare-fun b!145761 () Bool)

(declare-fun res!121905 () Bool)

(assert (=> b!145761 (=> (not res!121905) (not e!97169))))

(assert (=> b!145761 (= res!121905 (bvsle (bitIndex!0 (size!2999 (buf!3438 thiss!1634)) (currentByte!6328 thiss!1634) (currentBit!6323 thiss!1634)) (bitIndex!0 (size!2999 (buf!3438 (_2!6863 lt!225330))) (currentByte!6328 (_2!6863 lt!225330)) (currentBit!6323 (_2!6863 lt!225330)))))))

(declare-fun b!145762 () Bool)

(declare-fun e!97168 () Bool)

(assert (=> b!145762 (= e!97169 e!97168)))

(declare-fun res!121903 () Bool)

(assert (=> b!145762 (=> res!121903 e!97168)))

(assert (=> b!145762 (= res!121903 (= (size!2999 (buf!3438 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!145763 () Bool)

(assert (=> b!145763 (= e!97168 (arrayBitRangesEq!0 (buf!3438 thiss!1634) (buf!3438 (_2!6863 lt!225330)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2999 (buf!3438 thiss!1634)) (currentByte!6328 thiss!1634) (currentBit!6323 thiss!1634))))))

(assert (= (and d!46604 res!121904) b!145761))

(assert (= (and b!145761 res!121905) b!145762))

(assert (= (and b!145762 (not res!121903)) b!145763))

(assert (=> b!145761 m!223835))

(assert (=> b!145761 m!223839))

(assert (=> b!145763 m!223835))

(assert (=> b!145763 m!223835))

(declare-fun m!224417 () Bool)

(assert (=> b!145763 m!224417))

(assert (=> b!145485 d!46604))

(declare-fun d!46606 () Bool)

(assert (=> d!46606 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2999 (buf!3438 (_2!6863 lt!225330)))) ((_ sign_extend 32) (currentByte!6328 (_2!6863 lt!225313))) ((_ sign_extend 32) (currentBit!6323 (_2!6863 lt!225313))) lt!225331) (bvsle ((_ sign_extend 32) lt!225331) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2999 (buf!3438 (_2!6863 lt!225330)))) ((_ sign_extend 32) (currentByte!6328 (_2!6863 lt!225313))) ((_ sign_extend 32) (currentBit!6323 (_2!6863 lt!225313)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11431 () Bool)

(assert (= bs!11431 d!46606))

(declare-fun m!224419 () Bool)

(assert (=> bs!11431 m!224419))

(assert (=> b!145485 d!46606))

(declare-fun b!145774 () Bool)

(declare-fun res!121919 () Bool)

(declare-fun e!97178 () Bool)

(assert (=> b!145774 (=> (not res!121919) (not e!97178))))

(declare-fun lt!226015 () tuple2!13034)

(declare-fun lt!226011 () (_ BitVec 64))

(declare-fun lt!226014 () (_ BitVec 64))

(assert (=> b!145774 (= res!121919 (= (bitIndex!0 (size!2999 (buf!3438 (_2!6863 lt!226015))) (currentByte!6328 (_2!6863 lt!226015)) (currentBit!6323 (_2!6863 lt!226015))) (bvadd lt!226014 lt!226011)))))

(assert (=> b!145774 (or (not (= (bvand lt!226014 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226011 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!226014 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!226014 lt!226011) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!226016 () (_ BitVec 64))

(assert (=> b!145774 (= lt!226011 (bvmul lt!226016 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!145774 (or (= lt!226016 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!226016 #b0000000000000000000000000000000000000000000000000000000000001000) lt!226016)))))

(assert (=> b!145774 (= lt!226016 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!145774 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!145774 (= lt!226014 (bitIndex!0 (size!2999 (buf!3438 (_2!6863 lt!225313))) (currentByte!6328 (_2!6863 lt!225313)) (currentBit!6323 (_2!6863 lt!225313))))))

(declare-fun b!145775 () Bool)

(declare-fun e!97177 () Bool)

(declare-fun lt!226010 () (_ BitVec 64))

(assert (=> b!145775 (= e!97177 (validate_offset_bits!1 ((_ sign_extend 32) (size!2999 (buf!3438 (_2!6863 lt!225313)))) ((_ sign_extend 32) (currentByte!6328 (_2!6863 lt!225313))) ((_ sign_extend 32) (currentBit!6323 (_2!6863 lt!225313))) lt!226010))))

(declare-fun d!46608 () Bool)

(assert (=> d!46608 e!97178))

(declare-fun res!121920 () Bool)

(assert (=> d!46608 (=> (not res!121920) (not e!97178))))

(assert (=> d!46608 (= res!121920 (= (size!2999 (buf!3438 (_2!6863 lt!225313))) (size!2999 (buf!3438 (_2!6863 lt!226015)))))))

(declare-fun choose!64 (BitStream!5256 array!6622 (_ BitVec 32) (_ BitVec 32)) tuple2!13034)

(assert (=> d!46608 (= lt!226015 (choose!64 (_2!6863 lt!225313) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!46608 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2999 arr!237)))))

(assert (=> d!46608 (= (appendByteArrayLoop!0 (_2!6863 lt!225313) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!226015)))

(declare-fun b!145776 () Bool)

(declare-fun lt!226013 () tuple2!13038)

(declare-fun e!97176 () Bool)

(assert (=> b!145776 (= e!97176 (arrayRangesEq!315 arr!237 (_2!6865 lt!226013) #b00000000000000000000000000000000 to!404))))

(declare-fun b!145777 () Bool)

(assert (=> b!145777 (= e!97178 e!97176)))

(declare-fun res!121917 () Bool)

(assert (=> b!145777 (=> (not res!121917) (not e!97176))))

(declare-fun lt!226012 () tuple2!13036)

(assert (=> b!145777 (= res!121917 (and (= (size!2999 (_2!6865 lt!226013)) (size!2999 arr!237)) (= (_1!6865 lt!226013) (_2!6864 lt!226012))))))

(assert (=> b!145777 (= lt!226013 (readByteArrayLoopPure!0 (_1!6864 lt!226012) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!226009 () Unit!9071)

(declare-fun lt!226008 () Unit!9071)

(assert (=> b!145777 (= lt!226009 lt!226008)))

(assert (=> b!145777 (validate_offset_bits!1 ((_ sign_extend 32) (size!2999 (buf!3438 (_2!6863 lt!226015)))) ((_ sign_extend 32) (currentByte!6328 (_2!6863 lt!225313))) ((_ sign_extend 32) (currentBit!6323 (_2!6863 lt!225313))) lt!226010)))

(assert (=> b!145777 (= lt!226008 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6863 lt!225313) (buf!3438 (_2!6863 lt!226015)) lt!226010))))

(assert (=> b!145777 e!97177))

(declare-fun res!121916 () Bool)

(assert (=> b!145777 (=> (not res!121916) (not e!97177))))

(assert (=> b!145777 (= res!121916 (and (= (size!2999 (buf!3438 (_2!6863 lt!225313))) (size!2999 (buf!3438 (_2!6863 lt!226015)))) (bvsge lt!226010 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!145777 (= lt!226010 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!145777 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!145777 (= lt!226012 (reader!0 (_2!6863 lt!225313) (_2!6863 lt!226015)))))

(declare-fun b!145778 () Bool)

(declare-fun res!121918 () Bool)

(assert (=> b!145778 (=> (not res!121918) (not e!97178))))

(assert (=> b!145778 (= res!121918 (isPrefixOf!0 (_2!6863 lt!225313) (_2!6863 lt!226015)))))

(assert (= (and d!46608 res!121920) b!145774))

(assert (= (and b!145774 res!121919) b!145778))

(assert (= (and b!145778 res!121918) b!145777))

(assert (= (and b!145777 res!121916) b!145775))

(assert (= (and b!145777 res!121917) b!145776))

(declare-fun m!224421 () Bool)

(assert (=> b!145775 m!224421))

(declare-fun m!224423 () Bool)

(assert (=> d!46608 m!224423))

(declare-fun m!224425 () Bool)

(assert (=> b!145776 m!224425))

(declare-fun m!224427 () Bool)

(assert (=> b!145777 m!224427))

(declare-fun m!224429 () Bool)

(assert (=> b!145777 m!224429))

(declare-fun m!224431 () Bool)

(assert (=> b!145777 m!224431))

(declare-fun m!224433 () Bool)

(assert (=> b!145777 m!224433))

(declare-fun m!224435 () Bool)

(assert (=> b!145778 m!224435))

(declare-fun m!224437 () Bool)

(assert (=> b!145774 m!224437))

(assert (=> b!145774 m!223833))

(assert (=> b!145485 d!46608))

(declare-fun d!46610 () Bool)

(assert (=> d!46610 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2999 (buf!3438 (_2!6863 lt!225313)))) ((_ sign_extend 32) (currentByte!6328 (_2!6863 lt!225313))) ((_ sign_extend 32) (currentBit!6323 (_2!6863 lt!225313))) lt!225331) (bvsle ((_ sign_extend 32) lt!225331) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2999 (buf!3438 (_2!6863 lt!225313)))) ((_ sign_extend 32) (currentByte!6328 (_2!6863 lt!225313))) ((_ sign_extend 32) (currentBit!6323 (_2!6863 lt!225313)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11432 () Bool)

(assert (= bs!11432 d!46610))

(assert (=> bs!11432 m!224335))

(assert (=> b!145485 d!46610))

(declare-fun b!145779 () Bool)

(declare-fun res!121922 () Bool)

(declare-fun e!97180 () Bool)

(assert (=> b!145779 (=> (not res!121922) (not e!97180))))

(declare-fun lt!226033 () tuple2!13036)

(assert (=> b!145779 (= res!121922 (isPrefixOf!0 (_1!6864 lt!226033) thiss!1634))))

(declare-fun b!145780 () Bool)

(declare-fun res!121923 () Bool)

(assert (=> b!145780 (=> (not res!121923) (not e!97180))))

(assert (=> b!145780 (= res!121923 (isPrefixOf!0 (_2!6864 lt!226033) (_2!6863 lt!225330)))))

(declare-fun b!145781 () Bool)

(declare-fun e!97179 () Unit!9071)

(declare-fun Unit!9082 () Unit!9071)

(assert (=> b!145781 (= e!97179 Unit!9082)))

(declare-fun b!145783 () Bool)

(declare-fun lt!226032 () Unit!9071)

(assert (=> b!145783 (= e!97179 lt!226032)))

(declare-fun lt!226030 () (_ BitVec 64))

(assert (=> b!145783 (= lt!226030 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!226024 () (_ BitVec 64))

(assert (=> b!145783 (= lt!226024 (bitIndex!0 (size!2999 (buf!3438 thiss!1634)) (currentByte!6328 thiss!1634) (currentBit!6323 thiss!1634)))))

(assert (=> b!145783 (= lt!226032 (arrayBitRangesEqSymmetric!0 (buf!3438 thiss!1634) (buf!3438 (_2!6863 lt!225330)) lt!226030 lt!226024))))

(assert (=> b!145783 (arrayBitRangesEq!0 (buf!3438 (_2!6863 lt!225330)) (buf!3438 thiss!1634) lt!226030 lt!226024)))

(declare-fun d!46612 () Bool)

(assert (=> d!46612 e!97180))

(declare-fun res!121921 () Bool)

(assert (=> d!46612 (=> (not res!121921) (not e!97180))))

(assert (=> d!46612 (= res!121921 (isPrefixOf!0 (_1!6864 lt!226033) (_2!6864 lt!226033)))))

(declare-fun lt!226018 () BitStream!5256)

(assert (=> d!46612 (= lt!226033 (tuple2!13037 lt!226018 (_2!6863 lt!225330)))))

(declare-fun lt!226020 () Unit!9071)

(declare-fun lt!226034 () Unit!9071)

(assert (=> d!46612 (= lt!226020 lt!226034)))

(assert (=> d!46612 (isPrefixOf!0 lt!226018 (_2!6863 lt!225330))))

(assert (=> d!46612 (= lt!226034 (lemmaIsPrefixTransitive!0 lt!226018 (_2!6863 lt!225330) (_2!6863 lt!225330)))))

(declare-fun lt!226036 () Unit!9071)

(declare-fun lt!226029 () Unit!9071)

(assert (=> d!46612 (= lt!226036 lt!226029)))

(assert (=> d!46612 (isPrefixOf!0 lt!226018 (_2!6863 lt!225330))))

(assert (=> d!46612 (= lt!226029 (lemmaIsPrefixTransitive!0 lt!226018 thiss!1634 (_2!6863 lt!225330)))))

(declare-fun lt!226017 () Unit!9071)

(assert (=> d!46612 (= lt!226017 e!97179)))

(declare-fun c!7899 () Bool)

(assert (=> d!46612 (= c!7899 (not (= (size!2999 (buf!3438 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!226027 () Unit!9071)

(declare-fun lt!226026 () Unit!9071)

(assert (=> d!46612 (= lt!226027 lt!226026)))

(assert (=> d!46612 (isPrefixOf!0 (_2!6863 lt!225330) (_2!6863 lt!225330))))

(assert (=> d!46612 (= lt!226026 (lemmaIsPrefixRefl!0 (_2!6863 lt!225330)))))

(declare-fun lt!226028 () Unit!9071)

(declare-fun lt!226025 () Unit!9071)

(assert (=> d!46612 (= lt!226028 lt!226025)))

(assert (=> d!46612 (= lt!226025 (lemmaIsPrefixRefl!0 (_2!6863 lt!225330)))))

(declare-fun lt!226023 () Unit!9071)

(declare-fun lt!226031 () Unit!9071)

(assert (=> d!46612 (= lt!226023 lt!226031)))

(assert (=> d!46612 (isPrefixOf!0 lt!226018 lt!226018)))

(assert (=> d!46612 (= lt!226031 (lemmaIsPrefixRefl!0 lt!226018))))

(declare-fun lt!226019 () Unit!9071)

(declare-fun lt!226022 () Unit!9071)

(assert (=> d!46612 (= lt!226019 lt!226022)))

(assert (=> d!46612 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!46612 (= lt!226022 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!46612 (= lt!226018 (BitStream!5257 (buf!3438 (_2!6863 lt!225330)) (currentByte!6328 thiss!1634) (currentBit!6323 thiss!1634)))))

(assert (=> d!46612 (isPrefixOf!0 thiss!1634 (_2!6863 lt!225330))))

(assert (=> d!46612 (= (reader!0 thiss!1634 (_2!6863 lt!225330)) lt!226033)))

(declare-fun b!145782 () Bool)

(declare-fun lt!226021 () (_ BitVec 64))

(declare-fun lt!226035 () (_ BitVec 64))

(assert (=> b!145782 (= e!97180 (= (_1!6864 lt!226033) (withMovedBitIndex!0 (_2!6864 lt!226033) (bvsub lt!226035 lt!226021))))))

(assert (=> b!145782 (or (= (bvand lt!226035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226021 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!226035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226035 lt!226021) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!145782 (= lt!226021 (bitIndex!0 (size!2999 (buf!3438 (_2!6863 lt!225330))) (currentByte!6328 (_2!6863 lt!225330)) (currentBit!6323 (_2!6863 lt!225330))))))

(assert (=> b!145782 (= lt!226035 (bitIndex!0 (size!2999 (buf!3438 thiss!1634)) (currentByte!6328 thiss!1634) (currentBit!6323 thiss!1634)))))

(assert (= (and d!46612 c!7899) b!145783))

(assert (= (and d!46612 (not c!7899)) b!145781))

(assert (= (and d!46612 res!121921) b!145779))

(assert (= (and b!145779 res!121922) b!145780))

(assert (= (and b!145780 res!121923) b!145782))

(declare-fun m!224439 () Bool)

(assert (=> b!145782 m!224439))

(assert (=> b!145782 m!223839))

(assert (=> b!145782 m!223835))

(declare-fun m!224441 () Bool)

(assert (=> b!145779 m!224441))

(declare-fun m!224443 () Bool)

(assert (=> b!145780 m!224443))

(assert (=> b!145783 m!223835))

(declare-fun m!224445 () Bool)

(assert (=> b!145783 m!224445))

(declare-fun m!224447 () Bool)

(assert (=> b!145783 m!224447))

(declare-fun m!224449 () Bool)

(assert (=> d!46612 m!224449))

(declare-fun m!224451 () Bool)

(assert (=> d!46612 m!224451))

(declare-fun m!224453 () Bool)

(assert (=> d!46612 m!224453))

(declare-fun m!224455 () Bool)

(assert (=> d!46612 m!224455))

(declare-fun m!224457 () Bool)

(assert (=> d!46612 m!224457))

(declare-fun m!224459 () Bool)

(assert (=> d!46612 m!224459))

(assert (=> d!46612 m!224373))

(assert (=> d!46612 m!224375))

(declare-fun m!224461 () Bool)

(assert (=> d!46612 m!224461))

(assert (=> d!46612 m!223861))

(declare-fun m!224463 () Bool)

(assert (=> d!46612 m!224463))

(assert (=> b!145485 d!46612))

(declare-fun d!46614 () Bool)

(declare-fun e!97181 () Bool)

(assert (=> d!46614 e!97181))

(declare-fun res!121924 () Bool)

(assert (=> d!46614 (=> (not res!121924) (not e!97181))))

(declare-fun lt!226041 () (_ BitVec 64))

(declare-fun lt!226038 () (_ BitVec 64))

(declare-fun lt!226040 () (_ BitVec 64))

(assert (=> d!46614 (= res!121924 (= lt!226040 (bvsub lt!226041 lt!226038)))))

(assert (=> d!46614 (or (= (bvand lt!226041 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226038 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!226041 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226041 lt!226038) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46614 (= lt!226038 (remainingBits!0 ((_ sign_extend 32) (size!2999 (buf!3438 (_1!6866 lt!225326)))) ((_ sign_extend 32) (currentByte!6328 (_1!6866 lt!225326))) ((_ sign_extend 32) (currentBit!6323 (_1!6866 lt!225326)))))))

(declare-fun lt!226039 () (_ BitVec 64))

(declare-fun lt!226037 () (_ BitVec 64))

(assert (=> d!46614 (= lt!226041 (bvmul lt!226039 lt!226037))))

(assert (=> d!46614 (or (= lt!226039 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!226037 (bvsdiv (bvmul lt!226039 lt!226037) lt!226039)))))

(assert (=> d!46614 (= lt!226037 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46614 (= lt!226039 ((_ sign_extend 32) (size!2999 (buf!3438 (_1!6866 lt!225326)))))))

(assert (=> d!46614 (= lt!226040 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6328 (_1!6866 lt!225326))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6323 (_1!6866 lt!225326)))))))

(assert (=> d!46614 (invariant!0 (currentBit!6323 (_1!6866 lt!225326)) (currentByte!6328 (_1!6866 lt!225326)) (size!2999 (buf!3438 (_1!6866 lt!225326))))))

(assert (=> d!46614 (= (bitIndex!0 (size!2999 (buf!3438 (_1!6866 lt!225326))) (currentByte!6328 (_1!6866 lt!225326)) (currentBit!6323 (_1!6866 lt!225326))) lt!226040)))

(declare-fun b!145784 () Bool)

(declare-fun res!121925 () Bool)

(assert (=> b!145784 (=> (not res!121925) (not e!97181))))

(assert (=> b!145784 (= res!121925 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!226040))))

(declare-fun b!145785 () Bool)

(declare-fun lt!226042 () (_ BitVec 64))

(assert (=> b!145785 (= e!97181 (bvsle lt!226040 (bvmul lt!226042 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!145785 (or (= lt!226042 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!226042 #b0000000000000000000000000000000000000000000000000000000000001000) lt!226042)))))

(assert (=> b!145785 (= lt!226042 ((_ sign_extend 32) (size!2999 (buf!3438 (_1!6866 lt!225326)))))))

(assert (= (and d!46614 res!121924) b!145784))

(assert (= (and b!145784 res!121925) b!145785))

(declare-fun m!224465 () Bool)

(assert (=> d!46614 m!224465))

(declare-fun m!224467 () Bool)

(assert (=> d!46614 m!224467))

(assert (=> b!145485 d!46614))

(declare-fun d!46616 () Bool)

(declare-fun e!97182 () Bool)

(assert (=> d!46616 e!97182))

(declare-fun res!121926 () Bool)

(assert (=> d!46616 (=> (not res!121926) (not e!97182))))

(declare-fun lt!226046 () (_ BitVec 64))

(declare-fun lt!226047 () (_ BitVec 64))

(declare-fun lt!226044 () (_ BitVec 64))

(assert (=> d!46616 (= res!121926 (= lt!226046 (bvsub lt!226047 lt!226044)))))

(assert (=> d!46616 (or (= (bvand lt!226047 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226044 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!226047 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226047 lt!226044) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46616 (= lt!226044 (remainingBits!0 ((_ sign_extend 32) (size!2999 (buf!3438 (_2!6863 lt!225330)))) ((_ sign_extend 32) (currentByte!6328 (_2!6863 lt!225330))) ((_ sign_extend 32) (currentBit!6323 (_2!6863 lt!225330)))))))

(declare-fun lt!226045 () (_ BitVec 64))

(declare-fun lt!226043 () (_ BitVec 64))

(assert (=> d!46616 (= lt!226047 (bvmul lt!226045 lt!226043))))

(assert (=> d!46616 (or (= lt!226045 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!226043 (bvsdiv (bvmul lt!226045 lt!226043) lt!226045)))))

(assert (=> d!46616 (= lt!226043 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46616 (= lt!226045 ((_ sign_extend 32) (size!2999 (buf!3438 (_2!6863 lt!225330)))))))

(assert (=> d!46616 (= lt!226046 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6328 (_2!6863 lt!225330))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6323 (_2!6863 lt!225330)))))))

(assert (=> d!46616 (invariant!0 (currentBit!6323 (_2!6863 lt!225330)) (currentByte!6328 (_2!6863 lt!225330)) (size!2999 (buf!3438 (_2!6863 lt!225330))))))

(assert (=> d!46616 (= (bitIndex!0 (size!2999 (buf!3438 (_2!6863 lt!225330))) (currentByte!6328 (_2!6863 lt!225330)) (currentBit!6323 (_2!6863 lt!225330))) lt!226046)))

(declare-fun b!145786 () Bool)

(declare-fun res!121927 () Bool)

(assert (=> b!145786 (=> (not res!121927) (not e!97182))))

(assert (=> b!145786 (= res!121927 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!226046))))

(declare-fun b!145787 () Bool)

(declare-fun lt!226048 () (_ BitVec 64))

(assert (=> b!145787 (= e!97182 (bvsle lt!226046 (bvmul lt!226048 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!145787 (or (= lt!226048 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!226048 #b0000000000000000000000000000000000000000000000000000000000001000) lt!226048)))))

(assert (=> b!145787 (= lt!226048 ((_ sign_extend 32) (size!2999 (buf!3438 (_2!6863 lt!225330)))))))

(assert (= (and d!46616 res!121926) b!145786))

(assert (= (and b!145786 res!121927) b!145787))

(declare-fun m!224469 () Bool)

(assert (=> d!46616 m!224469))

(declare-fun m!224471 () Bool)

(assert (=> d!46616 m!224471))

(assert (=> b!145475 d!46616))

(assert (=> b!145475 d!46563))

(declare-fun d!46618 () Bool)

(declare-fun lt!226049 () tuple3!562)

(assert (=> d!46618 (= lt!226049 (readByteArrayLoop!0 (_1!6864 lt!225320) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!46618 (= (readByteArrayLoopPure!0 (_1!6864 lt!225320) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13039 (_2!6876 lt!226049) (_3!348 lt!226049)))))

(declare-fun bs!11433 () Bool)

(assert (= bs!11433 d!46618))

(declare-fun m!224473 () Bool)

(assert (=> bs!11433 m!224473))

(assert (=> b!145484 d!46618))

(declare-fun d!46620 () Bool)

(assert (=> d!46620 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2999 (buf!3438 (_2!6863 lt!225330)))) ((_ sign_extend 32) (currentByte!6328 (_2!6863 lt!225313))) ((_ sign_extend 32) (currentBit!6323 (_2!6863 lt!225313))) lt!225325) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2999 (buf!3438 (_2!6863 lt!225330)))) ((_ sign_extend 32) (currentByte!6328 (_2!6863 lt!225313))) ((_ sign_extend 32) (currentBit!6323 (_2!6863 lt!225313)))) lt!225325))))

(declare-fun bs!11434 () Bool)

(assert (= bs!11434 d!46620))

(assert (=> bs!11434 m!224419))

(assert (=> b!145484 d!46620))

(declare-fun d!46622 () Bool)

(assert (=> d!46622 (validate_offset_bits!1 ((_ sign_extend 32) (size!2999 (buf!3438 (_2!6863 lt!225330)))) ((_ sign_extend 32) (currentByte!6328 (_2!6863 lt!225313))) ((_ sign_extend 32) (currentBit!6323 (_2!6863 lt!225313))) lt!225325)))

(declare-fun lt!226052 () Unit!9071)

(declare-fun choose!9 (BitStream!5256 array!6622 (_ BitVec 64) BitStream!5256) Unit!9071)

(assert (=> d!46622 (= lt!226052 (choose!9 (_2!6863 lt!225313) (buf!3438 (_2!6863 lt!225330)) lt!225325 (BitStream!5257 (buf!3438 (_2!6863 lt!225330)) (currentByte!6328 (_2!6863 lt!225313)) (currentBit!6323 (_2!6863 lt!225313)))))))

(assert (=> d!46622 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6863 lt!225313) (buf!3438 (_2!6863 lt!225330)) lt!225325) lt!226052)))

(declare-fun bs!11435 () Bool)

(assert (= bs!11435 d!46622))

(assert (=> bs!11435 m!223821))

(declare-fun m!224475 () Bool)

(assert (=> bs!11435 m!224475))

(assert (=> b!145484 d!46622))

(assert (=> b!145484 d!46584))

(declare-fun d!46624 () Bool)

(declare-fun res!121932 () Bool)

(declare-fun e!97187 () Bool)

(assert (=> d!46624 (=> res!121932 e!97187)))

(assert (=> d!46624 (= res!121932 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!46624 (= (arrayRangesEq!315 arr!237 (_2!6865 lt!225321) #b00000000000000000000000000000000 to!404) e!97187)))

(declare-fun b!145792 () Bool)

(declare-fun e!97188 () Bool)

(assert (=> b!145792 (= e!97187 e!97188)))

(declare-fun res!121933 () Bool)

(assert (=> b!145792 (=> (not res!121933) (not e!97188))))

(assert (=> b!145792 (= res!121933 (= (select (arr!3732 arr!237) #b00000000000000000000000000000000) (select (arr!3732 (_2!6865 lt!225321)) #b00000000000000000000000000000000)))))

(declare-fun b!145793 () Bool)

(assert (=> b!145793 (= e!97188 (arrayRangesEq!315 arr!237 (_2!6865 lt!225321) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!46624 (not res!121932)) b!145792))

(assert (= (and b!145792 res!121933) b!145793))

(declare-fun m!224477 () Bool)

(assert (=> b!145792 m!224477))

(declare-fun m!224479 () Bool)

(assert (=> b!145792 m!224479))

(declare-fun m!224481 () Bool)

(assert (=> b!145793 m!224481))

(assert (=> b!145482 d!46624))

(declare-fun d!46626 () Bool)

(declare-fun res!121935 () Bool)

(declare-fun e!97190 () Bool)

(assert (=> d!46626 (=> (not res!121935) (not e!97190))))

(assert (=> d!46626 (= res!121935 (= (size!2999 (buf!3438 thiss!1634)) (size!2999 (buf!3438 (_2!6863 lt!225313)))))))

(assert (=> d!46626 (= (isPrefixOf!0 thiss!1634 (_2!6863 lt!225313)) e!97190)))

(declare-fun b!145794 () Bool)

(declare-fun res!121936 () Bool)

(assert (=> b!145794 (=> (not res!121936) (not e!97190))))

(assert (=> b!145794 (= res!121936 (bvsle (bitIndex!0 (size!2999 (buf!3438 thiss!1634)) (currentByte!6328 thiss!1634) (currentBit!6323 thiss!1634)) (bitIndex!0 (size!2999 (buf!3438 (_2!6863 lt!225313))) (currentByte!6328 (_2!6863 lt!225313)) (currentBit!6323 (_2!6863 lt!225313)))))))

(declare-fun b!145795 () Bool)

(declare-fun e!97189 () Bool)

(assert (=> b!145795 (= e!97190 e!97189)))

(declare-fun res!121934 () Bool)

(assert (=> b!145795 (=> res!121934 e!97189)))

(assert (=> b!145795 (= res!121934 (= (size!2999 (buf!3438 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!145796 () Bool)

(assert (=> b!145796 (= e!97189 (arrayBitRangesEq!0 (buf!3438 thiss!1634) (buf!3438 (_2!6863 lt!225313)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2999 (buf!3438 thiss!1634)) (currentByte!6328 thiss!1634) (currentBit!6323 thiss!1634))))))

(assert (= (and d!46626 res!121935) b!145794))

(assert (= (and b!145794 res!121936) b!145795))

(assert (= (and b!145795 (not res!121934)) b!145796))

(assert (=> b!145794 m!223835))

(assert (=> b!145794 m!223833))

(assert (=> b!145796 m!223835))

(assert (=> b!145796 m!223835))

(declare-fun m!224483 () Bool)

(assert (=> b!145796 m!224483))

(assert (=> b!145483 d!46626))

(declare-fun d!46628 () Bool)

(declare-fun lt!226053 () tuple2!13054)

(assert (=> d!46628 (= lt!226053 (readByte!0 (_1!6864 lt!225329)))))

(assert (=> d!46628 (= (readBytePure!0 (_1!6864 lt!225329)) (tuple2!13041 (_2!6875 lt!226053) (_1!6875 lt!226053)))))

(declare-fun bs!11436 () Bool)

(assert (= bs!11436 d!46628))

(declare-fun m!224485 () Bool)

(assert (=> bs!11436 m!224485))

(assert (=> b!145480 d!46628))

(declare-fun b!145797 () Bool)

(declare-fun res!121938 () Bool)

(declare-fun e!97192 () Bool)

(assert (=> b!145797 (=> (not res!121938) (not e!97192))))

(declare-fun lt!226070 () tuple2!13036)

(assert (=> b!145797 (= res!121938 (isPrefixOf!0 (_1!6864 lt!226070) thiss!1634))))

(declare-fun b!145798 () Bool)

(declare-fun res!121939 () Bool)

(assert (=> b!145798 (=> (not res!121939) (not e!97192))))

(assert (=> b!145798 (= res!121939 (isPrefixOf!0 (_2!6864 lt!226070) (_2!6863 lt!225313)))))

(declare-fun b!145799 () Bool)

(declare-fun e!97191 () Unit!9071)

(declare-fun Unit!9083 () Unit!9071)

(assert (=> b!145799 (= e!97191 Unit!9083)))

(declare-fun b!145801 () Bool)

(declare-fun lt!226069 () Unit!9071)

(assert (=> b!145801 (= e!97191 lt!226069)))

(declare-fun lt!226067 () (_ BitVec 64))

(assert (=> b!145801 (= lt!226067 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!226061 () (_ BitVec 64))

(assert (=> b!145801 (= lt!226061 (bitIndex!0 (size!2999 (buf!3438 thiss!1634)) (currentByte!6328 thiss!1634) (currentBit!6323 thiss!1634)))))

(assert (=> b!145801 (= lt!226069 (arrayBitRangesEqSymmetric!0 (buf!3438 thiss!1634) (buf!3438 (_2!6863 lt!225313)) lt!226067 lt!226061))))

(assert (=> b!145801 (arrayBitRangesEq!0 (buf!3438 (_2!6863 lt!225313)) (buf!3438 thiss!1634) lt!226067 lt!226061)))

(declare-fun d!46630 () Bool)

(assert (=> d!46630 e!97192))

(declare-fun res!121937 () Bool)

(assert (=> d!46630 (=> (not res!121937) (not e!97192))))

(assert (=> d!46630 (= res!121937 (isPrefixOf!0 (_1!6864 lt!226070) (_2!6864 lt!226070)))))

(declare-fun lt!226055 () BitStream!5256)

(assert (=> d!46630 (= lt!226070 (tuple2!13037 lt!226055 (_2!6863 lt!225313)))))

(declare-fun lt!226057 () Unit!9071)

(declare-fun lt!226071 () Unit!9071)

(assert (=> d!46630 (= lt!226057 lt!226071)))

(assert (=> d!46630 (isPrefixOf!0 lt!226055 (_2!6863 lt!225313))))

(assert (=> d!46630 (= lt!226071 (lemmaIsPrefixTransitive!0 lt!226055 (_2!6863 lt!225313) (_2!6863 lt!225313)))))

(declare-fun lt!226073 () Unit!9071)

(declare-fun lt!226066 () Unit!9071)

(assert (=> d!46630 (= lt!226073 lt!226066)))

(assert (=> d!46630 (isPrefixOf!0 lt!226055 (_2!6863 lt!225313))))

(assert (=> d!46630 (= lt!226066 (lemmaIsPrefixTransitive!0 lt!226055 thiss!1634 (_2!6863 lt!225313)))))

(declare-fun lt!226054 () Unit!9071)

(assert (=> d!46630 (= lt!226054 e!97191)))

(declare-fun c!7900 () Bool)

(assert (=> d!46630 (= c!7900 (not (= (size!2999 (buf!3438 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!226064 () Unit!9071)

(declare-fun lt!226063 () Unit!9071)

(assert (=> d!46630 (= lt!226064 lt!226063)))

(assert (=> d!46630 (isPrefixOf!0 (_2!6863 lt!225313) (_2!6863 lt!225313))))

(assert (=> d!46630 (= lt!226063 (lemmaIsPrefixRefl!0 (_2!6863 lt!225313)))))

(declare-fun lt!226065 () Unit!9071)

(declare-fun lt!226062 () Unit!9071)

(assert (=> d!46630 (= lt!226065 lt!226062)))

(assert (=> d!46630 (= lt!226062 (lemmaIsPrefixRefl!0 (_2!6863 lt!225313)))))

(declare-fun lt!226060 () Unit!9071)

(declare-fun lt!226068 () Unit!9071)

(assert (=> d!46630 (= lt!226060 lt!226068)))

(assert (=> d!46630 (isPrefixOf!0 lt!226055 lt!226055)))

(assert (=> d!46630 (= lt!226068 (lemmaIsPrefixRefl!0 lt!226055))))

(declare-fun lt!226056 () Unit!9071)

(declare-fun lt!226059 () Unit!9071)

(assert (=> d!46630 (= lt!226056 lt!226059)))

(assert (=> d!46630 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!46630 (= lt!226059 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!46630 (= lt!226055 (BitStream!5257 (buf!3438 (_2!6863 lt!225313)) (currentByte!6328 thiss!1634) (currentBit!6323 thiss!1634)))))

(assert (=> d!46630 (isPrefixOf!0 thiss!1634 (_2!6863 lt!225313))))

(assert (=> d!46630 (= (reader!0 thiss!1634 (_2!6863 lt!225313)) lt!226070)))

(declare-fun lt!226072 () (_ BitVec 64))

(declare-fun b!145800 () Bool)

(declare-fun lt!226058 () (_ BitVec 64))

(assert (=> b!145800 (= e!97192 (= (_1!6864 lt!226070) (withMovedBitIndex!0 (_2!6864 lt!226070) (bvsub lt!226072 lt!226058))))))

(assert (=> b!145800 (or (= (bvand lt!226072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!226058 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!226072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!226072 lt!226058) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!145800 (= lt!226058 (bitIndex!0 (size!2999 (buf!3438 (_2!6863 lt!225313))) (currentByte!6328 (_2!6863 lt!225313)) (currentBit!6323 (_2!6863 lt!225313))))))

(assert (=> b!145800 (= lt!226072 (bitIndex!0 (size!2999 (buf!3438 thiss!1634)) (currentByte!6328 thiss!1634) (currentBit!6323 thiss!1634)))))

(assert (= (and d!46630 c!7900) b!145801))

(assert (= (and d!46630 (not c!7900)) b!145799))

(assert (= (and d!46630 res!121937) b!145797))

(assert (= (and b!145797 res!121938) b!145798))

(assert (= (and b!145798 res!121939) b!145800))

(declare-fun m!224487 () Bool)

(assert (=> b!145800 m!224487))

(assert (=> b!145800 m!223833))

(assert (=> b!145800 m!223835))

(declare-fun m!224489 () Bool)

(assert (=> b!145797 m!224489))

(declare-fun m!224491 () Bool)

(assert (=> b!145798 m!224491))

(assert (=> b!145801 m!223835))

(declare-fun m!224493 () Bool)

(assert (=> b!145801 m!224493))

(declare-fun m!224495 () Bool)

(assert (=> b!145801 m!224495))

(declare-fun m!224497 () Bool)

(assert (=> d!46630 m!224497))

(assert (=> d!46630 m!224451))

(declare-fun m!224499 () Bool)

(assert (=> d!46630 m!224499))

(declare-fun m!224501 () Bool)

(assert (=> d!46630 m!224501))

(declare-fun m!224503 () Bool)

(assert (=> d!46630 m!224503))

(assert (=> d!46630 m!224459))

(assert (=> d!46630 m!224371))

(assert (=> d!46630 m!224363))

(declare-fun m!224505 () Bool)

(assert (=> d!46630 m!224505))

(assert (=> d!46630 m!223831))

(declare-fun m!224507 () Bool)

(assert (=> d!46630 m!224507))

(assert (=> b!145480 d!46630))

(declare-fun d!46632 () Bool)

(declare-fun res!121941 () Bool)

(declare-fun e!97194 () Bool)

(assert (=> d!46632 (=> (not res!121941) (not e!97194))))

(assert (=> d!46632 (= res!121941 (= (size!2999 (buf!3438 (_2!6863 lt!225313))) (size!2999 (buf!3438 (_2!6863 lt!225330)))))))

(assert (=> d!46632 (= (isPrefixOf!0 (_2!6863 lt!225313) (_2!6863 lt!225330)) e!97194)))

(declare-fun b!145802 () Bool)

(declare-fun res!121942 () Bool)

(assert (=> b!145802 (=> (not res!121942) (not e!97194))))

(assert (=> b!145802 (= res!121942 (bvsle (bitIndex!0 (size!2999 (buf!3438 (_2!6863 lt!225313))) (currentByte!6328 (_2!6863 lt!225313)) (currentBit!6323 (_2!6863 lt!225313))) (bitIndex!0 (size!2999 (buf!3438 (_2!6863 lt!225330))) (currentByte!6328 (_2!6863 lt!225330)) (currentBit!6323 (_2!6863 lt!225330)))))))

(declare-fun b!145803 () Bool)

(declare-fun e!97193 () Bool)

(assert (=> b!145803 (= e!97194 e!97193)))

(declare-fun res!121940 () Bool)

(assert (=> b!145803 (=> res!121940 e!97193)))

(assert (=> b!145803 (= res!121940 (= (size!2999 (buf!3438 (_2!6863 lt!225313))) #b00000000000000000000000000000000))))

(declare-fun b!145804 () Bool)

(assert (=> b!145804 (= e!97193 (arrayBitRangesEq!0 (buf!3438 (_2!6863 lt!225313)) (buf!3438 (_2!6863 lt!225330)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2999 (buf!3438 (_2!6863 lt!225313))) (currentByte!6328 (_2!6863 lt!225313)) (currentBit!6323 (_2!6863 lt!225313)))))))

(assert (= (and d!46632 res!121941) b!145802))

(assert (= (and b!145802 res!121942) b!145803))

(assert (= (and b!145803 (not res!121940)) b!145804))

(assert (=> b!145802 m!223833))

(assert (=> b!145802 m!223839))

(assert (=> b!145804 m!223833))

(assert (=> b!145804 m!223833))

(declare-fun m!224509 () Bool)

(assert (=> b!145804 m!224509))

(assert (=> b!145489 d!46632))

(declare-fun d!46634 () Bool)

(assert (=> d!46634 (= (array_inv!2788 (buf!3438 thiss!1634)) (bvsge (size!2999 (buf!3438 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!145479 d!46634))

(declare-fun lt!226074 () tuple3!562)

(declare-fun d!46636 () Bool)

(assert (=> d!46636 (= lt!226074 (readByteArrayLoop!0 (_1!6864 lt!225314) arr!237 from!447 to!404))))

(assert (=> d!46636 (= (readByteArrayLoopPure!0 (_1!6864 lt!225314) arr!237 from!447 to!404) (tuple2!13039 (_2!6876 lt!226074) (_3!348 lt!226074)))))

(declare-fun bs!11437 () Bool)

(assert (= bs!11437 d!46636))

(declare-fun m!224511 () Bool)

(assert (=> bs!11437 m!224511))

(assert (=> b!145477 d!46636))

(declare-fun d!46638 () Bool)

(assert (=> d!46638 (= (invariant!0 (currentBit!6323 thiss!1634) (currentByte!6328 thiss!1634) (size!2999 (buf!3438 thiss!1634))) (and (bvsge (currentBit!6323 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6323 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6328 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6328 thiss!1634) (size!2999 (buf!3438 thiss!1634))) (and (= (currentBit!6323 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6328 thiss!1634) (size!2999 (buf!3438 thiss!1634)))))))))

(assert (=> b!145488 d!46638))

(check-sat (not b!145800) (not d!46628) (not b!145752) (not b!145754) (not d!46600) (not d!46580) (not d!46563) (not d!46565) (not d!46588) (not b!145725) (not b!145777) (not d!46594) (not b!145794) (not b!145739) (not b!145737) (not d!46573) (not d!46622) (not b!145783) (not b!145798) (not d!46636) (not d!46598) (not d!46584) (not d!46596) (not b!145782) (not d!46612) (not d!46577) (not b!145780) (not d!46590) (not b!145801) (not b!145763) (not b!145761) (not d!46616) (not d!46586) (not b!145774) (not b!145796) (not d!46602) (not d!46608) (not b!145775) (not b!145753) (not d!46614) (not b!145802) (not d!46569) (not b!145779) (not d!46630) (not d!46582) (not d!46620) (not b!145804) (not d!46575) (not b!145776) (not d!46606) (not b!145736) (not b!145740) (not b!145797) (not b!145778) (not b!145793) (not d!46592) (not d!46610) (not d!46618))
(check-sat)
