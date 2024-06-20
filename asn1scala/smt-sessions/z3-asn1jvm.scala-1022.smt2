; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29310 () Bool)

(assert start!29310)

(declare-fun b!151888 () Bool)

(declare-fun res!127365 () Bool)

(declare-fun e!101500 () Bool)

(assert (=> b!151888 (=> (not res!127365) (not e!101500))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!151888 (= res!127365 (bvsge from!447 to!404))))

(declare-fun b!151889 () Bool)

(declare-fun e!101498 () Bool)

(declare-datatypes ((array!6769 0))(
  ( (array!6770 (arr!3879 (Array (_ BitVec 32) (_ BitVec 8))) (size!3062 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5382 0))(
  ( (BitStream!5383 (buf!3559 array!6769) (currentByte!6491 (_ BitVec 32)) (currentBit!6486 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5382)

(declare-fun array_inv!2851 (array!6769) Bool)

(assert (=> b!151889 (= e!101498 (array_inv!2851 (buf!3559 thiss!1634)))))

(declare-fun b!151890 () Bool)

(declare-fun e!101502 () Bool)

(assert (=> b!151890 (= e!101502 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000))))))

(declare-datatypes ((tuple2!13518 0))(
  ( (tuple2!13519 (_1!7134 BitStream!5382) (_2!7134 BitStream!5382)) )
))
(declare-fun lt!237936 () tuple2!13518)

(declare-fun reader!0 (BitStream!5382 BitStream!5382) tuple2!13518)

(assert (=> b!151890 (= lt!237936 (reader!0 thiss!1634 thiss!1634))))

(declare-fun b!151892 () Bool)

(assert (=> b!151892 (= e!101500 (not e!101502))))

(declare-fun res!127367 () Bool)

(assert (=> b!151892 (=> res!127367 e!101502)))

(declare-fun lt!237937 () (_ BitVec 64))

(assert (=> b!151892 (= res!127367 (not (= lt!237937 (bvadd lt!237937 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!404 from!447)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!151892 (= lt!237937 (bitIndex!0 (size!3062 (buf!3559 thiss!1634)) (currentByte!6491 thiss!1634) (currentBit!6486 thiss!1634)))))

(declare-fun isPrefixOf!0 (BitStream!5382 BitStream!5382) Bool)

(assert (=> b!151892 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!9636 0))(
  ( (Unit!9637) )
))
(declare-fun lt!237935 () Unit!9636)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5382) Unit!9636)

(assert (=> b!151892 (= lt!237935 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!151891 () Bool)

(declare-fun res!127368 () Bool)

(assert (=> b!151891 (=> (not res!127368) (not e!101500))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!151891 (= res!127368 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3062 (buf!3559 thiss!1634))) ((_ sign_extend 32) (currentByte!6491 thiss!1634)) ((_ sign_extend 32) (currentBit!6486 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!127366 () Bool)

(assert (=> start!29310 (=> (not res!127366) (not e!101500))))

(declare-fun arr!237 () array!6769)

(assert (=> start!29310 (= res!127366 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3062 arr!237))))))

(assert (=> start!29310 e!101500))

(assert (=> start!29310 true))

(assert (=> start!29310 (array_inv!2851 arr!237)))

(declare-fun inv!12 (BitStream!5382) Bool)

(assert (=> start!29310 (and (inv!12 thiss!1634) e!101498)))

(assert (= (and start!29310 res!127366) b!151891))

(assert (= (and b!151891 res!127368) b!151888))

(assert (= (and b!151888 res!127365) b!151892))

(assert (= (and b!151892 (not res!127367)) b!151890))

(assert (= start!29310 b!151889))

(declare-fun m!237599 () Bool)

(assert (=> start!29310 m!237599))

(declare-fun m!237601 () Bool)

(assert (=> start!29310 m!237601))

(declare-fun m!237603 () Bool)

(assert (=> b!151891 m!237603))

(declare-fun m!237605 () Bool)

(assert (=> b!151890 m!237605))

(declare-fun m!237607 () Bool)

(assert (=> b!151892 m!237607))

(declare-fun m!237609 () Bool)

(assert (=> b!151892 m!237609))

(declare-fun m!237611 () Bool)

(assert (=> b!151892 m!237611))

(declare-fun m!237613 () Bool)

(assert (=> b!151889 m!237613))

(check-sat (not b!151892) (not b!151891) (not start!29310) (not b!151889) (not b!151890))
