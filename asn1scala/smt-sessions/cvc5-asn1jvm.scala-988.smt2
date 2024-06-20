; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27782 () Bool)

(assert start!27782)

(declare-datatypes ((array!6539 0))(
  ( (array!6540 (arr!3682 (Array (_ BitVec 32) (_ BitVec 8))) (size!2959 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5176 0))(
  ( (BitStream!5177 (buf!3388 array!6539) (currentByte!6272 (_ BitVec 32)) (currentBit!6267 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!12704 0))(
  ( (tuple2!12705 (_1!6693 BitStream!5176) (_2!6693 BitStream!5176)) )
))
(declare-fun lt!221861 () tuple2!12704)

(declare-datatypes ((tuple2!12706 0))(
  ( (tuple2!12707 (_1!6694 BitStream!5176) (_2!6694 (_ BitVec 8))) )
))
(declare-fun lt!221872 () tuple2!12706)

(declare-fun arr!237 () array!6539)

(declare-fun e!95263 () Bool)

(declare-fun b!143038 () Bool)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!143038 (= e!95263 (and (= (_2!6694 lt!221872) (select (arr!3682 arr!237) from!447)) (= (_1!6694 lt!221872) (_2!6693 lt!221861))))))

(declare-fun readBytePure!0 (BitStream!5176) tuple2!12706)

(assert (=> b!143038 (= lt!221872 (readBytePure!0 (_1!6693 lt!221861)))))

(declare-fun thiss!1634 () BitStream!5176)

(declare-datatypes ((Unit!8918 0))(
  ( (Unit!8919) )
))
(declare-datatypes ((tuple2!12708 0))(
  ( (tuple2!12709 (_1!6695 Unit!8918) (_2!6695 BitStream!5176)) )
))
(declare-fun lt!221867 () tuple2!12708)

(declare-fun reader!0 (BitStream!5176 BitStream!5176) tuple2!12704)

(assert (=> b!143038 (= lt!221861 (reader!0 thiss!1634 (_2!6695 lt!221867)))))

(declare-fun b!143039 () Bool)

(declare-fun e!95266 () Bool)

(declare-fun e!95271 () Bool)

(assert (=> b!143039 (= e!95266 (not e!95271))))

(declare-fun res!119428 () Bool)

(assert (=> b!143039 (=> res!119428 e!95271)))

(declare-fun lt!221870 () tuple2!12704)

(declare-datatypes ((tuple2!12710 0))(
  ( (tuple2!12711 (_1!6696 BitStream!5176) (_2!6696 array!6539)) )
))
(declare-fun lt!221857 () tuple2!12710)

(assert (=> b!143039 (= res!119428 (or (not (= (size!2959 (_2!6696 lt!221857)) (size!2959 arr!237))) (not (= (_1!6696 lt!221857) (_2!6693 lt!221870)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!5176 array!6539 (_ BitVec 32) (_ BitVec 32)) tuple2!12710)

(assert (=> b!143039 (= lt!221857 (readByteArrayLoopPure!0 (_1!6693 lt!221870) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!221858 () tuple2!12708)

(declare-fun lt!221859 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!143039 (validate_offset_bits!1 ((_ sign_extend 32) (size!2959 (buf!3388 (_2!6695 lt!221858)))) ((_ sign_extend 32) (currentByte!6272 (_2!6695 lt!221867))) ((_ sign_extend 32) (currentBit!6267 (_2!6695 lt!221867))) lt!221859)))

(declare-fun lt!221860 () Unit!8918)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5176 array!6539 (_ BitVec 64)) Unit!8918)

(assert (=> b!143039 (= lt!221860 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6695 lt!221867) (buf!3388 (_2!6695 lt!221858)) lt!221859))))

(assert (=> b!143039 (= lt!221870 (reader!0 (_2!6695 lt!221867) (_2!6695 lt!221858)))))

(declare-fun res!119437 () Bool)

(declare-fun e!95270 () Bool)

(assert (=> start!27782 (=> (not res!119437) (not e!95270))))

(assert (=> start!27782 (= res!119437 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2959 arr!237))))))

(assert (=> start!27782 e!95270))

(assert (=> start!27782 true))

(declare-fun array_inv!2748 (array!6539) Bool)

(assert (=> start!27782 (array_inv!2748 arr!237)))

(declare-fun e!95262 () Bool)

(declare-fun inv!12 (BitStream!5176) Bool)

(assert (=> start!27782 (and (inv!12 thiss!1634) e!95262)))

(declare-fun b!143040 () Bool)

(declare-fun res!119438 () Bool)

(assert (=> b!143040 (=> (not res!119438) (not e!95263))))

(declare-fun isPrefixOf!0 (BitStream!5176 BitStream!5176) Bool)

(assert (=> b!143040 (= res!119438 (isPrefixOf!0 thiss!1634 (_2!6695 lt!221867)))))

(declare-fun b!143041 () Bool)

(declare-fun e!95264 () Bool)

(assert (=> b!143041 (= e!95264 e!95266)))

(declare-fun res!119427 () Bool)

(assert (=> b!143041 (=> (not res!119427) (not e!95266))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!143041 (= res!119427 (= (bitIndex!0 (size!2959 (buf!3388 (_2!6695 lt!221858))) (currentByte!6272 (_2!6695 lt!221858)) (currentBit!6267 (_2!6695 lt!221858))) (bvadd (bitIndex!0 (size!2959 (buf!3388 (_2!6695 lt!221867))) (currentByte!6272 (_2!6695 lt!221867)) (currentBit!6267 (_2!6695 lt!221867))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!221859))))))

(assert (=> b!143041 (= lt!221859 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!143042 () Bool)

(declare-fun res!119429 () Bool)

(assert (=> b!143042 (=> (not res!119429) (not e!95270))))

(assert (=> b!143042 (= res!119429 (bvslt from!447 to!404))))

(declare-fun b!143043 () Bool)

(declare-fun e!95267 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!143043 (= e!95267 (invariant!0 (currentBit!6267 thiss!1634) (currentByte!6272 thiss!1634) (size!2959 (buf!3388 (_2!6695 lt!221867)))))))

(declare-fun b!143044 () Bool)

(assert (=> b!143044 (= e!95262 (array_inv!2748 (buf!3388 thiss!1634)))))

(declare-fun b!143045 () Bool)

(declare-fun res!119433 () Bool)

(assert (=> b!143045 (=> (not res!119433) (not e!95263))))

(assert (=> b!143045 (= res!119433 (= (bitIndex!0 (size!2959 (buf!3388 (_2!6695 lt!221867))) (currentByte!6272 (_2!6695 lt!221867)) (currentBit!6267 (_2!6695 lt!221867))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2959 (buf!3388 thiss!1634)) (currentByte!6272 thiss!1634) (currentBit!6267 thiss!1634)))))))

