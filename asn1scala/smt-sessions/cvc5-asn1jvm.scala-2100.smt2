; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53322 () Bool)

(assert start!53322)

(declare-fun b!247458 () Bool)

(declare-fun e!171418 () Bool)

(declare-fun e!171422 () Bool)

(assert (=> b!247458 (= e!171418 e!171422)))

(declare-fun res!207093 () Bool)

(assert (=> b!247458 (=> res!207093 e!171422)))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun lt!385860 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!247458 (= res!207093 (not (= lt!385860 (bvadd lt!385860 (bvsub nBits!297 from!289)))))))

(declare-datatypes ((array!13492 0))(
  ( (array!13493 (arr!6901 (Array (_ BitVec 32) (_ BitVec 8))) (size!5914 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10750 0))(
  ( (BitStream!10751 (buf!6398 array!13492) (currentByte!11811 (_ BitVec 32)) (currentBit!11806 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10750)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!247458 (= lt!385860 (bitIndex!0 (size!5914 (buf!6398 thiss!1005)) (currentByte!11811 thiss!1005) (currentBit!11806 thiss!1005)))))

(declare-fun b!247459 () Bool)

(declare-fun e!171421 () Bool)

(declare-fun array_inv!5655 (array!13492) Bool)

(assert (=> b!247459 (= e!171421 (array_inv!5655 (buf!6398 thiss!1005)))))

(declare-fun res!207091 () Bool)

(declare-fun e!171420 () Bool)

(assert (=> start!53322 (=> (not res!207091) (not e!171420))))

(assert (=> start!53322 (= res!207091 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53322 e!171420))

(assert (=> start!53322 true))

(declare-fun inv!12 (BitStream!10750) Bool)

(assert (=> start!53322 (and (inv!12 thiss!1005) e!171421)))

(declare-fun b!247460 () Bool)

(declare-fun res!207089 () Bool)

(assert (=> b!247460 (=> (not res!207089) (not e!171420))))

(assert (=> b!247460 (= res!207089 (bvsge from!289 nBits!297))))

(declare-fun b!247461 () Bool)

(assert (=> b!247461 (= e!171420 (not e!171418))))

(declare-fun res!207090 () Bool)

(assert (=> b!247461 (=> res!207090 e!171418)))

(assert (=> b!247461 (= res!207090 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!10750 BitStream!10750) Bool)

(assert (=> b!247461 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!17946 0))(
  ( (Unit!17947) )
))
(declare-fun lt!385859 () Unit!17946)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10750) Unit!17946)

(assert (=> b!247461 (= lt!385859 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!247462 () Bool)

(declare-fun res!207092 () Bool)

(assert (=> b!247462 (=> (not res!207092) (not e!171420))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247462 (= res!207092 (validate_offset_bits!1 ((_ sign_extend 32) (size!5914 (buf!6398 thiss!1005))) ((_ sign_extend 32) (currentByte!11811 thiss!1005)) ((_ sign_extend 32) (currentBit!11806 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!247463 () Bool)

(assert (=> b!247463 (= e!171422 true)))

(declare-datatypes ((tuple2!21216 0))(
  ( (tuple2!21217 (_1!11530 BitStream!10750) (_2!11530 BitStream!10750)) )
))
(declare-fun lt!385858 () tuple2!21216)

(declare-fun reader!0 (BitStream!10750 BitStream!10750) tuple2!21216)

(assert (=> b!247463 (= lt!385858 (reader!0 thiss!1005 thiss!1005))))

(assert (= (and start!53322 res!207091) b!247462))

(assert (= (and b!247462 res!207092) b!247460))

(assert (= (and b!247460 res!207089) b!247461))

(assert (= (and b!247461 (not res!207090)) b!247458))

(assert (= (and b!247458 (not res!207093)) b!247463))

(assert (= start!53322 b!247459))

(declare-fun m!373167 () Bool)

(assert (=> b!247461 m!373167))

(declare-fun m!373169 () Bool)

(assert (=> b!247461 m!373169))

(declare-fun m!373171 () Bool)

(assert (=> b!247462 m!373171))

(declare-fun m!373173 () Bool)

(assert (=> b!247459 m!373173))

(declare-fun m!373175 () Bool)

(assert (=> b!247463 m!373175))

(declare-fun m!373177 () Bool)

(assert (=> b!247458 m!373177))

(declare-fun m!373179 () Bool)

(assert (=> start!53322 m!373179))

(push 1)

(assert (not b!247459))

(assert (not b!247458))

(assert (not b!247461))

(assert (not b!247462))

(assert (not start!53322))

(assert (not b!247463))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

