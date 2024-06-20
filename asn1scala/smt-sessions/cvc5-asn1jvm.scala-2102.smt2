; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53334 () Bool)

(assert start!53334)

(declare-fun b!247566 () Bool)

(declare-fun res!207179 () Bool)

(declare-fun e!171510 () Bool)

(assert (=> b!247566 (=> (not res!207179) (not e!171510))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!247566 (= res!207179 (bvsge from!289 nBits!297))))

(declare-fun b!247567 () Bool)

(declare-fun e!171509 () Bool)

(declare-fun e!171508 () Bool)

(assert (=> b!247567 (= e!171509 e!171508)))

(declare-fun res!207182 () Bool)

(assert (=> b!247567 (=> res!207182 e!171508)))

(declare-fun lt!385914 () (_ BitVec 64))

(assert (=> b!247567 (= res!207182 (not (= lt!385914 (bvadd lt!385914 (bvsub nBits!297 from!289)))))))

(declare-datatypes ((array!13504 0))(
  ( (array!13505 (arr!6907 (Array (_ BitVec 32) (_ BitVec 8))) (size!5920 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10762 0))(
  ( (BitStream!10763 (buf!6404 array!13504) (currentByte!11817 (_ BitVec 32)) (currentBit!11812 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10762)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!247567 (= lt!385914 (bitIndex!0 (size!5920 (buf!6404 thiss!1005)) (currentByte!11817 thiss!1005) (currentBit!11812 thiss!1005)))))

(declare-fun b!247568 () Bool)

(assert (=> b!247568 (= e!171510 (not e!171509))))

(declare-fun res!207181 () Bool)

(assert (=> b!247568 (=> res!207181 e!171509)))

(assert (=> b!247568 (= res!207181 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!10762 BitStream!10762) Bool)

(assert (=> b!247568 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!17958 0))(
  ( (Unit!17959) )
))
(declare-fun lt!385913 () Unit!17958)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10762) Unit!17958)

(assert (=> b!247568 (= lt!385913 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!247569 () Bool)

(declare-fun e!171512 () Bool)

(declare-fun array_inv!5661 (array!13504) Bool)

(assert (=> b!247569 (= e!171512 (array_inv!5661 (buf!6404 thiss!1005)))))

(declare-fun b!247570 () Bool)

(assert (=> b!247570 (= e!171508 true)))

(declare-datatypes ((tuple2!21228 0))(
  ( (tuple2!21229 (_1!11536 BitStream!10762) (_2!11536 BitStream!10762)) )
))
(declare-fun lt!385912 () tuple2!21228)

(declare-fun reader!0 (BitStream!10762 BitStream!10762) tuple2!21228)

(assert (=> b!247570 (= lt!385912 (reader!0 thiss!1005 thiss!1005))))

(declare-fun res!207183 () Bool)

(assert (=> start!53334 (=> (not res!207183) (not e!171510))))

(assert (=> start!53334 (= res!207183 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53334 e!171510))

(assert (=> start!53334 true))

(declare-fun inv!12 (BitStream!10762) Bool)

(assert (=> start!53334 (and (inv!12 thiss!1005) e!171512)))

(declare-fun b!247571 () Bool)

(declare-fun res!207180 () Bool)

(assert (=> b!247571 (=> (not res!207180) (not e!171510))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247571 (= res!207180 (validate_offset_bits!1 ((_ sign_extend 32) (size!5920 (buf!6404 thiss!1005))) ((_ sign_extend 32) (currentByte!11817 thiss!1005)) ((_ sign_extend 32) (currentBit!11812 thiss!1005)) (bvsub nBits!297 from!289)))))

(assert (= (and start!53334 res!207183) b!247571))

(assert (= (and b!247571 res!207180) b!247566))

(assert (= (and b!247566 res!207179) b!247568))

(assert (= (and b!247568 (not res!207181)) b!247567))

(assert (= (and b!247567 (not res!207182)) b!247570))

(assert (= start!53334 b!247569))

(declare-fun m!373251 () Bool)

(assert (=> b!247567 m!373251))

(declare-fun m!373253 () Bool)

(assert (=> b!247571 m!373253))

(declare-fun m!373255 () Bool)

(assert (=> b!247570 m!373255))

(declare-fun m!373257 () Bool)

(assert (=> b!247568 m!373257))

(declare-fun m!373259 () Bool)

(assert (=> b!247568 m!373259))

(declare-fun m!373261 () Bool)

(assert (=> b!247569 m!373261))

(declare-fun m!373263 () Bool)

(assert (=> start!53334 m!373263))

(push 1)

(assert (not b!247571))

(assert (not b!247568))

(assert (not start!53334))

(assert (not b!247570))

(assert (not b!247569))

(assert (not b!247567))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