(declare-fun b!143046 () Bool)

(declare-fun e!95265 () Bool)

(declare-fun lt!221871 () tuple2!12706)

(declare-fun lt!221862 () tuple2!12706)

(assert (=> b!143046 (= e!95265 (= (_2!6694 lt!221871) (_2!6694 lt!221862)))))

(declare-fun b!143047 () Bool)

(declare-fun res!119426 () Bool)

(assert (=> b!143047 (=> (not res!119426) (not e!95266))))

(assert (=> b!143047 (= res!119426 (isPrefixOf!0 (_2!6695 lt!221867) (_2!6695 lt!221858)))))

(declare-fun b!143048 () Bool)

(assert (=> b!143048 (= e!95270 (not (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))))

(declare-fun lt!221869 () tuple2!12704)

(assert (=> b!143048 (= (_2!6694 (readBytePure!0 (_1!6693 lt!221869))) (select (arr!3682 arr!237) from!447))))

(declare-fun lt!221864 () tuple2!12704)

(assert (=> b!143048 (= lt!221864 (reader!0 (_2!6695 lt!221867) (_2!6695 lt!221858)))))

(assert (=> b!143048 (= lt!221869 (reader!0 thiss!1634 (_2!6695 lt!221858)))))

(assert (=> b!143048 e!95265))

(declare-fun res!119436 () Bool)

(assert (=> b!143048 (=> (not res!119436) (not e!95265))))

(assert (=> b!143048 (= res!119436 (= (bitIndex!0 (size!2959 (buf!3388 (_1!6694 lt!221871))) (currentByte!6272 (_1!6694 lt!221871)) (currentBit!6267 (_1!6694 lt!221871))) (bitIndex!0 (size!2959 (buf!3388 (_1!6694 lt!221862))) (currentByte!6272 (_1!6694 lt!221862)) (currentBit!6267 (_1!6694 lt!221862)))))))

(declare-fun lt!221863 () Unit!8918)

(declare-fun lt!221865 () BitStream!5176)

(declare-fun readBytePrefixLemma!0 (BitStream!5176 BitStream!5176) Unit!8918)

(assert (=> b!143048 (= lt!221863 (readBytePrefixLemma!0 lt!221865 (_2!6695 lt!221858)))))

(assert (=> b!143048 (= lt!221862 (readBytePure!0 (BitStream!5177 (buf!3388 (_2!6695 lt!221858)) (currentByte!6272 thiss!1634) (currentBit!6267 thiss!1634))))))

(assert (=> b!143048 (= lt!221871 (readBytePure!0 lt!221865))))

(assert (=> b!143048 (= lt!221865 (BitStream!5177 (buf!3388 (_2!6695 lt!221867)) (currentByte!6272 thiss!1634) (currentBit!6267 thiss!1634)))))

(assert (=> b!143048 e!95267))

(declare-fun res!119430 () Bool)

(assert (=> b!143048 (=> (not res!119430) (not e!95267))))

(assert (=> b!143048 (= res!119430 (isPrefixOf!0 thiss!1634 (_2!6695 lt!221858)))))

(declare-fun lt!221866 () Unit!8918)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5176 BitStream!5176 BitStream!5176) Unit!8918)

