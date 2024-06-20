; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25946 () Bool)

(assert start!25946)

(declare-fun b!132727 () Bool)

(declare-fun e!88014 () Bool)

(declare-datatypes ((array!6116 0))(
  ( (array!6117 (arr!3404 (Array (_ BitVec 32) (_ BitVec 8))) (size!2769 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4802 0))(
  ( (BitStream!4803 (buf!3142 array!6116) (currentByte!5927 (_ BitVec 32)) (currentBit!5922 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11528 0))(
  ( (tuple2!11529 (_1!6070 BitStream!4802) (_2!6070 (_ BitVec 8))) )
))
(declare-fun lt!204943 () tuple2!11528)

(declare-fun lt!204938 () tuple2!11528)

(assert (=> b!132727 (= e!88014 (= (_2!6070 lt!204943) (_2!6070 lt!204938)))))

(declare-fun b!132728 () Bool)

(declare-fun e!88016 () Bool)

(declare-fun e!88012 () Bool)

(assert (=> b!132728 (= e!88016 e!88012)))

(declare-fun res!110230 () Bool)

(assert (=> b!132728 (=> (not res!110230) (not e!88012))))

(declare-datatypes ((Unit!8170 0))(
  ( (Unit!8171) )
))
(declare-datatypes ((tuple2!11530 0))(
  ( (tuple2!11531 (_1!6071 Unit!8170) (_2!6071 BitStream!4802)) )
))
(declare-fun lt!204948 () tuple2!11530)

(declare-fun lt!204940 () (_ BitVec 64))

(declare-fun lt!204929 () tuple2!11530)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!132728 (= res!110230 (= (bitIndex!0 (size!2769 (buf!3142 (_2!6071 lt!204948))) (currentByte!5927 (_2!6071 lt!204948)) (currentBit!5922 (_2!6071 lt!204948))) (bvadd (bitIndex!0 (size!2769 (buf!3142 (_2!6071 lt!204929))) (currentByte!5927 (_2!6071 lt!204929)) (currentBit!5922 (_2!6071 lt!204929))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!204940))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!132728 (= lt!204940 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!132729 () Bool)

(declare-fun res!110236 () Bool)

(declare-fun e!88018 () Bool)

(assert (=> b!132729 (=> (not res!110236) (not e!88018))))

(assert (=> b!132729 (= res!110236 (bvslt from!447 to!404))))

(declare-datatypes ((tuple2!11532 0))(
  ( (tuple2!11533 (_1!6072 BitStream!4802) (_2!6072 array!6116)) )
))
(declare-fun lt!204930 () tuple2!11532)

(declare-fun e!88010 () Bool)

(declare-fun b!132730 () Bool)

(declare-fun arr!237 () array!6116)

(declare-fun arrayRangesEq!172 (array!6116 array!6116 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!132730 (= e!88010 (not (arrayRangesEq!172 arr!237 (_2!6072 lt!204930) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!132731 () Bool)

(declare-fun e!88015 () Bool)

(declare-fun thiss!1634 () BitStream!4802)

(declare-fun array_inv!2558 (array!6116) Bool)

(assert (=> b!132731 (= e!88015 (array_inv!2558 (buf!3142 thiss!1634)))))

(declare-fun b!132732 () Bool)

(declare-fun res!110227 () Bool)

(declare-fun e!88011 () Bool)

(assert (=> b!132732 (=> (not res!110227) (not e!88011))))

(assert (=> b!132732 (= res!110227 (= (bitIndex!0 (size!2769 (buf!3142 (_2!6071 lt!204929))) (currentByte!5927 (_2!6071 lt!204929)) (currentBit!5922 (_2!6071 lt!204929))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2769 (buf!3142 thiss!1634)) (currentByte!5927 thiss!1634) (currentBit!5922 thiss!1634)))))))

(declare-fun lt!204926 () tuple2!11528)

(declare-fun b!132733 () Bool)

(declare-datatypes ((tuple2!11534 0))(
  ( (tuple2!11535 (_1!6073 BitStream!4802) (_2!6073 BitStream!4802)) )
))
(declare-fun lt!204928 () tuple2!11534)

(assert (=> b!132733 (= e!88011 (and (= (_2!6070 lt!204926) (select (arr!3404 arr!237) from!447)) (= (_1!6070 lt!204926) (_2!6073 lt!204928))))))

(declare-fun readBytePure!0 (BitStream!4802) tuple2!11528)

(assert (=> b!132733 (= lt!204926 (readBytePure!0 (_1!6073 lt!204928)))))

(declare-fun reader!0 (BitStream!4802 BitStream!4802) tuple2!11534)

(assert (=> b!132733 (= lt!204928 (reader!0 thiss!1634 (_2!6071 lt!204929)))))

(declare-fun b!132734 () Bool)

(declare-fun e!88019 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!132734 (= e!88019 (invariant!0 (currentBit!5922 thiss!1634) (currentByte!5927 thiss!1634) (size!2769 (buf!3142 (_2!6071 lt!204929)))))))

(declare-fun b!132735 () Bool)

(declare-fun res!110228 () Bool)

(assert (=> b!132735 (=> (not res!110228) (not e!88012))))

(declare-fun isPrefixOf!0 (BitStream!4802 BitStream!4802) Bool)

(assert (=> b!132735 (= res!110228 (isPrefixOf!0 (_2!6071 lt!204929) (_2!6071 lt!204948)))))

(declare-fun b!132736 () Bool)

(declare-fun res!110237 () Bool)

(assert (=> b!132736 (=> (not res!110237) (not e!88018))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!132736 (= res!110237 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2769 (buf!3142 thiss!1634))) ((_ sign_extend 32) (currentByte!5927 thiss!1634)) ((_ sign_extend 32) (currentBit!5922 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!132737 () Bool)

(declare-fun res!110238 () Bool)

(assert (=> b!132737 (=> (not res!110238) (not e!88018))))

(assert (=> b!132737 (= res!110238 (invariant!0 (currentBit!5922 thiss!1634) (currentByte!5927 thiss!1634) (size!2769 (buf!3142 thiss!1634))))))

(declare-fun b!132738 () Bool)

(assert (=> b!132738 (= e!88018 (not (bvsle #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!204935 () tuple2!11532)

(declare-fun lt!204927 () tuple2!11532)

(assert (=> b!132738 (arrayRangesEq!172 (_2!6072 lt!204935) (_2!6072 lt!204927) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!204937 () Unit!8170)

(declare-fun lt!204949 () tuple2!11534)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4802 array!6116 (_ BitVec 32) (_ BitVec 32)) Unit!8170)

(assert (=> b!132738 (= lt!204937 (readByteArrayLoopArrayPrefixLemma!0 (_1!6073 lt!204949) arr!237 from!447 to!404))))

(declare-fun lt!204941 () array!6116)

(declare-fun readByteArrayLoopPure!0 (BitStream!4802 array!6116 (_ BitVec 32) (_ BitVec 32)) tuple2!11532)

(declare-fun withMovedByteIndex!0 (BitStream!4802 (_ BitVec 32)) BitStream!4802)

(assert (=> b!132738 (= lt!204927 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6073 lt!204949) #b00000000000000000000000000000001) lt!204941 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!204932 () tuple2!11532)

(declare-fun lt!204944 () tuple2!11534)

(assert (=> b!132738 (= lt!204932 (readByteArrayLoopPure!0 (_1!6073 lt!204944) lt!204941 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!204939 () tuple2!11528)

(assert (=> b!132738 (= lt!204941 (array!6117 (store (arr!3404 arr!237) from!447 (_2!6070 lt!204939)) (size!2769 arr!237)))))

(declare-fun lt!204946 () (_ BitVec 32))

(assert (=> b!132738 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2769 (buf!3142 (_2!6071 lt!204948)))) ((_ sign_extend 32) (currentByte!5927 (_2!6071 lt!204929))) ((_ sign_extend 32) (currentBit!5922 (_2!6071 lt!204929))) lt!204946)))

(declare-fun lt!204947 () Unit!8170)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4802 array!6116 (_ BitVec 32)) Unit!8170)

(assert (=> b!132738 (= lt!204947 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6071 lt!204929) (buf!3142 (_2!6071 lt!204948)) lt!204946))))

(assert (=> b!132738 (= (_1!6072 lt!204935) (_2!6073 lt!204949))))

(assert (=> b!132738 (= lt!204935 (readByteArrayLoopPure!0 (_1!6073 lt!204949) arr!237 from!447 to!404))))

(assert (=> b!132738 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2769 (buf!3142 (_2!6071 lt!204948)))) ((_ sign_extend 32) (currentByte!5927 thiss!1634)) ((_ sign_extend 32) (currentBit!5922 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!204942 () Unit!8170)

(assert (=> b!132738 (= lt!204942 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3142 (_2!6071 lt!204948)) (bvsub to!404 from!447)))))

(assert (=> b!132738 (= (_2!6070 lt!204939) (select (arr!3404 arr!237) from!447))))

(assert (=> b!132738 (= lt!204939 (readBytePure!0 (_1!6073 lt!204949)))))

(assert (=> b!132738 (= lt!204944 (reader!0 (_2!6071 lt!204929) (_2!6071 lt!204948)))))

(assert (=> b!132738 (= lt!204949 (reader!0 thiss!1634 (_2!6071 lt!204948)))))

(assert (=> b!132738 e!88014))

(declare-fun res!110234 () Bool)

(assert (=> b!132738 (=> (not res!110234) (not e!88014))))

(assert (=> b!132738 (= res!110234 (= (bitIndex!0 (size!2769 (buf!3142 (_1!6070 lt!204943))) (currentByte!5927 (_1!6070 lt!204943)) (currentBit!5922 (_1!6070 lt!204943))) (bitIndex!0 (size!2769 (buf!3142 (_1!6070 lt!204938))) (currentByte!5927 (_1!6070 lt!204938)) (currentBit!5922 (_1!6070 lt!204938)))))))

(declare-fun lt!204936 () Unit!8170)

(declare-fun lt!204945 () BitStream!4802)

(declare-fun readBytePrefixLemma!0 (BitStream!4802 BitStream!4802) Unit!8170)

(assert (=> b!132738 (= lt!204936 (readBytePrefixLemma!0 lt!204945 (_2!6071 lt!204948)))))

(assert (=> b!132738 (= lt!204938 (readBytePure!0 (BitStream!4803 (buf!3142 (_2!6071 lt!204948)) (currentByte!5927 thiss!1634) (currentBit!5922 thiss!1634))))))

(assert (=> b!132738 (= lt!204943 (readBytePure!0 lt!204945))))

(assert (=> b!132738 (= lt!204945 (BitStream!4803 (buf!3142 (_2!6071 lt!204929)) (currentByte!5927 thiss!1634) (currentBit!5922 thiss!1634)))))

(assert (=> b!132738 e!88019))

(declare-fun res!110231 () Bool)

(assert (=> b!132738 (=> (not res!110231) (not e!88019))))

(assert (=> b!132738 (= res!110231 (isPrefixOf!0 thiss!1634 (_2!6071 lt!204948)))))

(declare-fun lt!204950 () Unit!8170)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4802 BitStream!4802 BitStream!4802) Unit!8170)

(assert (=> b!132738 (= lt!204950 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6071 lt!204929) (_2!6071 lt!204948)))))

(assert (=> b!132738 e!88016))

(declare-fun res!110239 () Bool)

(assert (=> b!132738 (=> (not res!110239) (not e!88016))))

(assert (=> b!132738 (= res!110239 (= (size!2769 (buf!3142 (_2!6071 lt!204929))) (size!2769 (buf!3142 (_2!6071 lt!204948)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4802 array!6116 (_ BitVec 32) (_ BitVec 32)) tuple2!11530)

(assert (=> b!132738 (= lt!204948 (appendByteArrayLoop!0 (_2!6071 lt!204929) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!132738 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2769 (buf!3142 (_2!6071 lt!204929)))) ((_ sign_extend 32) (currentByte!5927 (_2!6071 lt!204929))) ((_ sign_extend 32) (currentBit!5922 (_2!6071 lt!204929))) lt!204946)))

(assert (=> b!132738 (= lt!204946 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!204934 () Unit!8170)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4802 BitStream!4802 (_ BitVec 64) (_ BitVec 32)) Unit!8170)

(assert (=> b!132738 (= lt!204934 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6071 lt!204929) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!132738 e!88011))

(declare-fun res!110232 () Bool)

(assert (=> b!132738 (=> (not res!110232) (not e!88011))))

(assert (=> b!132738 (= res!110232 (= (size!2769 (buf!3142 thiss!1634)) (size!2769 (buf!3142 (_2!6071 lt!204929)))))))

(declare-fun appendByte!0 (BitStream!4802 (_ BitVec 8)) tuple2!11530)

(assert (=> b!132738 (= lt!204929 (appendByte!0 thiss!1634 (select (arr!3404 arr!237) from!447)))))

(declare-fun res!110235 () Bool)

(assert (=> start!25946 (=> (not res!110235) (not e!88018))))

(assert (=> start!25946 (= res!110235 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2769 arr!237))))))

(assert (=> start!25946 e!88018))

(assert (=> start!25946 true))

(assert (=> start!25946 (array_inv!2558 arr!237)))

(declare-fun inv!12 (BitStream!4802) Bool)

(assert (=> start!25946 (and (inv!12 thiss!1634) e!88015)))

(declare-fun b!132739 () Bool)

(declare-fun res!110233 () Bool)

(assert (=> b!132739 (=> (not res!110233) (not e!88011))))

(assert (=> b!132739 (= res!110233 (isPrefixOf!0 thiss!1634 (_2!6071 lt!204929)))))

(declare-fun b!132740 () Bool)

(assert (=> b!132740 (= e!88012 (not e!88010))))

(declare-fun res!110229 () Bool)

(assert (=> b!132740 (=> res!110229 e!88010)))

(declare-fun lt!204933 () tuple2!11534)

(assert (=> b!132740 (= res!110229 (or (not (= (size!2769 (_2!6072 lt!204930)) (size!2769 arr!237))) (not (= (_1!6072 lt!204930) (_2!6073 lt!204933)))))))

(assert (=> b!132740 (= lt!204930 (readByteArrayLoopPure!0 (_1!6073 lt!204933) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!132740 (validate_offset_bits!1 ((_ sign_extend 32) (size!2769 (buf!3142 (_2!6071 lt!204948)))) ((_ sign_extend 32) (currentByte!5927 (_2!6071 lt!204929))) ((_ sign_extend 32) (currentBit!5922 (_2!6071 lt!204929))) lt!204940)))

(declare-fun lt!204931 () Unit!8170)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4802 array!6116 (_ BitVec 64)) Unit!8170)

(assert (=> b!132740 (= lt!204931 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6071 lt!204929) (buf!3142 (_2!6071 lt!204948)) lt!204940))))

(assert (=> b!132740 (= lt!204933 (reader!0 (_2!6071 lt!204929) (_2!6071 lt!204948)))))

(assert (= (and start!25946 res!110235) b!132736))

(assert (= (and b!132736 res!110237) b!132729))

(assert (= (and b!132729 res!110236) b!132737))

(assert (= (and b!132737 res!110238) b!132738))

(assert (= (and b!132738 res!110232) b!132732))

(assert (= (and b!132732 res!110227) b!132739))

(assert (= (and b!132739 res!110233) b!132733))

(assert (= (and b!132738 res!110239) b!132728))

(assert (= (and b!132728 res!110230) b!132735))

(assert (= (and b!132735 res!110228) b!132740))

(assert (= (and b!132740 (not res!110229)) b!132730))

(assert (= (and b!132738 res!110231) b!132734))

(assert (= (and b!132738 res!110234) b!132727))

(assert (= start!25946 b!132731))

(declare-fun m!200627 () Bool)

(assert (=> b!132740 m!200627))

(declare-fun m!200629 () Bool)

(assert (=> b!132740 m!200629))

(declare-fun m!200631 () Bool)

(assert (=> b!132740 m!200631))

(declare-fun m!200633 () Bool)

(assert (=> b!132740 m!200633))

(declare-fun m!200635 () Bool)

(assert (=> b!132735 m!200635))

(declare-fun m!200637 () Bool)

(assert (=> start!25946 m!200637))

(declare-fun m!200639 () Bool)

(assert (=> start!25946 m!200639))

(declare-fun m!200641 () Bool)

(assert (=> b!132733 m!200641))

(declare-fun m!200643 () Bool)

(assert (=> b!132733 m!200643))

(declare-fun m!200645 () Bool)

(assert (=> b!132733 m!200645))

(declare-fun m!200647 () Bool)

(assert (=> b!132736 m!200647))

(declare-fun m!200649 () Bool)

(assert (=> b!132731 m!200649))

(declare-fun m!200651 () Bool)

(assert (=> b!132728 m!200651))

(declare-fun m!200653 () Bool)

(assert (=> b!132728 m!200653))

(declare-fun m!200655 () Bool)

(assert (=> b!132739 m!200655))

(declare-fun m!200657 () Bool)

(assert (=> b!132730 m!200657))

(assert (=> b!132738 m!200633))

(declare-fun m!200659 () Bool)

(assert (=> b!132738 m!200659))

(declare-fun m!200661 () Bool)

(assert (=> b!132738 m!200661))

(declare-fun m!200663 () Bool)

(assert (=> b!132738 m!200663))

(declare-fun m!200665 () Bool)

(assert (=> b!132738 m!200665))

(declare-fun m!200667 () Bool)

(assert (=> b!132738 m!200667))

(declare-fun m!200669 () Bool)

(assert (=> b!132738 m!200669))

(declare-fun m!200671 () Bool)

(assert (=> b!132738 m!200671))

(declare-fun m!200673 () Bool)

(assert (=> b!132738 m!200673))

(declare-fun m!200675 () Bool)

(assert (=> b!132738 m!200675))

(declare-fun m!200677 () Bool)

(assert (=> b!132738 m!200677))

(assert (=> b!132738 m!200641))

(declare-fun m!200679 () Bool)

(assert (=> b!132738 m!200679))

(declare-fun m!200681 () Bool)

(assert (=> b!132738 m!200681))

(declare-fun m!200683 () Bool)

(assert (=> b!132738 m!200683))

(declare-fun m!200685 () Bool)

(assert (=> b!132738 m!200685))

(declare-fun m!200687 () Bool)

(assert (=> b!132738 m!200687))

(declare-fun m!200689 () Bool)

(assert (=> b!132738 m!200689))

(declare-fun m!200691 () Bool)

(assert (=> b!132738 m!200691))

(declare-fun m!200693 () Bool)

(assert (=> b!132738 m!200693))

(declare-fun m!200695 () Bool)

(assert (=> b!132738 m!200695))

(declare-fun m!200697 () Bool)

(assert (=> b!132738 m!200697))

(assert (=> b!132738 m!200671))

(declare-fun m!200699 () Bool)

(assert (=> b!132738 m!200699))

(declare-fun m!200701 () Bool)

(assert (=> b!132738 m!200701))

(declare-fun m!200703 () Bool)

(assert (=> b!132738 m!200703))

(declare-fun m!200705 () Bool)

(assert (=> b!132738 m!200705))

(assert (=> b!132738 m!200641))

(assert (=> b!132732 m!200653))

(declare-fun m!200707 () Bool)

(assert (=> b!132732 m!200707))

(declare-fun m!200709 () Bool)

(assert (=> b!132734 m!200709))

(declare-fun m!200711 () Bool)

(assert (=> b!132737 m!200711))

(push 1)

(assert (not b!132737))

(assert (not b!132740))

(assert (not b!132730))

(assert (not b!132736))

(assert (not b!132728))

(assert (not b!132732))

(assert (not start!25946))

(assert (not b!132733))

(assert (not b!132731))

(assert (not b!132734))

(assert (not b!132735))

(assert (not b!132738))

(assert (not b!132739))

(check-sat)

(pop 1)

(push 1)

(check-sat)

