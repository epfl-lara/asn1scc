; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4838 () Bool)

(assert start!4838)

(declare-fun b!19108 () Bool)

(declare-fun e!12556 () Bool)

(declare-fun e!12560 () Bool)

(assert (=> b!19108 (= e!12556 e!12560)))

(declare-fun res!16712 () Bool)

(assert (=> b!19108 (=> res!16712 e!12560)))

(declare-datatypes ((array!1362 0))(
  ( (array!1363 (arr!1017 (Array (_ BitVec 32) (_ BitVec 8))) (size!576 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!986 0))(
  ( (BitStream!987 (buf!876 array!1362) (currentByte!2156 (_ BitVec 32)) (currentBit!2151 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!986)

(declare-datatypes ((Unit!1696 0))(
  ( (Unit!1697) )
))
(declare-datatypes ((tuple2!2160 0))(
  ( (tuple2!2161 (_1!1165 Unit!1696) (_2!1165 BitStream!986)) )
))
(declare-fun lt!27165 () tuple2!2160)

(assert (=> b!19108 (= res!16712 (not (= (size!576 (buf!876 thiss!1379)) (size!576 (buf!876 (_2!1165 lt!27165))))))))

(declare-fun srcBuffer!2 () array!1362)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun appendBitFromByte!0 (BitStream!986 (_ BitVec 8) (_ BitVec 32)) tuple2!2160)

(assert (=> b!19108 (= lt!27165 (appendBitFromByte!0 thiss!1379 (select (arr!1017 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!19109 () Bool)

(declare-fun e!12558 () Bool)

(declare-fun array_inv!546 (array!1362) Bool)

(assert (=> b!19109 (= e!12558 (array_inv!546 (buf!876 thiss!1379)))))

(declare-fun b!19110 () Bool)

(declare-fun e!12557 () Bool)

(assert (=> b!19110 (= e!12557 (not e!12556))))

(declare-fun res!16709 () Bool)

(assert (=> b!19110 (=> res!16709 e!12556)))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!19110 (= res!16709 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!986 BitStream!986) Bool)

(assert (=> b!19110 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!27164 () Unit!1696)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!986) Unit!1696)

(assert (=> b!19110 (= lt!27164 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27163 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19110 (= lt!27163 (bitIndex!0 (size!576 (buf!876 thiss!1379)) (currentByte!2156 thiss!1379) (currentBit!2151 thiss!1379)))))

(declare-fun res!16711 () Bool)

(assert (=> start!4838 (=> (not res!16711) (not e!12557))))

(assert (=> start!4838 (= res!16711 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!576 srcBuffer!2))))))))

(assert (=> start!4838 e!12557))

(assert (=> start!4838 true))

(assert (=> start!4838 (array_inv!546 srcBuffer!2)))

(declare-fun inv!12 (BitStream!986) Bool)

(assert (=> start!4838 (and (inv!12 thiss!1379) e!12558)))

(declare-fun b!19111 () Bool)

(assert (=> b!19111 (= e!12560 true)))

(declare-fun lt!27166 () (_ BitVec 64))

(assert (=> b!19111 (= lt!27166 (bitIndex!0 (size!576 (buf!876 (_2!1165 lt!27165))) (currentByte!2156 (_2!1165 lt!27165)) (currentBit!2151 (_2!1165 lt!27165))))))

(declare-fun b!19112 () Bool)

(declare-fun res!16710 () Bool)

(assert (=> b!19112 (=> (not res!16710) (not e!12557))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19112 (= res!16710 (validate_offset_bits!1 ((_ sign_extend 32) (size!576 (buf!876 thiss!1379))) ((_ sign_extend 32) (currentByte!2156 thiss!1379)) ((_ sign_extend 32) (currentBit!2151 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!4838 res!16711) b!19112))

(assert (= (and b!19112 res!16710) b!19110))

(assert (= (and b!19110 (not res!16709)) b!19108))

(assert (= (and b!19108 (not res!16712)) b!19111))

(assert (= start!4838 b!19109))

(declare-fun m!25615 () Bool)

(assert (=> b!19108 m!25615))

(assert (=> b!19108 m!25615))

(declare-fun m!25617 () Bool)

(assert (=> b!19108 m!25617))

(declare-fun m!25619 () Bool)

(assert (=> b!19112 m!25619))

(declare-fun m!25621 () Bool)

(assert (=> b!19111 m!25621))

(declare-fun m!25623 () Bool)

(assert (=> start!4838 m!25623))

(declare-fun m!25625 () Bool)

(assert (=> start!4838 m!25625))

(declare-fun m!25627 () Bool)

(assert (=> b!19109 m!25627))

(declare-fun m!25629 () Bool)

(assert (=> b!19110 m!25629))

(declare-fun m!25631 () Bool)

(assert (=> b!19110 m!25631))

(declare-fun m!25633 () Bool)

(assert (=> b!19110 m!25633))

(push 1)

(assert (not b!19111))

(assert (not b!19108))

(assert (not b!19110))

(assert (not b!19109))

(assert (not start!4838))

(assert (not b!19112))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