(assert (=> b!143048 (= lt!221866 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6695 lt!221867) (_2!6695 lt!221858)))))

(assert (=> b!143048 e!95264))

(declare-fun res!119431 () Bool)

(assert (=> b!143048 (=> (not res!119431) (not e!95264))))

(assert (=> b!143048 (= res!119431 (= (size!2959 (buf!3388 (_2!6695 lt!221867))) (size!2959 (buf!3388 (_2!6695 lt!221858)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5176 array!6539 (_ BitVec 32) (_ BitVec 32)) tuple2!12708)

(assert (=> b!143048 (= lt!221858 (appendByteArrayLoop!0 (_2!6695 lt!221867) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!143048 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2959 (buf!3388 (_2!6695 lt!221867)))) ((_ sign_extend 32) (currentByte!6272 (_2!6695 lt!221867))) ((_ sign_extend 32) (currentBit!6267 (_2!6695 lt!221867))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!221868 () Unit!8918)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5176 BitStream!5176 (_ BitVec 64) (_ BitVec 32)) Unit!8918)

(assert (=> b!143048 (= lt!221868 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6695 lt!221867) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!143048 e!95263))

(declare-fun res!119435 () Bool)

(assert (=> b!143048 (=> (not res!119435) (not e!95263))))

(assert (=> b!143048 (= res!119435 (= (size!2959 (buf!3388 thiss!1634)) (size!2959 (buf!3388 (_2!6695 lt!221867)))))))

(declare-fun appendByte!0 (BitStream!5176 (_ BitVec 8)) tuple2!12708)

(assert (=> b!143048 (= lt!221867 (appendByte!0 thiss!1634 (select (arr!3682 arr!237) from!447)))))

(declare-fun b!143049 () Bool)

(declare-fun res!119432 () Bool)

(assert (=> b!143049 (=> (not res!119432) (not e!95270))))

(assert (=> b!143049 (= res!119432 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2959 (buf!3388 thiss!1634))) ((_ sign_extend 32) (currentByte!6272 thiss!1634)) ((_ sign_extend 32) (currentBit!6267 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!143050 () Bool)

(declare-fun arrayRangesEq!275 (array!6539 array!6539 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!143050 (= e!95271 (not (arrayRangesEq!275 arr!237 (_2!6696 lt!221857) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!143051 () Bool)

(declare-fun res!119434 () Bool)

(assert (=> b!143051 (=> (not res!119434) (not e!95270))))

(assert (=> b!143051 (= res!119434 (invariant!0 (currentBit!6267 thiss!1634) (currentByte!6272 thiss!1634) (size!2959 (buf!3388 thiss!1634))))))

(assert (= (and start!27782 res!119437) b!143049))

(assert (= (and b!143049 res!119432) b!143042))

(assert (= (and b!143042 res!119429) b!143051))

(assert (= (and b!143051 res!119434) b!143048))

(assert (= (and b!143048 res!119435) b!143045))

(assert (= (and b!143045 res!119433) b!143040))

(assert (= (and b!143040 res!119438) b!143038))

(assert (= (and b!143048 res!119431) b!143041))

(assert (= (and b!143041 res!119427) b!143047))

(assert (= (and b!143047 res!119426) b!143039))

(assert (= (and b!143039 (not res!119428)) b!143050))

(assert (= (and b!143048 res!119430) b!143043))

(assert (= (and b!143048 res!119436) b!143046))

(assert (= start!27782 b!143044))

(declare-fun m!219613 () Bool)

(assert (=> b!143049 m!219613))

(declare-fun m!219615 () Bool)

(assert (=> b!143050 m!219615))

(declare-fun m!219617 () Bool)

(assert (=> b!143043 m!219617))

(declare-fun m!219619 () Bool)

(assert (=> b!143040 m!219619))

(declare-fun m!219621 () Bool)

(assert (=> b!143045 m!219621))

(declare-fun m!219623 () Bool)

(assert (=> b!143045 m!219623))

(declare-fun m!219625 () Bool)

(assert (=> b!143039 m!219625))

(declare-fun m!219627 () Bool)

(assert (=> b!143039 m!219627))

(declare-fun m!219629 () Bool)

(assert (=> b!143039 m!219629))

(declare-fun m!219631 () Bool)

(assert (=> b!143039 m!219631))

(declare-fun m!219633 () Bool)

(assert (=> b!143038 m!219633))

(declare-fun m!219635 () Bool)

(assert (=> b!143038 m!219635))

(declare-fun m!219637 () Bool)

(assert (=> b!143038 m!219637))

(declare-fun m!219639 () Bool)

(assert (=> b!143041 m!219639))

(assert (=> b!143041 m!219621))

(declare-fun m!219641 () Bool)

(assert (=> b!143048 m!219641))

(declare-fun m!219643 () Bool)

(assert (=> b!143048 m!219643))

(declare-fun m!219645 () Bool)

(assert (=> b!143048 m!219645))

(declare-fun m!219647 () Bool)

(assert (=> b!143048 m!219647))

(assert (=> b!143048 m!219631))

(declare-fun m!219649 () Bool)

(assert (=> b!143048 m!219649))

(declare-fun m!219651 () Bool)

(assert (=> b!143048 m!219651))

(declare-fun m!219653 () Bool)

(assert (=> b!143048 m!219653))

(assert (=> b!143048 m!219633))

(declare-fun m!219655 () Bool)

(assert (=> b!143048 m!219655))

(declare-fun m!219657 () Bool)

(assert (=> b!143048 m!219657))

(assert (=> b!143048 m!219633))

(declare-fun m!219659 () Bool)

(assert (=> b!143048 m!219659))

(declare-fun m!219661 () Bool)

(assert (=> b!143048 m!219661))

(declare-fun m!219663 () Bool)

(assert (=> b!143048 m!219663))

(declare-fun m!219665 () Bool)

(assert (=> b!143048 m!219665))

(declare-fun m!219667 () Bool)

(assert (=> start!27782 m!219667))

(declare-fun m!219669 () Bool)

(assert (=> start!27782 m!219669))

(declare-fun m!219671 () Bool)

(assert (=> b!143051 m!219671))

(declare-fun m!219673 () Bool)

(assert (=> b!143047 m!219673))

(declare-fun m!219675 () Bool)

(assert (=> b!143044 m!219675))

(push 1)

(assert (not b!143047))

(assert (not b!143044))

(assert (not b!143051))

(assert (not b!143043))

(assert (not b!143050))

(assert (not b!143040))

(assert (not b!143048))

(assert (not start!27782))

(assert (not b!143041))

(assert (not b!143038))

(assert (not b!143045))

(assert (not b!143039))

(assert (not b!143049))

(check-sat)

(pop 1)

(push 1)

(check-sat)

